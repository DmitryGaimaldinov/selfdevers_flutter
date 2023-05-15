import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TaskText extends SpecialText {
  TaskText()
      : super('/', "k", null, onTap: null);

  @override
  bool isEnd(String value) {
    var index = value.indexOf("/");
    var index1 = value.indexOf("k");

    return index >= 0 &&
        index1 >= 0 &&
        index1 > index + 1 &&
        super.isEnd(value);
  }

  @override
  InlineSpan finishText() {
    final String text = toString();

    return ExtendedWidgetSpan(
      actualText: text,
      // start: ,
      alignment: ui.PlaceholderAlignment.middle,
      child: Padding(
        padding: EdgeInsets.only(right: 5.0, top: 2.0, bottom: 2.0),
        child: TaskCheckbox(),
      ),
      deleteAll: true,
    );
  }
}

class TaskCheckbox extends StatefulWidget {
  const TaskCheckbox({Key? key}) : super(key: key);

  @override
  State<TaskCheckbox> createState() => _TaskCheckboxState();
}

class _TaskCheckboxState extends State<TaskCheckbox> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      padding: EdgeInsets.all(5.0),
      color: Colors.orange,
      child: InkWell(
        child: Icon(
          _isSelected ? Icons.done : Icons.close,
          size: 15.0,
        ),
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
      ),
    );
  }
}
