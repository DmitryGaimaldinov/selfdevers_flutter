import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/feed/feed_screen.dart';
import 'package:selfdevers/feed/note.dart';
import 'package:selfdevers/feed/widgets/note_tile.dart';
import 'package:selfdevers/followers_list/followers_list_screen.dart';
import 'package:selfdevers/main.dart';
import 'package:selfdevers/profile/user.dart';
import 'package:selfdevers/profile/widgets/user_avatar.dart';
import 'package:selfdevers/home/home_screen.dart';
import 'package:selfdevers/screens/error_screen.dart';
import 'package:selfdevers/search/search_notes_body.dart';
import 'package:selfdevers/search/search_notes_notifier.dart';
import 'package:selfdevers/widgets/club_avatar.dart';
import 'package:selfdevers/widgets/sliver_app_bar_delegate.dart';
import 'package:rxdart/rxdart.dart';

import '../styles/text_styles.dart';
import '../widgets/login_appbar_button.dart';

class SearchScreen extends ConsumerStatefulWidget {

  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {

  late final TextEditingController _searchTextController;

  Future<void> _search() async {
    print('search notes');
    print('filterType: ${ref.read(filterNotesTypeProvider)}');
    print('text: ${_searchTextController.text}');

    final text = _searchTextController.text;

    ref.read(searchNotesProvider.notifier).searchNotes(
      text: text,
      filterNotesType: ref.read(filterNotesTypeProvider),
    );
  }

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _searchTextController.addListener(() {
      _search();
    });
    _search();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    const appBarContentHeight = 40.0;

    final theme = Theme.of(context);

    ref.listen<FilterNotesType>(filterNotesTypeProvider, (previous, next) {
      _search();
    });

    return Scaffold(
      appBar: AppBar(
        title: _buildSearchField(),
      ),
      body: _NotesBody(),
    );
  }

  Widget _buildSearchField() {
    final theme = Theme.of(context);

    return TextField(
      autofocus: false,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyles.light1,
      controller: _searchTextController,
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
  }
}

class _NotesBody extends ConsumerWidget {
  const _NotesBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesState = ref.watch(searchNotesProvider);

    return notesState.when(
        loading: (_) {
          return const Center(child: CircularProgressIndicator());
        },
        loaded: (notes) {
          print('notes.length: ${notes.length}');
          if (notes.isEmpty) {
            return Text('Постов не найдено');
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                CenterConstrained(child: _SearchNotesFilterButton()),
                ...notes.map((note) => NoteTile(
                  key: UniqueKey(),
                  note: note
                )),
              ],
            ),
          );

          // return ListView.builder(
          //     itemCount: notes.length + 1,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       if (index == 0) {
          //         return _SearchNotesFilterButton();
          //       }
          //
          //       return
          //     }
          // );
        },
        error: () {
          return const ErrorScreen();
        }
    );
  }
}

enum FilterNotesType {
  popular,
  latest,
}

enum FilterNotesPeriod {
  day,
  week,
  month,
  year,
  allTime,
}

final filterNotesTypeProvider = StateProvider<FilterNotesType>((ref) {
  return FilterNotesType.latest;
});

// final filterNotesPeriodProvider = StateProvider<FilterNotesPeriod>((ref) {
//   return FilterNotesPeriod.day;
// });


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

  void _changeFilterType(FilterNotesType type) {
    ref.read(filterNotesTypeProvider.notifier).state = type;
  }

  void _changeFilterPeriod(FilterNotesPeriod period) {
    // ref.read(filterNotesPeriodProvider.notifier).state = period;
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildFilterTypeChips(),
                    // if (ref.watch(filterNotesTypeProvider) == FilterNotesType.popular)
                    //   Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       SizedBox(height: 16),
                    //       Text(
                    //         'Показывать',
                    //         style: TextStyle(
                    //             color: theme.colorScheme.onPrimaryContainer,
                    //             fontWeight: FontWeight.bold
                    //         ),
                    //       ),
                          // SizedBox(height: 8),
                          // _buildFilterPeriodChips(),
                      //   ],
                      // )
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
    final filterType = ref.watch(filterNotesTypeProvider);

    return Wrap(
        runSpacing: 8,
        spacing: 8,
        children: [
          _SearchFilterChip(
            onTap: () {
              _changeFilterType(FilterNotesType.popular);
            },
            label: 'Популярное',
            selected: filterType == FilterNotesType.popular,
          ),
          _SearchFilterChip(
            onTap: () {
              _changeFilterType(FilterNotesType.latest);
            },
            label: 'Последние',
            selected: filterType == FilterNotesType.latest,
          ),
        ]
    );
  }

  // Wrap _buildFilterPeriodChips() {
  //   // final filterPeriod = ref.watch(filterNotesPeriodProvider);
  //
  //   return Wrap(
  //       runSpacing: 8,
  //       spacing: 8,
  //       children: [
  //         _SearchFilterChip(
  //           onTap: () {
  //             _changeFilterPeriod(FilterNotesPeriod.day);
  //           },
  //           label: 'Сутки',
  //           selected: filterPeriod == FilterNotesPeriod.day,
  //         ),
  //         _SearchFilterChip(
  //           onTap: () {
  //             _changeFilterPeriod(FilterNotesPeriod.week);
  //           },
  //           label: 'Неделя',
  //           selected: filterPeriod == FilterNotesPeriod.week,
  //         ),
  //         _SearchFilterChip(
  //           onTap: () {
  //             _changeFilterPeriod(FilterNotesPeriod.month);
  //           },
  //           label: 'Месяц',
  //           selected: filterPeriod == FilterNotesPeriod.month,
  //         ),
  //         _SearchFilterChip(
  //           onTap: () {
  //             _changeFilterPeriod(FilterNotesPeriod.year);
  //           },
  //           label: 'Год',
  //           selected: filterPeriod == FilterNotesPeriod.year,
  //         ),
  //         _SearchFilterChip(
  //           onTap: () {
  //             _changeFilterPeriod(FilterNotesPeriod.allTime);
  //           },
  //           label: 'Всё время',
  //           selected: filterPeriod == FilterNotesPeriod.allTime,
  //         ),
  //       ]
  //   );
  // }
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
