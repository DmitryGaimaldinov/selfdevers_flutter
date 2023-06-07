import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:selfdevers/api/photos/dtos/image_dto.dart';
// import 'package:petstore_api/petstore_api.dart';
import 'package:selfdevers/auth/auth_manager_screen.dart';
import 'package:selfdevers/create_note/create_note_dialog.dart';
import 'package:selfdevers/feed/feed_screen.dart';
import 'package:selfdevers/feed/widgets/note_tile.dart';
import 'package:selfdevers/profile/user.dart';
import 'package:selfdevers/search/search_screen.dart';
import 'package:selfdevers/utils/my_custom_scroll_behavior.dart';

import 'feed/note.dart';
import 'screens/home_screen.dart';
import 'styles/color-themes.dart';
import 'screens/register_screen.dart';


final screenScrollDeltaController = StreamController<double>.broadcast();
Sink<double> screenScrollDeltaSink = screenScrollDeltaController.sink;
Stream<double> screenScrollDeltaStream = screenScrollDeltaController.stream;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: lightColorScheme.background,
  ));

  initializeDateFormatting('ru');

  // TODO: Обрабатывать UnauthorizedException
  runApp(const ProviderScope(child: MyApp()));
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(
          surface: Colors.white,
          surfaceVariant: Colors.white,
          background: Colors.grey.shade300,
        ),
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
      home: LayoutBuilder(
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

              return const HomeScreen();
              // return MinimalHomeScreen();
            },
          );
        }
      ),
      // home: CreateNoteScreen(),
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

// class MinimalHomeScreen extends ConsumerStatefulWidget {
//   const MinimalHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<MinimalHomeScreen> createState() => _MinimalHomeScreenState();
// }
//
// class _MinimalHomeScreenState extends ConsumerState<MinimalHomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final isMobile = ref.watch(isMobileModeProvider);
//
//     return Scaffold(
//       bottomNavigationBar: isMobile
//           ? BottomNavigationBar(
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.search),
//                   label: 'Search',
//                 ),
//               ],
//             )
//           : null,
//       // The content is centered and its maxWidth is 650
//       body: Row(
//         children: [
//           // show navigation rail if width is not small
//           if (!isMobile)
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     return SingleChildScrollView(
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(minHeight: constraints.maxHeight),
//                         child: IntrinsicHeight(
//                           child: NavigationRail(
//                             extended: true,
//                             backgroundColor: Theme.of(context).colorScheme.surface,
//                             destinations: [
//                               NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
//                               NavigationRailDestination(icon: Icon(Icons.search), label: Text('Search')),
//                             ],
//                             selectedIndex: 0,
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 ),
//                 VerticalDivider(
//                   thickness: 1,
//                   width: 1,
//                 ),
//               ],
//             ),
//           Expanded(
//             child: MaterialApp(
//               scrollBehavior: MyCustomScrollBehavior(),
//               theme: ThemeData(
//                 useMaterial3: true,
//                 colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen).copyWith(
//                   surface: Colors.white,
//                   surfaceVariant: Colors.white,
//                   background: Color(0xffedeef0),
//                 ),
//                 // colorSchemeSeed: ,
//                 appBarTheme: AppBarTheme(scrolledUnderElevation: 0),
//                 dividerColor: lightColorScheme.surfaceVariant,
//               ),
//               darkTheme: ThemeData(
//                 appBarTheme: AppBarTheme(scrolledUnderElevation: 0),
//                 useMaterial3: true,
//                 // colorScheme: darkColorScheme,
//                 // colorSchemeSeed,
//                 // dividerColor: darkColorScheme.surfaceVariant,
//               ),
//               debugShowCheckedModeBanner: false,
//               home: FeedScreen(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildListView() {
//     return Scaffold(
//       appBar: AppBar(title: Text('Title')),
//       body: ListView.builder(
//         itemCount: 100,
//         itemBuilder: (_, __) {
//           return CenterConstrained(
//             child: NoteTile(
//               note: Note(
//                 0,
//                 'Какая-то запись',
//                 User(id: 0, name: 'name', userTag: 'userTag', description: 'description', registerDate: 'registerDate', avatarUrl: null, backgroundUrl: null, isPrivate: false),
//                 false,
//                 DateTime.now(),
//               ),
//             ),
//           );
//         },
//         // separatorBuilder: (_, __) {
//         //   return const CenterConstrained(child: Divider());
//         // },
//       ),
//     );
//   }
// }

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


