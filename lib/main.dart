import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';
import 'package:selfdevers/api/status_codes.dart';
import 'package:selfdevers/api/ws_api.dart';
import 'package:selfdevers/auth/show_login_dialog.dart';
import 'package:selfdevers/note/note_screen.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';
import 'package:selfdevers/screens/error_screen.dart';
import 'package:selfdevers/search/search_screen.dart';
import 'package:selfdevers/settings/settings_screen.dart';
import 'package:selfdevers/utils/my_custom_scroll_behavior.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'api/api.dart';
import 'feed/feed_screen.dart';
import 'notifications/notifications_screen.dart';
import 'home/home_screen.dart';
import 'styles/color-themes.dart';


final screenScrollDeltaController = StreamController<double>.broadcast();
Sink<double> screenScrollDeltaSink = screenScrollDeltaController.sink;
Stream<double> screenScrollDeltaStream = screenScrollDeltaController.stream;

Future<void> main() async {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: lightColorScheme.background,
    // ));

    initializeDateFormatting('ru');

    final container = ProviderContainer();

    container.read(wsApiProvider).initialize().then((_) {
      runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
    });
  }, (error, stackTrace) {
    final context = _rootNavigatorKey.currentContext;

    if (error is DioError) {
      if (error.type == DioErrorType.badResponse) {
        final response = error.response!;
        switch (response.statusCode) {
          case StatusCodes.unauthorized:
            if (context != null) {
              showLoginDialog(context);
            } else {
              Fluttertoast.showToast(msg: 'Авторизуйтесь');
            }
            break;
          default:
            Fluttertoast.showToast(msg: response.data['message']);
            break;
        }
      }
    }
  });
}


enum LayoutMode {
  mobile,
  tablet,
  desktop,
}

final layoutModeProvider = StateProvider<LayoutMode>((ref) {
  return LayoutMode.mobile;
});


final isMobileModeProvider = Provider<bool>((ref) {
  return ref.watch(layoutModeProvider) == LayoutMode.mobile;
});


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/feed',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      // builder: (context, state, child) {
      //   print('sheel route child: $child');
      // },
      builder: (context, state, child) {
        return HomeScreen(child: child);
      },
      routes: [
        GoRoute(
          path: '/feed',
          builder: (context, state) => FeedScreen(),
        ),
        GoRoute(
          path: '/profile/:id',
          builder: (context, state) {
            if (state.pathParameters['id'] == null) {
              return const ErrorScreen();
            }

            return ProfileScreen(userTag: state.pathParameters['id']!);
          },
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/note/:id',
          builder: (context, state) {
            final String? idString = state.pathParameters['id'];
            if (idString == null || int.tryParse(idString) == null) {
              return const ErrorScreen();
            }

            NoteDto? noteDto;
            if (state.extra != null) {
              noteDto = state.extra as NoteDto;
            }
            return NoteScreen(noteId: int.parse(idString), noteDto: noteDto);
          },
        ),
      ]
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Brightness.dark;
    final isLight = brightness == Brightness.light;

    var colorScheme = ColorScheme.fromSeed(seedColor: Color(0xff9eff00), brightness: brightness);
    colorScheme = colorScheme.copyWith(
      surface: isLight ? Colors.white : Colors.black,
      surfaceVariant: isLight ? Colors.white : Colors.black,
      background: isLight ? colorScheme.primary.withOpacity(0.05) : null,
    );

    return MaterialApp.router(
      routerConfig: _router,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(scrolledUnderElevation: 0),
        dividerColor: lightColorScheme.surfaceVariant,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// BottomNavigationBar bottomNavigationBar() {
//   return BottomNavigationBar(
//     items: const [
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//       BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
//     ],
//   );
// }

class MinimalHomeScreen extends ConsumerStatefulWidget {
  final Widget? child;

  const MinimalHomeScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  ConsumerState<MinimalHomeScreen> createState() => _MinimalHomeScreenState();
}

class _MinimalHomeScreenState extends ConsumerState<MinimalHomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    final isMobile = ref.watch(isMobileModeProvider);

    return LayoutBuilder(
        builder: (context, constraints) {
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

              return Scaffold(
                bottomNavigationBar: isMobile
                    ? BottomNavigationBar(
                      onTap: _onTap,
                      currentIndex: _bottomBarSelectedIndex,
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
                    )
                    : null,
                body: Row(
                  children: [
                    // show navigation rail if width is not small
                    if (!isMobile)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LayoutBuilder(
                              builder: (context, constraints) {
                                return SingleChildScrollView(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                                    child: IntrinsicHeight(
                                      child: NavigationRail(
                                        extended: true,
                                        backgroundColor: Theme.of(context).colorScheme.surface,
                                        onDestinationSelected: _onTap,
                                        destinations: [
                                          NavigationRailDestination(icon: Icon(Icons.home), label: Text('Лента')),
                                          NavigationRailDestination(icon: Icon(Icons.search), label: Text('Поиск')),
                                          NavigationRailDestination(icon: Icon(Icons.notifications), label: Text('Уведомления')),
                                        ],
                                        selectedIndex: _railSelectedIndex,
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
                      ),
                    if (widget.child != null)
                      Expanded(
                        child: widget.child!,
                      ),
                  ],
                ),
              );
            },
          );
        }
    );
  }

  // Widget _buildListView() {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Title')),
  //     body: ListView.builder(
  //       itemCount: 100,
  //       itemBuilder: (_, __) {
  //         return CenterConstrained(
  //           child: NoteTile(
  //             note: Note(
  //               0,
  //               'Какая-то запись',
  //               User(id: 0, name: 'name', userTag: 'userTag', description: 'description', registerDate: 'registerDate', avatarUrl: null, backgroundUrl: null, isPrivate: false),
  //               false,
  //               DateTime.now(),
  //             ),
  //           ),
  //         );
  //       },
  //       // separatorBuilder: (_, __) {
  //       //   return const CenterConstrained(child: Divider());
  //       // },
  //     ),
  //   );
  // }
}

class CenterConstrained extends StatelessWidget {
  final Widget child;

  const CenterConstrained({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: child,
      ),
    );
  }
}


