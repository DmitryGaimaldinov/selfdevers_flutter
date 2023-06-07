// import 'package:extended_text_field/extended_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:selfdevers/utils/task_text.dart';
//
// class MySpecialTextSpanBuilder extends SpecialTextSpanBuilder {
//   @override
//   TextSpan build(String data,
//       {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap}) {
//     final lookingFor = "/task";
//     final splitData = data.split(" ");
//     print(splitData);
//
//     final spans = splitData.map((e) {
//       if (e == lookingFor) {
//         return ExtendedWidgetSpan(
//           actualText: e,
//           child: TaskCheckbox(),
//           deleteAll: true,
//         );
//       } else {
//         return TextSpan(
//           text: e,
//           style: TextStyle(color: Colors.red),
//         );
//       }
//     }).toList();
//     return TextSpan(children: spans, style: textStyle);
//   }
//
//   @override
//   SpecialText? createSpecialText(String flag,
//       {TextStyle? textStyle,
//         SpecialTextGestureTapCallback? onTap,
//         required int index}) {
//     // TODO: implement createSpecialText
//     throw UnimplementedError();
//   }
// }