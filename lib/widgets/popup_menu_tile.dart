import 'package:flutter/material.dart';

class PopUpMenuTile extends StatelessWidget {
  const PopUpMenuTile(
      {Key? key,
        required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      // style: Theme.of(context).textTheme.headline4?.copyWith(
      //     color: isActive
      //         ? Theme.of(context).accentColor
      //         : Theme.of(context).primaryColor),
    );
  }
}