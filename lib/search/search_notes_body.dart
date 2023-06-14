import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/feed/widgets/note_tile.dart';
import 'package:selfdevers/screens/error_screen.dart';
import 'package:selfdevers/search/search_notes_notifier.dart';

class SearchNotesBody extends ConsumerStatefulWidget {
  const SearchNotesBody({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SearchNotesBody> createState() => _SearchNotesBodyState();
}

class _SearchNotesBodyState extends ConsumerState<SearchNotesBody> {
  @override
  Widget build(BuildContext context) {
    final notesState = ref.watch(searchNotesProvider);

    return notesState.when(
      loading: (_) {
        return Center(child: CircularProgressIndicator());
      },
      loaded: (notes) {
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteTile(note: notes[index]);
;         }
        );
      },
      error: () {
        return ErrorScreen();
      }
    );
  }
}
