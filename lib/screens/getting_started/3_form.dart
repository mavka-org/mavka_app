import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/components/buttons.dart';
import 'package:mavka/screens/getting_started/getting_started.dart';

class StepFormGS extends StatelessWidget {
  final StepFormGSModel model;

  const StepFormGS(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'За якою програмою ти хочеш навчатися',
          style:
              GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 32,
        ),
        StreamBuilder<bool>(
            stream: model.isNextActive.stream,
            builder: (context, snapshot) {
              return ListView(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                children: [for (var i = 1; i < 12; i += 1) i]
                    .map((i) => CheckButtonComponent(
                        text: '$i клас',
                        checked: model.form == i,
                        onPressed: () {
                          model.form = model.form == i ? null : i;
                          model.checkData();
                        }))
                    .toList()
                    .cast<Widget>(),
              );
            }),
      ],
    );
  }

// todo button as a component
//  Widget button(String text, BuildContext context,
//      {@required bool checked,
//      @required bool working,
//      @required Function() onPressed}) {
//    final body = Row(
//      children: [
//        Theme(
//          data: Theme.of(context).copyWith(
//            unselectedWidgetColor: Colors.white,
//            disabledColor: Colors.white,
//          ),
//          child: Checkbox(
//            onChanged: working ? (data) => onPressed() : null,
//            value: checked,
//            checkColor: Colors.black,
//            activeColor: Colors.white,
//          ),
//        ),
//        Text(
//          text,
//          style: GoogleFonts.montserratAlternates(
//              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
//        ),
//      ],
//    );
//
//    return Padding(
//      padding: const EdgeInsets.only(bottom: 12),
//      child: ButtonTheme(
//          height: 40,
//          minWidth: double.infinity,
//          child: FlatButton(
//            // if checkbox is active
//            // no need for disabled parameters
//
//            shape:
//                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//            color: Colors.blue,
//            disabledColor: Colors.blueGrey,
//            onPressed: working ? onPressed : null,
//            child: body,
//          )),
//    );
//  }
}

class StepFormGSModel extends GSModel {
  int form;

  @override
  void checkData() {
    isNextActive.add(form != null);
  }
}
