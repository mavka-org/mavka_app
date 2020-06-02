import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/components/buttons.dart';

import 'getting_started.dart';

class StepDreamGS extends StatelessWidget {
  final StepDreamGSModel model;

  const StepDreamGS(this.model);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: model.isNextActive.stream,
        builder: (context, snapshot) {
          return Column(
            children: [
              Text(
                'Що ти хочеш зробити із набутими знаннями',
                style: GoogleFonts.montserrat(
                    fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(child: exp(context, 'Космічну ракету', 1, isLeft: true)),
              Expanded(
                  child: exp(context, 'Виростити красиву калину', 2,
                      isLeft: false)),
              Expanded(
                  child: exp(
                context,
                'Розробити вакцину проти Коронавірусу',
                3,
                isLeft: true,
              )),
            ],
          );
        });
  }

  Widget exp(BuildContext context, String text, int id,
          {@required bool isLeft}) =>
      Stack(
        children: [
          Align(
            alignment: !isLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: SvgPicture.asset(
              'assets/dreams/dream_1.svg',
              color: Colors.purple,
            ),
          ),
          Align(
              alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
              child:

//            button(text, context,
//                checked: model.dream == id, working: true, onPressed: () {
//              model.dream = id == model.dream ? null : id;
//              model.checkData();
//            }),

                  CheckButtonComponent(
                text: text,
                checked: model.dream == id,
                width: 280,
                fontSize: 16,
                height: 70,
                onPressed: () {
                  model.dream = id == model.dream ? null : id;
                  model.checkData();
                },
              )),
        ],
      );

  Widget button(String text, BuildContext context,
      {@required bool checked,
      @required bool working,
      @required Function() onPressed}) {
    final body = Row(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white,
            disabledColor: Colors.white,
          ),
          child: Checkbox(
            onChanged: working ? (data) => onPressed() : null,
            value: checked,
            checkColor: Colors.black,
            activeColor: Colors.white,
          ),
        ),
        Flexible(
          child: Text(
            text,
            softWrap: true,
            style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: 290,
        child: ButtonTheme(
            height: 70,
            child: FlatButton(
              // if checkbox is active
              // no need for disabled parameters

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.blue,
              disabledColor: Colors.blueGrey,
              onPressed: working ? onPressed : null,
              child: body,
            )),
      ),
    );
  }
}

class StepDreamGSModel extends GSModel {
  int dream;

  @override
  void checkData() {
    isNextActive.add(dream != null);
  }
}
