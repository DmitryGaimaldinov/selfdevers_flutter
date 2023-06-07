import 'dart:convert';
import 'dart:core';

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/api/api.dart';
import 'package:selfdevers/feed/feed_screen.dart';
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
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}


final screenScrollController = ScrollController();


class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final List<Widget> _screens;
  late final PageController _pageController;
  late final List<ScrollController> _scrollControllers;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
    _scrollControllers = [
      ScrollController()..addListener(() => _onScroll(0)),
      ScrollController()..addListener(() => _onScroll(1)),
    ];
    _screens = <Widget>[
      FeedScreen(scrollController: _scrollControllers[0]),
      SearchScreen(scrollController: _scrollControllers[1]),
      NotificationsScreen(),
    ];
  }

  void _onScroll(int controllerIndex) {
    final direction = _scrollControllers[controllerIndex].position.userScrollDirection;

    if (direction == ScrollDirection.forward) {
      ref.read(showFloatingWidgetsProvider.notifier).state = true;
    } else if (direction == ScrollDirection.reverse) {
      ref.read(showFloatingWidgetsProvider.notifier).state = false;
    }
  }

  @override
  void dispose() {
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layoutMode = ref.watch(layoutModeProvider);
    final isMobile = layoutMode == LayoutMode.mobile;
    final isDesktop = layoutMode == LayoutMode.desktop;

    return Scaffold(
      bottomNavigationBar: isMobile
          ? _buildBottomBar()
          : null,
      body: Row(
        children: [
          if (!isMobile)
            Consumer(
              builder: (context, ref, _) {
                final selectedIndex = ref.watch(_selectedIndexProvider);

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            child: Container(
                              constraints: BoxConstraints(minHeight: constraints.maxHeight),
                              color: Theme.of(context).colorScheme.surface,
                              child: Padding(
                                padding: EdgeInsets.only(left: isDesktop ? 16 : 0),
                                child: IntrinsicHeight(
                                  child: NavigationRail(
                                    minWidth: 55.0,
                                    extended: isDesktop,
                                    selectedIndex: selectedIndex,
                                    onDestinationSelected: (index) {
                                      if (index == selectedIndex) {
                                        _scrollControllers[index].animateTo(
                                            0,
                                            duration: Duration(milliseconds: 500),
                                            curve: Curves.easeOut);
                                      } else {
                                        ref.read(_selectedIndexProvider.notifier).state = index;
                                        _pageController.jumpToPage(index);
                                      }
                                    },
                                    labelType: !isDesktop ? NavigationRailLabelType.selected : null,
                                    leading: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                    destinations: const [
                                      NavigationRailDestination(
                                        icon: Icon(Icons.home),
                                        label: Text('Лента'),
                                      ),
                                      NavigationRailDestination(
                                        icon: Icon(Icons.search),
                                        label: Text('Поиск'),
                                      ),
                                      NavigationRailDestination(
                                        icon: Icon(Icons.notifications),
                                        label: Text('Уведомления'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                    VerticalDivider(
                      thickness: 1,
                      width: 1,
                    ),
                  ],
                );
              }
            ),

          Expanded(
            child: Builder(
              builder: (context) {
                final brightness = Brightness.dark;
                final isLight = brightness == Brightness.light;

                var colorScheme = ColorScheme.fromSeed(seedColor: Color(0xff9eff00), brightness: brightness);
                colorScheme = colorScheme.copyWith(
                  surface: isLight ? Colors.white : Colors.black,
                  surfaceVariant: isLight ? Colors.white : Colors.black,
                  background: isLight ? colorScheme.primary.withOpacity(0.05) : null,
                );

                return MaterialApp(
                  scrollBehavior: MyCustomScrollBehavior(),
                  theme: ThemeData(
                    useMaterial3: true,
                    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(
                    //   surface: Colors.white,
                    //   surfaceVariant: Colors.white,
                    //   background: Colors.green.shade50,
                    // ),
                    colorScheme: colorScheme,
                    appBarTheme: AppBarTheme(scrolledUnderElevation: 0),
                    dividerColor: lightColorScheme.surfaceVariant,
                  ),
                  darkTheme: ThemeData(
                    appBarTheme: AppBarTheme(scrolledUnderElevation: 0),
                    useMaterial3: true,
                    // colorScheme: darkColorScheme,
                    // colorSchemeSeed,
                    // dividerColor: darkColorScheme.surfaceVariant,
                  ),
                  debugShowCheckedModeBanner: false,
                  home: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: _screens,
                  ),
                );
              }
            )
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Consumer(
      builder: (context, ref, _) {
        final isShown = ref.watch(showFloatingWidgetsProvider);
        final selectedIndex = ref.watch(_selectedIndexProvider);

        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: isShown ? kBottomNavigationBarHeight : 0,
          child: Wrap(
            children: [
              BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  if (index == selectedIndex) {
                    _scrollControllers[index].animateTo(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  } else {
                    ref.read(_selectedIndexProvider.notifier).state = index;
                    _pageController.jumpToPage(index);
                  }
                },
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
                    icon: Icon(Icons.notifications),
                    label: 'Уведомления',
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
