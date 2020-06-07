import 'package:flutter/material.dart';
import 'package:mavka/layouts/authorized/page.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      hero: 'card0',
      color: Colors.indigo[300],
      title: 'Астрономія',
      child: Column(
        children: [
          FlatButton(
            onPressed: () => Navigator.of(context).pushNamed('/test'),
            child: const Text('run a test'),
          )
        ],
      ),
    );
  }
}
