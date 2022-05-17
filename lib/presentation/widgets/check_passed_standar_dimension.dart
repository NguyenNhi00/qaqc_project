import 'package:flutter/material.dart';

class CustomCheckboxState extends StatelessWidget {
  final bool _checkpassed = false;

  const CustomCheckboxState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
      child: Container(
        //padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            color: _checkpassed ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(25.0),
            border: _checkpassed
                ? Border.all(color: Colors.black, width: 2.0)
                : Border.all(color: Colors.black, width: 2.0)),
        width: 25,
        height: 25,
      ),
    ));
  }
}
