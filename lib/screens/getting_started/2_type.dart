import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavka/models/user/types.dart';

import 'getting_started.dart';

class StepTypeGS extends StatelessWidget {
  final StepTypeGSModel model;

  const StepTypeGS(this.model);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: model.isNextActive.stream,
      builder: (context, snapshot) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Що описує тебе найкраще',
            style: GoogleFonts.montserrat(
                fontSize: 28, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 32,
          ),
          button('Учень (-ця)', context,
              checked: model.userType == UserType.student,
              working: true, onPressed: () {
            print('change!!!');
            if (model.userType == null) {
              model.userType = UserType.student;
            } else {
              model.userType = null;
            }
            model.checkData();
          }),
          const SizedBox(
            height: 16,
          ),
          button('Батьки', context,
              working: false, checked: false, onPressed: () {}),
          const SizedBox(
            height: 16,
          ),
          button('Вчитель', context,
              working: false, checked: false, onPressed: () {}),
        ],
      ),
    );
  }

  //todo onPressed insted of active
  Widget button(String text, BuildContext context,
      {@required bool checked,
      @required bool working,
      @required Function() onPressed}) {
    print('building for $working, $checked');

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
        Text(
          text,
          style: GoogleFonts.montserratAlternates(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
        ),
      ],
    );

    return ButtonTheme(
        height: 70,
        minWidth: double.infinity,
        child: FlatButton(
          // if checkbox is active
          // no need for disabled parameters

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blue,
          disabledColor: Colors.blueGrey,
          onPressed: working ? onPressed : null,
          child: body,
        )

//      child: Material(
//        borderRadius: BorderRadius.circular(8),
//        color: checked ? Colors.blue : Colors.transparent,
//        child: InkWell(
//          onTap: working ? onPressed : null,
//          borderRadius: BorderRadius.circular(8),
//          child: Container(
//            decoration: BoxDecoration(
//                border: Border.all(width: 2, color: Colors.blue),
//                borderRadius: BorderRadius.circular(8)),
//            height: 80,
//            child: body,
//          ),
//        ),
//      ),
        );
  }
}

class StepTypeGSModel extends GSModel {
  UserType userType;

  @override
  void checkData() => isNextActive.add(userType != null);
}
