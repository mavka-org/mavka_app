import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavka/screens/material_pages/list_of_courses.dart';

class ChooseClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        actionSheet(context);
      },
      child: const Text('Оберіть клас'),
    );
  }
}

void actionSheet(BuildContext context) {
  final items = <CupertinoActionSheetAction>[];
  for (int i = 1; i < 12; i++) {
    items.add(CupertinoActionSheetAction(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListOfCourses(form: i)));
      },
      child: Text(
        i.toString(),
        style: const TextStyle(fontFamily: 'Gilroy'),
      ),
    ));
  }
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: const Text(
          'Клас',
          style:
              TextStyle(fontFamily: 'GilroyBold', fontWeight: FontWeight.bold),
        ),
        message: const Text(
          'У якому класі Ви навчаєтеся?', //TODO
          style: TextStyle(fontFamily: 'Gilroy'),
        ),
        actions: items,
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Скасувати',
            style: TextStyle(fontFamily: 'Gilroy'),
          ),
        ),
      );
    },
  );
}
