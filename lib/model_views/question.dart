import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:hive/hive.dart';
import 'package:mavka/models/test/question.dart';

class QuestionView extends StatelessWidget {
  final Question question;

  const QuestionView(this.question);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TeXView(
          renderingEngine: Hive.box<String>('prefs')
                      .get('tex_engine', defaultValue: 'Katex') ==
                  'Katex'
              ? const TeXViewRenderingEngine.katex()
              : const TeXViewRenderingEngine.mathjax(),
          loadingWidgetBuilder: (_) => const LinearProgressIndicator(),
          child: TeXViewDocument(
            question.text,
            style: TeXViewStyle(
                backgroundColor: Colors.grey[200],
                fontStyle: TeXViewFontStyle(fontSize: 18)),
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
