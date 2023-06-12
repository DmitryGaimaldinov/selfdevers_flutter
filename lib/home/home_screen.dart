import 'dart:convert';
import 'dart:core';

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/feed/feed_screen.dart';
import 'package:selfdevers/home/widgets/notifications_icon.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/notifications/notifications_screen.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';
import 'package:selfdevers/search/search_screen.dart';

import '../profile/user.dart';
import '../styles/color-themes.dart';
import '../utils/my_custom_scroll_behavior.dart';

final showFloatingWidgetsProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

final _selectedIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerStatefulWidget {
  final Widget? child;

  const HomeScreen({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('/feed');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/notifications');
        break;
    }
  }

  int get _bottomBarSelectedIndex {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/feed')) {
      return 0;
    }
    if (location.startsWith('/search')) {
      return 1;
    }
    if (location.startsWith('/notifications')) {
      return 2;
    }
    return 0;
  }

  int get _railSelectedIndex => _bottomBarSelectedIndex;

  IconThemeData get _selectedIconTheme {
    final theme = Theme.of(context);
    return IconThemeData(
      color: theme.colorScheme.primary,
      shadows: [
        for (double i = 0; i < 2; i++)
          Shadow(
            blurRadius: 3 * i,
            color: theme.colorScheme.primary,
          ),
      ],
    );
  }

  TextStyle get _selectedLabelStyle {
    final theme = Theme.of(context);
    return TextStyle(
      color: theme.colorScheme.primary,
      shadows: [
        for (double i = 0; i < 2; i++)
          Shadow(
            blurRadius: 3 * i,
            color: theme.colorScheme.primary,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final layoutMode = ref.watch(layoutModeProvider);
    final isMobile = layoutMode == LayoutMode.mobile;
    final isDesktop = layoutMode == LayoutMode.desktop;

    return LayoutBuilder(builder: (context, constraints) {
      return Consumer(
        builder: (context, ref, child) {
          final LayoutMode layoutMode;
          if (constraints.maxWidth <= 650) {
            layoutMode = LayoutMode.mobile;
          } else if (constraints.maxWidth <= 1200) {
            layoutMode = LayoutMode.tablet;
          } else {
            layoutMode = LayoutMode.desktop;
          }

          Future.microtask(() {
            ref.read(layoutModeProvider.notifier).state = layoutMode;
          });

          return child!;
        },
        child: Scaffold(
          bottomNavigationBar: isMobile ? _buildBottomBar() : null,
          body: Row(
            children: [
              if (!isMobile)
                Consumer(builder: (context, ref, _) {
                  // final selectedIndex = ref.watch(_selectedIndexProvider);

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LayoutBuilder(builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: Container(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            color: Theme.of(context).colorScheme.surface,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: isDesktop ? 16 : 0),
                              child: IntrinsicHeight(
                                child: NavigationRail(
                                  minWidth: 55.0,
                                  extended: isDesktop,
                                  selectedIndex: _railSelectedIndex,
                                  onDestinationSelected: _onTap,
                                  selectedIconTheme: _selectedIconTheme,
                                  selectedLabelTextStyle: _selectedLabelStyle,
                                  labelType: !isDesktop
                                      ? NavigationRailLabelType.selected
                                      : null,
                                  leading: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      CircleAvatar(
                                        radius: 20,
                                        child: Icon(Icons.person),
                                      ),
                                    ],
                                  ),
                                  destinations: [
                                    NavigationRailDestination(
                                      icon: Icon(Icons.home),
                                      label: Text('Лента'),
                                    ),
                                    NavigationRailDestination(
                                      icon: Icon(Icons.search),
                                      label: Text('Поиск'),
                                    ),
                                    NavigationRailDestination(
                                      icon: NotificationsIcon(),
                                      label: Text('Уведомления'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      VerticalDivider(
                        thickness: 1,
                        width: 1,
                      ),
                    ],
                  );
                }),
              if (widget.child != null)
                Expanded(
                  child: widget.child!,
                ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildBottomBar() {
    return Consumer(builder: (context, ref, _) {
      final isShown = ref.watch(showFloatingWidgetsProvider);
      // final selectedIndex = ref.watch(_selectedIndexProvider);

      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: isShown ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              currentIndex: _bottomBarSelectedIndex,
              onTap: _onTap,
              selectedIconTheme: _selectedIconTheme,
              selectedLabelStyle: _selectedLabelStyle,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Лента',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Поиск',
                ),
                BottomNavigationBarItem(
                  icon: NotificationsIcon(),
                  label: 'Уведомления',
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
