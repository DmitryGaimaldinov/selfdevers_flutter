import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/feed/feed_screen.dart';
import 'package:selfdevers/feed/note.dart';
import 'package:selfdevers/feed/widgets/note_tile.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/profile/user.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/home/home_screen.dart';
import 'package:selfdevers/widgets/club_avatar.dart';
import 'package:selfdevers/widgets/sliver_app_bar_delegate.dart';
import 'package:rxdart/rxdart.dart';

import '../styles/text_styles.dart';
import '../widgets/login_appbar_button.dart';

final isSearchRequestingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class SearchScreen extends StatefulWidget {
  final ScrollController? scrollController;

  const SearchScreen({
    Key? key,
    this.scrollController,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    const appBarContentHeight = 40.0;

    final theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: appBarContentHeight,
            ),
            child: GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(
                      textStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.primaryColor,
                      ),
                      hintTextStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  );
                },
                child: _buildLeadingAvatar()
            ),
          ),
          title: Container(
            constraints: BoxConstraints(
              maxHeight: appBarContentHeight,
            ),
            child: Center(child: _buildSearchField()),
          ),
          actions: [
            LoginAppBarButton(),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: [
              Tab(text: 'Посты'),
              Tab(text: 'Клубы'),
              Tab(text: 'Челленджи'),
              Tab(text: 'Люди'),
            ],
          ),
        ),
        // TODO: Использовать CustomScrollView
        body: Column(
          children: [
            Consumer(
                builder: (context, ref, _) {
                  final isRequesting = ref.watch(isSearchRequestingProvider);

                  return isRequesting
                      ? const LinearProgressIndicator()
                      : const SizedBox();
                }
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildNotesBody(),
                  _buildClubsBody(),
                  Text('Список челленжей'),
                  Text('Список людей'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesBody() {
    return Text('Сделать поиск постов');
    // return ListView.builder(
    //   itemCount: 100,
    //   controller: widget.scrollController,
    //   // controller: ScrollController(),
    //   // primary: false,
    //   // physics: NeverScrollableScrollPhysics(),
    //   // shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     if (index == 0) {
    //       return const CenterConstrained(child: _SearchNotesFilterButton());
    //     }
    //
    //     return CenterConstrained(
    //       child: NoteTile(note: Note(
    //         index,
    //         'Какая-то запись',
    //         User(id: 0, name: 'name', userTag: 'userTag', description: 'description', registerDate: 'registerDate', avatarUrl: null, backgroundUrl: null, isPrivate: false),
    //         false,
    //         DateTime.now(),
    //       )),
    //     );
    //   },
    // );
  }

  Widget _buildClubsBody() {
    return ListView.separated(
      itemCount: 100,
      // controller: ScrollController(),
      // primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ClubTile(
          onTap: () {},
          nameLabel: 'Клуб любителей сырников',
          subscribersCountLabel: '989 подписчиков',
          avatar: ClubAvatar(
            // onTap: () {},
            blurhash: 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
          height: 1,
          thickness: 1,
        );
      },
    );
  }

  Widget _buildLeadingAvatar() {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: UserAvatar()
    );
  }

  Widget _buildSearchField() {
    final theme = Theme.of(context);

    return TextField(
      autofocus: false,
      onSubmitted: (String) {

      },
      textAlignVertical: TextAlignVertical.center,
      style: TextStyles.light1,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.colorScheme.secondaryContainer,
        hintText: 'Поиск',
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.secondary),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.secondary),
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
    );

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.colorScheme.secondary)
      ),
      child: Center(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            fillColor: theme.colorScheme.secondaryContainer,
            // icon: Icon(Icons.search),
            border: InputBorder.none,
            // contentPadding: EdgeInsets.zero,
            hintText: 'Поиск постов',
            hintStyle: TextStyle(color: theme.colorScheme.secondary),
          ),
          textCapitalization: TextCapitalization.sentences,
          style: TextStyle(color: theme.colorScheme.onSecondaryContainer),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


enum _FilterNotesType {
  popular,
  latest,
}

enum _FilterNotesPeriod {
  day,
  week,
  month,
  year,
  allTime,
}

final _filterNotesTypeProvider = StateProvider<_FilterNotesType>((ref) {
  return _FilterNotesType.popular;
});

final _filterNotesPeriodProvider = StateProvider<_FilterNotesPeriod>((ref) {
  return _FilterNotesPeriod.day;
});


class _SearchNotesFilterButton extends ConsumerStatefulWidget {
  const _SearchNotesFilterButton({Key? key}) : super(key: key);

  @override
  ConsumerState<_SearchNotesFilterButton> createState() => _SearchNotesFilterButtonState();
}

class _SearchNotesFilterButtonState extends ConsumerState<_SearchNotesFilterButton>
    with TickerProviderStateMixin {

  bool _isOpened = false;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  _toggleContainer() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: const Duration(milliseconds: 500));
    }
  }

  void _changeFilterType(_FilterNotesType type) {
    ref.read(_filterNotesTypeProvider.notifier).state = type;
  }

  void _changeFilterPeriod(_FilterNotesPeriod period) {
    ref.read(_filterNotesPeriodProvider.notifier).state = period;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      width: double.infinity,
      duration: Duration(milliseconds: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16, bottom: _isOpened ? 0 : 16),
            child: TextButton(
              onPressed: () {
                _toggleContainer();
                // setState(() {
                //   _isOpened = !_isOpened;
                // });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Лучшее за сегодня', style: TextStyles.light1),
                  Icon(_isOpened ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _animation,
            axis: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Показывать',
                      style: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildFilterTypeChips(),
                    if (ref.watch(_filterNotesTypeProvider) == _FilterNotesType.popular)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'Показывать',
                            style: TextStyle(
                                color: theme.colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 8),
                          _buildFilterPeriodChips(),
                        ],
                      )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Wrap _buildFilterTypeChips() {
    final filterType = ref.watch(_filterNotesTypeProvider);

    return Wrap(
        runSpacing: 8,
        spacing: 8,
        children: [
          _SearchFilterChip(
            onTap: () {
              _changeFilterType(_FilterNotesType.popular);
            },
            label: 'Популярное',
            selected: filterType == _FilterNotesType.popular,
          ),
          _SearchFilterChip(
            onTap: () {
              _changeFilterType(_FilterNotesType.latest);
            },
            label: 'Последние',
            selected: filterType == _FilterNotesType.latest,
          ),
        ]
    );
  }

  Wrap _buildFilterPeriodChips() {
    final filterPeriod = ref.watch(_filterNotesPeriodProvider);

    return Wrap(
        runSpacing: 8,
        spacing: 8,
        children: [
          _SearchFilterChip(
            onTap: () {
              _changeFilterPeriod(_FilterNotesPeriod.day);
            },
            label: 'Сутки',
            selected: filterPeriod == _FilterNotesPeriod.day,
          ),
          _SearchFilterChip(
            onTap: () {
              _changeFilterPeriod(_FilterNotesPeriod.week);
            },
            label: 'Неделя',
            selected: filterPeriod == _FilterNotesPeriod.week,
          ),
          _SearchFilterChip(
            onTap: () {
              _changeFilterPeriod(_FilterNotesPeriod.month);
            },
            label: 'Месяц',
            selected: filterPeriod == _FilterNotesPeriod.month,
          ),
          _SearchFilterChip(
            onTap: () {
              _changeFilterPeriod(_FilterNotesPeriod.year);
            },
            label: 'Год',
            selected: filterPeriod == _FilterNotesPeriod.year,
          ),
          _SearchFilterChip(
            onTap: () {
              _changeFilterPeriod(_FilterNotesPeriod.allTime);
            },
            label: 'Всё время',
            selected: filterPeriod == _FilterNotesPeriod.allTime,
          ),
        ]
    );
  }
}

class _SearchFilterChip extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final bool selected;

  const _SearchFilterChip({
    Key? key,
    required this.onTap,
    required this.label,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilterChip(
      label: Text(label),
      labelStyle: selected ? TextStyle(color: theme.colorScheme.onPrimary) : null,
      onSelected: (isSelected) {
        if (isSelected) {
          onTap();
        }
      },
      selectedColor: theme.colorScheme.onPrimaryContainer,
      checkmarkColor: theme.colorScheme.onPrimary,
      selected: selected,
    );
  }
}

// TODO: Здесь можно прокинуть ref через конструктор
class MySearchDelegate extends SearchDelegate {
  final TextStyle textStyle;
  final TextStyle hintTextStyle;

  MySearchDelegate({
    required this.textStyle,
    required this.hintTextStyle
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('results');
  }

  List<Object> findSuggestions(String query) {
    return [];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('build suggestions for query: $query');

    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return _SuggestionTile(
            onTap: () {},
            leading: UserAvatar(),
            titleLabel: 'Суперюзер $index',
            subtitleLabel: '$index читателей',
          );
        }
    );

    if (query.trim().isNotEmpty) {
      Stream.value(query)
          .debounceTime(Duration(milliseconds: 300))
          .switchMap((value) async* {
        yield [];
      })
          .listen((event) {

      });
    }

    return SizedBox();
  }

  @override
  String? get searchFieldLabel => 'Поиск';

  @override
  TextStyle? get searchFieldStyle => query.isEmpty ? hintTextStyle : textStyle;
}

class _SuggestionTile extends StatelessWidget {
  final void Function() onTap;
  final Widget? leading;
  final String titleLabel;
  final String subtitleLabel;

  const _SuggestionTile({
    Key? key,
    required this.onTap,
    this.leading,
    required this.titleLabel,
    required this.subtitleLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(titleLabel),
      subtitle: Text(subtitleLabel),
    );
  }
}

class ClubTile extends StatelessWidget {
  final void Function()? onTap;
  final String nameLabel;
  final String subscribersCountLabel;
  final Widget avatar;

  const ClubTile({
    Key? key,
    this.onTap,
    required this.nameLabel,
    required this.subscribersCountLabel,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(nameLabel),
      subtitle: Text(subscribersCountLabel),
      leading: avatar,
    );
  }
}



class _UserSuggestionTile extends StatelessWidget {
  const _UserSuggestionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class _ClubSuggestionTile extends StatelessWidget {
  const _ClubSuggestionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ChallengeSuggestionTile extends StatelessWidget {
  const _ChallengeSuggestionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
