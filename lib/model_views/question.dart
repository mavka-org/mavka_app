import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:hive/hive.dart';
import 'package:mavka/models/test/question.dart';

class QuestionView extends StatelessWidget {
  final Question question;

  const QuestionView(this.question);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TeXView(
          renderingEngine: Hive.box<String>('prefs')
                      .get('tex_engine', defaultValue: 'Katex') ==
                  'Katex'
              ? const TeXViewRenderingEngine.katex()
              : const TeXViewRenderingEngine.mathjax(),
          child: TeXViewDocument(
            question.text,
            style: TeXViewStyle(backgroundColor: Colors.grey[200]),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        question.question.getView()
      ],
    );
  }
}
