import 'package:flutter/material.dart';

class CustomCheckboxErrState extends StatelessWidget {
  bool checked = false;
  CustomCheckboxErrState(this.checked);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
        child: Container(
            //padding: EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
                color: checked ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                border: checked
                    ? Border.all(color: Colors.black, width: 2.0)
                    : Border.all(color: Colors.black, width: 2.0)),
            width: 25,
            height: 25,
            child: checked ? Icon(Icons.check, color: Colors.white) : null),
      ),
    );
  }
}
