// ignore_for_file: use_key_in_widget_constructors

import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldDimesion extends StatefulWidget {
  final Dimension _dimension;
  final String checkDate;
  final String checkTime;
  // ignore: prefer_const_constructors_in_immutables
  TextFieldDimesion(this._dimension, this.checkDate, this.checkTime);
  @override
  // ignore: no_logic_in_create_state
  State<TextFieldDimesion> createState() =>
      // ignore: no_logic_in_create_state, unnecessary_this
      _TextFieldDimesionState(_dimension, checkDate, checkTime);
}

class _TextFieldDimesionState extends State<TextFieldDimesion> {
  List<TextEditingController> controllers = [];
  List<bool> checkPassed = [false, false, false, false, false, false];
  int _counter = 1;
  final Dimension _dimension;
  final List<double> result = [];
  String checkDate;
  String checkTime;
  _TextFieldDimesionState(this._dimension, this.checkDate, this.checkTime);
  @override
  void dispose() {
    for (TextEditingController c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // ignore: sized_box_for_whitespace
         Expanded(
          child: ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: _counter,
            itemBuilder: (BuildContext context, int index) {
              controllers.add(TextEditingController());
              return Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controllers[index],
                        autofocus: false,
                        onSubmitted: (value) {
                          if (_dimension.lowerBound! <= double.parse(value) &&
                              double.parse(value) <= _dimension.upperBound!) {
                            setState(() {
                              checkPassed[index] = true;
                              Global.indexDimension = index;
                              if (checkPassed[index] == true) {
                                result
                                    .add(double.parse(controllers[index].text));
                              }
                            });
                            // Global.qcReport.productionDate = DateFormat('MM/dd/yyy').parse(checkDate);
                            Global.qcReport.timestamp =
                                DateFormat('HH:mm:ss').parse(checkTime);
                            Global.qcReport.dimensionResults?.add(
                                DimensionResult(_dimension.name, index, result,
                                    checkPassed[index]));
                            // ignore: avoid_print
                            print(Global.qcReport);
                          } else if (_dimension.lowerBound! >
                                  double.parse(value) ||
                              double.parse(value) > _dimension.upperBound!) {
                            setState(() {
                              checkPassed[index] = false;
                              Global.indexDimension = index;
                              if (checkPassed[index] == false) {
                                result
                                    .add(double.parse(controllers[index].text));
                              }
                            });
                            Global.qcReport.productionDate =
                                DateFormat('MM/dd/yyy').parse(checkDate);
                            Global.qcReport.timestamp =
                                DateFormat('HH:mm:ss').parse(checkTime);
                            Global.qcReport.dimensionResults?.add(
                                DimensionResult(_dimension.name, index, result,
                                    checkPassed[index]));
                            // ignore: avoid_print
                            print(Global.qcReport.dimensionResults!.length);
                          }
                          // else{
                          //    setState(() {
                          //      checkPassed[index] = false;
                          //     if(checkPassed[index] == false){

                          //     }

                          //     });
                          //     result.add(double.parse(controllers[index].text));
                          //       Global.qcReport.dimensionResults?.add(DimensionResult(_dimension.name, index, result, checkPassed[index]));

                          //       print(Global.qcReport.dimensionResults);
                          // }
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[20],
                          filled: true,
                            hintText: "Nhập Kích Thước",
                            hintStyle: TextStyle(fontSize: 15),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 15.0),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                gapPadding: 1.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0))),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 55,
                      height: 55,
                      padding:
                          EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
                      child: Container(
                        //padding: EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                            color:
                                checkPassed[index] ? Colors.blue : Colors.red,
                            borderRadius: BorderRadius.circular(35.0),
                            border: checkPassed[index]
                                ? Border.all(color: Colors.black, width: 2.0)
                                : Border.all(color: Colors.black, width: 2.0)),
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      

      SizedBox(
        width: 5,
      ),
      IconButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          icon: Icon(
            Icons.add_circle,
            size: 40,
          )),
      SizedBox(
        width: 5,
      ),
      IconButton(
          onPressed: () {
            setState(() {
              _counter = _counter - 1;
              // ignore: list_remove_unrelated_type
              // Global.qcReport.dimensionResults![_counter].result.removeLast();
              // Global.qcReport.dimensionResults!.removeAt(index);
              controllers[_counter].clear();

              print(Global.qcReport);
              // Global.qcReport.dimensionResults![_counter].result[_counter] = null;
            });
          },
          icon: Icon(
            Icons.do_disturb_on_outlined,
            size: 40,
          ))
    ]);
  }
}
