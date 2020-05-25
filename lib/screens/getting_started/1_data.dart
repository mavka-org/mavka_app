import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'getting_started.dart';

class StepDataGS extends StatelessWidget {
  final StepDataGSModel model;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  StepDataGS(this.model);

  @override
  Widget build(BuildContext context) {
    _firstNameController.addListener(() {
      model.firstName = _firstNameController.text;
      model.checkData();
    });

    _lastNameController.addListener(() {
      model.lastName = _lastNameController.text;
      model.checkData();
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Більше про тебе',
          style:
              GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 18,
        ),
        TextFormField(
          controller: _firstNameController..text = model.firstName,
          autofocus: true,
          decoration: const InputDecoration(
            //todo Icons -> FlutterIcons
            icon: Icon(FlutterIcons.account_mco),
            labelText: "Ім'я",
          ),
          keyboardType: TextInputType.text,
          autovalidate: true,
          autocorrect: false,
        ),
        TextFormField(
          autofocus: true,
          controller: _lastNameController..text = model.lastName,
          decoration: const InputDecoration(
            //todo Icons -> FlutterIcons
            icon: Icon(FlutterIcons.account_badge_mco),
            labelText: 'Фамілія',
          ),
          keyboardType: TextInputType.text,
          autovalidate: true,
          autocorrect: false,
        ),
      ],
    );
  }
}

class StepDataGSModel extends GSModel {
  String firstName;
  String lastName;

  @override
  void checkData() {
    print('checking data');
    isNextActive.add((firstName != null && lastName != null) &&
        (firstName.isNotEmpty && lastName.isNotEmpty));
  }
}
