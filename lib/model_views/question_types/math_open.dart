//import 'package:flutter/material.dart';
//
//class MathOpenQuestionView extends StatelessWidget {
//  final List<FocusNode> _focusNode = [
//    FocusNode(),
//    FocusNode(),
//    FocusNode(),
//    FocusNode()
//  ];
//
//  final List<TextEditingController> _controllers = [
//    TextEditingController(),
//    TextEditingController(),
//    TextEditingController(),
//    TextEditingController(),
//  ];
//
//  final List<String> oldTexts = [
//    '',
//    '',
//    '',
//    '',
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    for (int i = 0; i < 4; i++) {
////      _controllers[i].addListener(() {
////        if (oldTexts[i] == _controllers[i].text && oldTexts[i].isEmpty) {
////          print('BACKSCAPE');
////        }
////        oldTexts[i] = _controllers[i].text;
////        print('CALLBACK');
////      });
//      _focusNode[i].attach(context, onKey: (node, key) {
////        var c = _controllers[i];
////
////        print('CLICK');
////        print(c.text);
////
////        if (c.text.isEmpty && key.isKeyPressed(LogicalKeyboardKey.backspace)) {
////          print('GOING BACK!');
////
//////          _focusNode[i].unfocus();
////          _focusNode[i - 1].requestFocus();
////        }
//        print('CLICKKKK');
//        return true;
//      });
//    }
//    return Row(
//      children: [
//        container(0),
//        container(1),
//        container(2),
//        container(3),
//      ],
//    );
//  }
//
//  Widget container(int n) => Container(
//      width: 36,
//      height: 42,
//      margin: const EdgeInsets.symmetric(horizontal: 12),
//      child: TextField(
////        onChanged: (s) {
//////          _focusNode[s.isEmpty ? n - 1 : n + 1].requestFocus();
////          print('changed');
////        },
//
//        controller: _controllers[n],
//        focusNode: _focusNode[n],
//        textAlign: TextAlign.center,
//        textAlignVertical: TextAlignVertical.center,
//        decoration: const InputDecoration(
//            counterText: '',
//            border: OutlineInputBorder(),
//            contentPadding: EdgeInsets.all(4)),
//        maxLength: 1,
//      ));
//}
