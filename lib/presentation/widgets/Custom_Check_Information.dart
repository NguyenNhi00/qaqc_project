import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:flutter/material.dart';


class CustomCheckInformation extends StatelessWidget {
  List<Standard> _standard;
  CustomCheckInformation(this._standard);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      
    }, icon: Icon(Icons.help_outline), iconSize: 30,);
  }
}