import 'package:flutter/material.dart';
class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      margin: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width*0.01)),
      height: isActive ? 8 : 5,
      width: isActive ? 15 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isActive ? Color.fromRGBO(38, 132, 254, 100) : Colors.grey[400],
      ),
    );
  }
}