import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicSliverAppBar extends StatefulWidget {
  final Widget child;
  final double maxHeight;

  const DynamicSliverAppBar({
    required this.child,
    required this.maxHeight,
    Key? key,
  }) : super(key: key);

  @override
  _DynamicSliverAppBarState createState() => _DynamicSliverAppBarState();
}

class _DynamicSliverAppBarState extends State<DynamicSliverAppBar> {
  final GlobalKey _childKey = GlobalKey();
  bool isHeightCalculated = false;
  double? height;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!isHeightCalculated) {
        isHeightCalculated = true;
        setState(() {
          height = (_childKey.currentContext?.findRenderObject() as RenderBox)
              .size
              .height;
        });
      }
    });

    return SliverAppBar(
      expandedHeight: isHeightCalculated ? height : widget.maxHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Container(
              key: _childKey,
              child: widget.child,
            ),
            Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}