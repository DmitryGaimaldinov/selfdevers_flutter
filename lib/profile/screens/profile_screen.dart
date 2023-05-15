import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/auth/auth_notifier.dart';
import 'package:selfdevers/followers_list/followers_list_screen.dart';
import 'package:selfdevers/profile/profile_dto.dart';
import 'package:selfdevers/profile/profile_notifier.dart';
import 'package:selfdevers/profile/profile_state.dart';
import 'package:selfdevers/edit_profile/edit_profile_screen.dart';
import 'package:selfdevers/profile/related_user_fields.dart';
import 'package:selfdevers/profile/user_counter.dart';
import 'package:selfdevers/utils/linked_text.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../followed_list/followed_list_screen.dart';
import '../user.dart';
import '../../styles/text_styles.dart';
import '../widgets/background_profile_image.dart';
import '../widgets/avatar_profile_image.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  final String userTag;

  const ProfileScreen({
    Key? key,
    required this.userTag,
  }) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  late final ScrollController _scrollController;

  double _titleOpacity = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset < 350) {
        if (_scrollController.offset < 300) {
          setState(() {
            _titleOpacity = 0;
          });
        } else {
          setState(() {
            _titleOpacity = (_scrollController.offset - 300) / 50;
          });
        }
      } else {
        setState(() {
          _titleOpacity = 1;
        });
      }
      print(_scrollController.position.pixels);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileNotifierProvider(widget.userTag));

    if (profileState is ProfileStateLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    else if (profileState is ProfileStateNotFound) {
      return Center(
        child: Text('Пользователь не найден'),
      );
    } else if (profileState is ProfileStateLoaded) {
      final user = profileState.profileDto.user;

      final relatedFields = profileState.profileDto.relatedUserFields;

      return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: DefaultTabController(
          length: 2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Профиль
                LayoutBuilder(
                    builder: (context, constraints) {
                      final backgroundHeight = constraints.maxWidth / 3;
                      final totalHeaderHeight = backgroundHeight + 40;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: totalHeaderHeight,
                                color: Colors.transparent,
                              ),
                              BackgroundProfileImage(
                                height: backgroundHeight,
                                imageProvider: (user.backgroundUrl != null)
                                    ? NetworkImage(user.backgroundUrl!)
                                    : null,
                              ),
                              Positioned(
                                left: 16,
                                bottom: 0,
                                child: AvatarProfileImage(
                                  imageProvider: (user.avatarUrl != null)
                                      ? NetworkImage(user.avatarUrl!)
                                      : null,
                                ),
                              ),
                              Positioned(
                                  right: 16,
                                  bottom: 0,
                                  child: ProfileActionButton(
                                    profileDto: profileState.profileDto,
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: user.name,
                                          style: Theme.of(context).textTheme.titleLarge,
                                        ),
                                        if (user.isPrivate)
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 4.0),
                                              child: Icon(Icons.lock),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '@${user.userTag}',
                                    style: TextStyles.light1,
                                  ),
                                  user.description.isEmpty
                                      ? SizedBox()
                                      : Padding(
                                          padding: const EdgeInsets.only(top: 16),
                                          child: LinkedText(user.description)
                                        ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today, size: 18),
                                      SizedBox(width: 4),
                                      Text(
                                          user.registerDate,
                                          style: TextStyles.light2
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Builder(builder: (_) {
                                        final followingsCount = user.counters![UserCounterType.followings]!;
                                        return _FollowCountText(
                                          count: followingsCount,
                                          label: 'читаемых',
                                          onTap: (relatedFields.hasAccessState == HasAccessToUserState.hasAccess)
                                              ? () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (_) => FollowedListScreen(userId: user.id),
                                                  ));
                                                }
                                              : null,
                                        );
                                      }),
                                      SizedBox(width: 16),
                                      Builder(builder: (_) {
                                        final followersCount = user.counters![UserCounterType.followers]!;
                                        return _FollowCountText(
                                          count: followersCount,
                                          label: 'читателей',
                                          onTap: (relatedFields.hasAccessState == HasAccessToUserState.hasAccess)
                                              ? () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (_) => FollowersListScreen(userId: user.id),
                                                  ));
                                                }
                                              : null,
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ],
                      );
                    }
                ),
                // Посты
                StickyHeader(
                    header: Container(
                      color: Colors.white,
                      child: TabBar(
                          tabs: [
                            Tab(text: 'Посты'),
                            Tab(text: 'Ответы'),
                          ]
                      ),
                    ),
                    content: Column(
                      children: [
                        ...List.generate(100, (index) {
                          return ListTile(
                            title: Text('Пост $index'),
                          );
                        })
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      );
    }

    throw 'Нет экрана для profileState: $profileState';



    // return Scaffold(
    //   body: DefaultTabController(
    //     length: 2,
    //     child: NestedScrollView(
    //       controller: _scrollController,
    //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //         print(innerBoxIsScrolled);
    //         return <Widget>[
    //           SliverAppBar.large(
    //             // expandedHeight: 400,
    //             floating: false,
    //             pinned: true,
    //             title: Opacity(
    //               opacity: _titleOpacity,
    //               child: Text(
    //                 widget.user.name,
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 16.0,
    //                 )),
    //             ),
    //             flexibleSpace: FlexibleSpaceBar(
    //               stretchModes: [StretchMode.blurBackground],
    //               background: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Stack(
    //                     children: [
    //                       Container(
    //                         height: 200,
    //                         color: Colors.transparent,
    //                       ),
    //                       Container(
    //                         height: 160,
    //                         color: Colors.grey,
    //                       ),
    //                       Positioned(
    //                         left: 16,
    //                         bottom: 0,
    //                         child: _AvatarImage(radius: 40),
    //                       )
    //                     ],
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 16),
    //                     child: Column(
    //                       mainAxisSize: MainAxisSize.min,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           widget.user.name,
    //                           style: Theme.of(context).textTheme.titleLarge,
    //                         ),
    //                         Text(
    //                           '@${widget.user.userTag}',
    //                           style: TextStyles.light1,
    //                         ),
    //                         widget.user.description.isEmpty
    //                             ? SizedBox()
    //                             : Padding(
    //                             padding: const EdgeInsets.only(top: 16),
    //                             child: Text(widget.user.description)),
    //                         SizedBox(height: 16),
    //                         Row(
    //                           children: [
    //                             Icon(Icons.calendar_today),
    //                             SizedBox(width: 4),
    //                             Text(
    //                                 widget.user.registerDate,
    //                                 style: TextStyles.light2
    //                             ),
    //                           ],
    //                         ),
    //                         SizedBox(height: 16),
    //                         // TODO: Вынести в отдельный виджет FollowingsCountText and FollowersCountText
    //                         Wrap(
    //                           crossAxisAlignment: WrapCrossAlignment.center,
    //                           children: [
    //                             Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
    //                             SizedBox(width: 4),
    //                             Text('читаемых'),
    //                             SizedBox(width: 8),
    //                             Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
    //                             SizedBox(width: 4),
    //                             Text('читателей'),
    //                           ],
    //                         ),
    //                       ],
    //                     )
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             bottom: TabBar(
    //                 tabs: [
    //                   Tab(text: 'Посты'),
    //                   Tab(text: 'Ответы'),
    //                 ]
    //             ),
    //           ),
    //           // SliverPersistentHeader(
    //           //   delegate: _SliverAppBarDelegate(
    //           //     TabBar(
    //           //       tabs: [
    //           //         Tab(text: 'Посты'),
    //           //         Tab(text: 'Ответы'),
    //           //       ]
    //           //     ),
    //           //     user: widget.user,
    //           //   ),
    //           //   pinned: true,
    //           // ),
    //         ];
    //       },
    //       body: Center(
    //         child: Text("Sample text"),
    //       ),
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Stack(
    //           children: [
    //             Container(
    //               height: 170,
    //               color: Colors.transparent,
    //             ),
    //             Positioned(
    //               child: _BackgroundImage()
    //             ),
    //             Positioned(
    //               left: 16,
    //               bottom: 0,
    //               child: _AvatarImage(),
    //             )
    //           ],
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 16),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 user.name,
    //                 style: Theme.of(context).textTheme.titleLarge,
    //               ),
    //               Text(
    //                 '@${user.userTag}',
    //                 style: TextStyles.light1,
    //               ),
    //               user.description.isEmpty
    //                   ? SizedBox()
    //                   : Padding(
    //                       padding: const EdgeInsets.only(top: 16),
    //                       child: Text(user.description)),
    //               SizedBox(height: 16),
    //               Row(
    //                 children: [
    //                   Icon(Icons.calendar_today),
    //                   SizedBox(width: 4),
    //                   Text(
    //                     user.registerDate,
    //                     style: TextStyles.light2
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(height: 16),
    //               // TODO: Вынести в отдельный виджет FollowingsCountText and FollowersCountText
    //               Wrap(
    //                 crossAxisAlignment: WrapCrossAlignment.center,
    //                 children: [
    //                   Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
    //                   SizedBox(width: 4),
    //                   Text('читаемых'),
    //                   SizedBox(width: 8),
    //                   Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
    //                   SizedBox(width: 4),
    //                   Text('читателей'),
    //                 ],
    //               ),
    //               TabBar(
    //                 tabs: [
    //                   Tab(text: 'Посты'),
    //                   Tab(text: 'Ответы'),
    //                 ]
    //               ),
    //             ],
    //           )
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class ProfileActionButton extends ConsumerWidget {
  final ProfileDto profileDto;

  const ProfileActionButton({
    Key? key,
    required this.profileDto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currUser = ref.watch(currentUserProvider);

    if (currUser == null) {
      return _FollowButton(
          label: 'Войдите, чтобы подписаться',
          onPressed: () {
            throw 'Сделать реализацию "Войти чтобы подписаться". '
                'Вызывать какой-то метод показа диалога для входа';
          }
      );
    }

    switch (profileDto.relatedUserFields.followState) {
      case FollowState.isMe:
        return _FollowButton(
            label: 'Изменить профиль',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => EditProfileScreen(user: profileDto.user),
              ));
            },
        );
      case FollowState.notFollowing:
        return _FollowButton(
          label: profileDto.user.isPrivate ? 'Отправить запрос' : 'Подписаться',
          onPressed: () {
            ref.read(profileNotifierProvider(profileDto.user.userTag).notifier)
                .follow(profileDto.user.id);
          },
        );
      case FollowState.requestSent:
        return _FollowButton(
          label: 'Отозвать запрос',
          onPressed: () {
            ref.read(profileNotifierProvider(profileDto.user.userTag).notifier)
                .unfollow(profileDto.user.id);
          },
        );
      case FollowState.following:
        return _FollowButton(
          label: 'Отписаться',
          onPressed: () {
            ref.read(profileNotifierProvider(profileDto.user.userTag).notifier)
                .unfollow(profileDto.user.id);
          },
        );
    }
  }
}

class _FollowButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const _FollowButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}


class _FollowCountText extends StatelessWidget {
  final int count;
  final void Function()? onTap;
  final String label;

  const _FollowCountText({
    Key? key,
    required this.count,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          // recognizer: TapGestureRecognizer()..onTap = onTap,
          children: [
            TextSpan(
              text: '$count',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const WidgetSpan(
              child: SizedBox(width: 4),
            ),
            TextSpan(text: label),
          ]
        )
      ),
    );

    // Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
    // SizedBox(width: 4),
    // Text('читателей')
  }
}

