// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:selfdevers/feed/note.dart';
// import 'package:selfdevers/feed/widgets/note_button.dart';
// import 'package:selfdevers/feed/widgets/note_tile.dart';
// import 'package:selfdevers/note/note_screen.dart';
// import 'package:selfdevers/profile/user.dart';
// import 'package:selfdevers/profile/widgets/user_avatar.dart';
// import 'package:selfdevers/styles/text_styles.dart';
//
//
// class CommentViewDto {
//   final Note note;
//   final CommentViewDto? parent;
//   List<CommentViewDto> children;
//
//   CommentViewDto({
//     required this.note,
//     this.parent,
//     List<CommentViewDto>? children,
//   }) : this.children = children ?? [];
//
//   int get nestingLevel {
//     int level = 0;
//     CommentViewDto? parentComment = parent;
//     while (parentComment != null) {
//       level++;
//       parentComment = parentComment.parent;
//     }
//     return level;
//   }
// }
//
//
//
// class CommentView extends StatefulWidget {
//   // final Note note;
//   final bool isDeepComment;
//   final bool isLastOfDeepComments;
//   final Future<void> Function()? loadCommentsFunction;
//   final CommentViewDto commentViewDto;
//
//   const CommentView({
//     Key? key,
//     // required this.note,
//     this.isDeepComment = false,
//     this.isLastOfDeepComments = false,
//     this.loadCommentsFunction,
//     required this.commentViewDto,
//   }) : super(key: key);
//
//   @override
//   State<CommentView> createState() => _CommentViewState();
// }
//
// class _CommentViewState extends State<CommentView> {
//   // List<Note> _comments = [];
//   bool _isLoadingComments = false;
//
//   late CommentViewDto _mainComment;
//   List<CommentViewDto> _wrappedComments = [];
//
//   // late final void Function() _loadCommentsFunction;
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     _mainComment = widget.commentViewDto;
//     // _loadCommentsFunction =
//     //     widget.loadCommentsFunction ?? () => _loadComments(_mainComment);
//   }
//
//   Future<void> _loadComments(CommentViewDto commentViewDto) async {
//     setState(() => _isLoadingComments = true);
//
//     // TODO: сделать взимодействие с Api
//     if (commentViewDto.children.isEmpty) {
//       // load api.getLatestCommentsForNote(noteId: note.id, count: 3);
//
//       await Future.delayed(const Duration(seconds: 1));
//       final newComments = List.generate(3, (index) => Note(
//         index,
//         'Запись. Вложенность: ${commentViewDto.nestingLevel+1}',
//         User(id: index, name: 'name$index', userTag: 'user$index', description: 'description', registerDate: 'registerDate', avatarUrl: null, backgroundUrl: null, isPrivate: false),
//         false,
//         DateTime.now(),
//       ));
//
//       commentViewDto.children.addAll(newComments.map((note) => CommentViewDto(
//         note: note,
//         parent: commentViewDto,
//       )));
//
//       // Ищем mainComment и wrapComments
//       CommentViewDto parentComment = commentViewDto;
//       _wrappedComments = [];
//
//       int parentLevel = 2;
//       while (true) {
//         if (parentLevel == 3) {
//           _mainComment = parentComment;
//           print('mainCommentChanged');
//         } else if (parentLevel > 3) {
//           _wrappedComments.add(parentComment);
//         }
//
//         if (parentComment.parent == null) {
//           break;
//         } else {
//           parentComment = parentComment.parent!;
//         }
//
//         parentLevel++;
//       }
//
//       _wrappedComments = _wrappedComments.reversed.toList();
//
//       print('wrappedComments.length: ${_wrappedComments.length}');
//       print('mainComment.nestingLevel: ${_mainComment.nestingLevel}');
//
//       setState(() => _isLoadingComments = false);
//
//     } else {
//       // final lastCommentDate = commentViewDto.children.last.note.creationDate;
//       // api.getCommentsAfterDate(noteId: note.id, date: lastCommentCreationDate, count: 3)
//
//       await Future.delayed(const Duration(seconds: 1));
//       final newComments = List.generate(3, (index) => Note(
//         index,
//         'Запись $index',
//         User(id: index, name: 'name$index', userTag: 'user$index', description: 'description', registerDate: 'registerDate', avatarUrl: null, backgroundUrl: null, isPrivate: false),
//         false,
//         DateTime.now(),
//       ));
//     }
//   }
//
//   Note get _note => _mainComment.note;
//
//   // TODO: Отображать всё в древоводной структуре. Сделать onPressed на кнопку "показать ответы"
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: (widget.isDeepComment)
//           ? const EdgeInsets.only(left: 19)
//           : EdgeInsets.zero,
//       child: IntrinsicHeight(
//         child: Row(
//           children: [
//             if (widget.isDeepComment)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Left height-line
//                   Container(
//                     height: 18,
//                     width: 2,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                   // Left width-line
//                   Container(
//                     height: 2,
//                     width: 16,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                   // Line to bottom comment of the same parent comment
//                   if (!widget.isLastOfDeepComments)
//                     Expanded(
//                       child: Container(
//                         width: 2,
//                         color: Theme.of(context).primaryColor,
//                       ),
//                     ),
//                 ],
//               ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildNoteTile(),
//                   // Deep comments
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: List.generate(_mainComment.children.length, (index) {
//                       final commentDto = _mainComment.children[index];
//                       print('build comments for main comment with nesting: ${_mainComment.nestingLevel}');
//
//                       // TODO: У каждого CommentView свой mainComment
//                       return CommentView(
//                         // note: _comments[index],
//                         commentViewDto: commentDto,
//                         isDeepComment: true,
//                         isLastOfDeepComments: index == _mainComment.children.length-1,
//                         loadCommentsFunction: widget.loadCommentsFunction,
//                         // onFirstDeepLoad: () {
//                         //   _recalculateNestingView();
//                         // }
//                       );
//                     }),
//                     // }) _comments
//                     //     .map((comment) {
//                     //
//                     //     })
//                     //     .toList(),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 48.0, bottom: 8),
//                     child: TextButton(
//                       onPressed: () {
//                         // setState(() {
//                         //   _isLoadingComments = true;
//                         // });
//
//                         if (widget.loadCommentsFunction != null) {
//                           widget.loadCommentsFunction!();
//                           print('widget.loadCommentsFunction()');
//                         } else {
//                           _loadComments(_mainComment);
//                           print(_loadComments);
//                         }
//
//
//
//                         // setState(() {
//                         //   _isLoadingComments = false;
//                         // });
//                       },
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 500),
//                         child: _isLoadingComments
//                             ? Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: CircularProgressIndicator(),
//                             )
//                             : Text('Показать ответы'),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNoteTile() {
//     final theme = Theme.of(context);
//
//     return InkWell(
//         onTap: () {
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (_) => NoteScreen(),
//           ));
//         },
//         child: Ink(
//           width: double.infinity,
//           color: theme.colorScheme.surface,
//           child: IntrinsicHeight(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   children: [
//                     UserAvatar(
//                       imageProvider: (_note.creator.avatarUrl != null)
//                           ? NetworkImage(_note.creator.avatarUrl!)
//                           : null,
//                     ),
//                     if (_mainComment.children.isNotEmpty)
//                       Expanded(
//                         child: Container(
//                           color: Theme.of(context).primaryColor,
//                           width: 2,
//                         ),
//                       ),
//                   ],
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text.rich(
//                           TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: _note.creator.name,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 const WidgetSpan(child: SizedBox(width: 4)),
//                                 TextSpan(
//                                   text: '@${_note.creator.userTag}',
//                                   style: TextStyles.light1,
//                                 ),
//                                 const WidgetSpan(child: SizedBox(width: 4)),
//                                 TextSpan(
//                                     text: DateFormat.d().format(_note.creationDate),
//                                     style: TextStyles.light2
//                                 ),
//                               ]
//                           )
//                       ),
//                       Text(
//                         _note.text,
//                         style: TextStyle(
//                           fontSize: 15,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       SizedBox(
//                         width: double.infinity,
//                         child: Wrap(
//                           alignment: WrapAlignment.spaceBetween,
//                           children: [
//                             NoteActionButton(
//                               onPressed: () {},
//                               iconData: Icons.mode_comment_outlined,
//                               label: '30',
//                             ),
//                             NoteActionButton(
//                               onPressed: () {},
//                               iconData: Icons.repeat,
//                               label: '16',
//                               hoverColor: Colors.green,
//                             ),
//                             NoteLikeButton(
//                               onChanged: (isLiked) {
//                                 // TODO
//                               },
//                               likeCount: 16,
//                               isLiked: false,
//                             ),
//                             NoteActionButton(
//                               onPressed: null,
//                               iconData: Icons.remove_red_eye,
//                               label: '100',
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }
