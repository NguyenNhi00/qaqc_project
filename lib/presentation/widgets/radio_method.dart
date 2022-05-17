// ignore_for_file: use_key_in_widget_constructors

import 'package:cha_qaqc_department_mobile_app/presentation/view/Information_error_screen.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/Custom_Check_Information.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/check_box.dart';
import 'package:flutter/material.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/widget.dart';

class RadioMethod extends StatefulWidget {
  final List<Standard> standar;
  // ignore: prefer_const_constructors_in_immutables
  RadioMethod(this.standar);
  @override
  // ignore: no_logic_in_create_state
  State<RadioMethod> createState() => _RadioMethodState(standar);
}

class _RadioMethodState extends State<RadioMethod> {
  List<Standard> standar;
  final List _checked = [];
  bool _check = false;
  _RadioMethodState(this.standar);
  // ignore: unused_field
  static bool visiblContain = false;
  int _value = 0;
  // ignore: unused_field
  int _number = 0;
  List<Widget> customCheckboxErrState = [];
  List<Widget> customCheckInformation = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Radio(value: 0, groupValue: _value, onChanged: SetPassed),
              SizedBox(
                width: 10,
              ),
              TextAnnotation(text: 'Đạt'),
              Radio(value: 1, groupValue: _value, onChanged: SetPassed),
              SizedBox(
                width: 10,
              ),
              TextAnnotation(text: 'Không Đạt'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            child: Container(
                alignment: Alignment.topLeft,
                height: 600.0,
                width: 600.0,
                padding: EdgeInsets.only(left: 10, top: 20),
                child: ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: customCheckboxErrState.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              _check = !_check;
                              _checked.add(index);
                              if (_checked.contains(index) == true) {
                                Global.indexDetailInformation = index;
                                Global.qcReport.appearanceErrors!.add(
                                    standar[Global.i].appearanceErrors![index]);
                                CustomCheckboxErrState(true);
                                print(Global.qcReport);
                              }
                            });
                          },
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 350,
                                  child: TextAnnotation(
                                      text: standar[Global.i]
                                          .appearanceErrors![index]
                                          .toString())),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 5.0, bottom: 5.0),
                                child: Container(
                                    //padding: EdgeInsets.only(left: 5.0),
                                    decoration: BoxDecoration(
                                        color: _checked.contains(index)
                                            ? Colors.blue
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: _checked.contains(index)
                                            ? Border.all(
                                                color: Colors.black, width: 2.0)
                                            : Border.all(
                                                color: Colors.black,
                                                width: 2.0)),
                                    width: 25,
                                    height: 25,
                                    child: _checked.contains(index)
                                        ? Icon(Icons.check, color: Colors.white)
                                        : null),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          InformationErrorScreen(
                                            appearanceError: standar[Global.i]
                                                .appearanceErrors![index],
                                          )));
                                },
                                icon: Icon(Icons.help_outline),
                                iconSize: 30,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey))),
            visible: visiblContain,
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void SetPassed(value) {
    setState(() {
      _value = int.parse(value.toString());
      visiblContain = !visiblContain;
      for (int i = 0; i < standar[Global.i].appearanceErrors!.length; i++) {
        _number++;
        customCheckboxErrState.add(CustomCheckboxErrState(_check));
        customCheckInformation.add(CustomCheckInformation(standar));
      }
    });
  }

  @override
  void initState() {
    setState(() {
      visiblContain = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    _number = 0;
    visiblContain;
    super.dispose();
  }
}
