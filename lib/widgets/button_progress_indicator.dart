import 'package:flutter/material.dart';

/// A circular progress indicator for button
class ButtonProgressIndicator extends StatelessWidget {
  const ButtonProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(
      height: Theme.of(context).buttonTheme.height,
      width: Theme.of(context).buttonTheme.height,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
