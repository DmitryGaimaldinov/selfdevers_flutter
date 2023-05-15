import 'package:selfdevers/notes/note.dart';

abstract class FeedState {}

class FeedStateInitializing extends FeedState {}

class FeedStateLoaded extends FeedState {
  List<Note> notes;

  FeedStateLoaded({ required this.notes });
}

class FeedStateError extends FeedState {}