import 'dart:core';
import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContainerCheckDate extends StatefulWidget {
  @override
  State<ContainerCheckDate> createState() => _ContainerCheckDateState();
}

class _ContainerCheckDateState extends State<ContainerCheckDate> {
  DateTime _selectedDate = DateTime.now();
  String _selectedDateView = DateFormat("dd-MM-yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    Global.qcReport.productionDate = _selectedDate;
    return Container(
      padding: EdgeInsets.only(left: 60),
      height: SizeConfig.screenheight * 0.0664,
      width: SizeConfig.screenWidth * 0.22,
      child: Row(
        children: [
          Text(
            '${_selectedDateView}',
            style: TextStyle(fontSize: 17.0),
          ),
          SizedBox(width: 60),
          IconButton(
              onPressed: () {
                _selectDate(context);
              },
              icon: Icon(
                Icons.calendar_today_rounded,
                size: 27,
              )),
        ],
      ),
      decoration: BoxDecoration(border: Border.all()),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (context, child) {
          return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.dark(
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white,
                    surface: Constants.mainColor,
                    onSurface: Colors.black),
                dialogBackgroundColor: Colors.white,
              ),
              child: child!);
        });
    if (_selectedDate != null || (newSelectedDate != null)) {
      setState(() {
        _selectedDate = newSelectedDate!;
        _selectedDateView = DateFormat("dd-MM-yyyy").format(_selectedDate);
        Global.qcReport.productionDate = _selectedDate;
      });
      print(Global.qcReport.productionDate);
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
