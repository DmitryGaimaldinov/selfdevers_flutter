// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'create_note_state.g.dart';
//
// @freezed
// class CreateNoteState with _$CreateNoteState {
//
//   const factory CreateNoteState({
//     required UniqueKey key,
//     required String hintText,
//     required RichTextController richTextController,
//     required FocusNode focusNode,
//     required showLineToNextNote,
//     required List<String> imagePaths,
//     required opacity,
//     required List<Map<String, List<int>>> matches,
//   }) = _CreateNoteState;
//
//   bool isNoteEmpty() {
//     if (richTextController.text.trim().isEmpty && imagePaths.isEmpty) {
//       return true;
//     }
//
//     return false;
//   }
//
//   bool isNoteNotEmpty() => !isNoteEmpty();
//
//   void dispose() {
//     richTextController.dispose();
//     focusNode.dispose();
//   }
// }