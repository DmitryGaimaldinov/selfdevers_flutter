import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/auth/auth_state.dart';
import 'package:selfdevers/auth/show_login_dialog.dart';
import 'package:selfdevers/feed/widgets/note_tile.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/profile/screens/profile_screen.dart';
import 'package:selfdevers/profile/user.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/screens/home_screen.dart';
import 'package:selfdevers/search/search_screen.dart';
import 'package:selfdevers/widgets/animated_neon_text_style.dart';
import 'package:selfdevers/widgets/create_note_fab.dart';
import 'package:selfdevers/widgets/current_user_avatar.dart';
import 'package:selfdevers/widgets/my_divider.dart';
import 'package:selfdevers/widgets/neon_icon_button.dart';
import 'package:selfdevers/widgets/neon_outlined_button.dart';

import '../styles/text_styles.dart';
import 'notifier/feed_notifier.dart';
import 'notifier/feed_state.dart';

class FeedScreen extends ConsumerStatefulWidget {
  final ScrollController? scrollController;

  const FeedScreen({
    Key? key,
    this.scrollController,
  }) : super(key: key);

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen>
    with AutomaticKeepAliveClientMixin<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      // drawer: Drawer(
      //   child: SearchScreen(),
      // ),
      appBar: AppBar(
        leading:  ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 40,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ProfileScreen(userTag: 'id0'),
                ));
              },
              child: CurrentUserAvatar(),
            )
        ),
        title: const Text('Лента'),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //
        //   },
        //   icon: Icon(Icons.menu),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authStateProvider.notifier).logout();
            },
            icon: Icon(Icons.exit_to_app)
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final authState = ref.watch(authStateProvider);
          if (authState is AuthStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (authState is AuthStateNotLoggedIn) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlickerNeonText(
                    text: 'Войдите, чтобы просматривать подписки',
                    textSize: Theme.of(context).textTheme.headlineSmall!.fontSize ?? 20,
                    textColor: Colors.white,
                    spreadColor: Theme.of(context).colorScheme.primary,
                    // style: TextStyle(
                    //   fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                    // ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  NeonOutlinedButton(
                    onPressed: () => showLoginDialog(context),
                    child: Text('Войти'),
                  ),
                ],
              ),
            );
          }

          final feedState = ref.watch(feedNotifierProvider);

          return feedState.when(
            initialing: () => const Center(child: CircularProgressIndicator()),
            error: () => const Center(child: Text('Ошибка')),
            loaded: (notes) {
              return ListView.builder(
                controller: widget.scrollController,
                itemCount: notes.length,
                itemBuilder: (_, index) {
                  return CenterConstrained(
                    child: NoteTile(note: notes[index]),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: ref.watch(showCreateNoteFabProvider)
          ? const CreateNoteFAB()
          : null,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// TODO: Вынести NoteTile в отедльный файл и разбить всё на подвиджеты:
// _NoteTileHeader, NoteTileBody, NoteTileBottomActions


