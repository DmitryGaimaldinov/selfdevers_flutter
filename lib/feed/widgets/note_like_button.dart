import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfdevers/feed/widgets/note_button.dart';

import '../../api/notes/notes_service.dart';

class NoteLikeButton extends ConsumerStatefulWidget {
  final bool isLiked;
  final int? likeCount;
  final int noteId;
  final void Function(bool isLiked)? onChanged;

  const NoteLikeButton({
    Key? key,
    this.onChanged,
    this.likeCount,
    required this.isLiked,
    required this.noteId,
  }) : super(key: key);

  @override
  ConsumerState<NoteLikeButton> createState() => _NoteLikeButtonState();
}

class _NoteLikeButtonState extends ConsumerState<NoteLikeButton> {
  late bool _isLiked;
  late int? _likeCount;

  @override
  void initState() {
    _isLiked = widget.isLiked;
    _likeCount = widget.likeCount;
    super.initState();
  }

  Future<void> _toggleLike() async {
    if (_isLiked) {
      _unlike();
    } else {
      _like();
    }
  }

  void _likeUi() {
    setState(() {
      _isLiked = true;
      if (_likeCount != null) {
        _likeCount = _likeCount! + 1;
      }
    });
  }

  void _unlikeUi() {
    setState(() {
      _isLiked = false;
      if (_likeCount != null) {
        _likeCount = _likeCount! - 1;
      }
    });
  }

  Future<void> _like() async {
    _likeUi();
    try {
      await ref.read(notesServiceProvider).like(noteId: widget.noteId);
      if (widget.onChanged != null) {
        widget.onChanged!(true);
      }
    } catch (e) {
      _unlikeUi();
      rethrow;
    }
  }

  Future<void> _unlike() async {
    _unlikeUi();
    try {
      await ref.read(notesServiceProvider).unlike(noteId: widget.noteId);
      if (widget.onChanged != null) {
        widget.onChanged!(false);
      }
    } catch (e) {
      _likeUi();
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NoteActionButton(
      onPressed: _toggleLike,
      hoverColor: Colors.pink,
      iconData: _isLiked ? Icons.favorite : Icons.favorite_border,
      label: (_likeCount != null) ? '$_likeCount' : null,
      contentColor: _isLiked ? Colors.pink : null,
    );
  }
}
