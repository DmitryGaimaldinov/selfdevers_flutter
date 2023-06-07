import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:selfdevers/api/notes/dto/note_dto.dart';

part 'feed_state.freezed.dart';

@freezed
class FeedState with _$FeedState {
  factory FeedState.initialing() = _Initialing;
  factory FeedState.loaded({required List<NoteDto> notes}) = _Loaded;
  factory FeedState.error() = _Error;
}