import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:flutter/material.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'constant.dart';

// ignore: use_key_in_widget_constructors
class AnnotationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [Column()],
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: SizeConfig.screenWidth * 0.0468,
              height: SizeConfig.screenWidth * 0.0797,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Constants.mainColor),
                strokeWidth: 6.0,
              )),
          SizedBox(
            height: 30,
          ),
          Text(
            "Đang tải dữ liệu",
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

// Text quanlityCheckProduct
class TextAnnotation extends StatelessWidget {
  final String text;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TextAnnotation({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0),
    );
  }
}

class TopicText extends StatelessWidget {
  final String text;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TopicText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.3515,
      height: SizeConfig.screenheight * 0.0664,
      padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.0156),
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// container

class ContainerText extends StatelessWidget {
  final String text;
  // constructor
  // ignore: use_key_in_widget_constructors
  const ContainerText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenheight * 0.0664, 
        width: SizeConfig.screenWidth * 0.22,
        padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.0078),
        // ignore: unnecessary_string_interpolations
        child: Center(
          child: Text(
            // ignore: unnecessary_string_interpolations
            '$text',
            style: TextStyle(fontSize: 17),
          ),
        ),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)));
  }
}

// Dimensionname
class ContainerTextDimenion extends StatelessWidget {
  final String text;
  // constructor
  // ignore: use_key_in_widget_constructors
  const ContainerTextDimenion(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenheight * 0.0797,
        width: SizeConfig.screenWidth * 0.2171,
        // ignore: unnecessary_string_interpolations
        child: Center(
          child: Text(
            // ignore: unnecessary_string_interpolations
            '$text',
            style: TextStyle(fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)));
  }
}

// DimenionResult 1
// ignore: must_be_immutable
class InputTextField extends StatelessWidget {
  bool checkPassed = false;
  final List<QcReport> _qcReport;
  final Dimension _dimension;
  final int _time;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  InputTextField(
    this._time,
    this._qcReport,
    this._dimension,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
            height: 70.0,
            width: 200.0,
            // padding:
            // EdgeInsets.only(top: 7.0, bottom: 7.0, left: 10.0, right: 60.0),
            child: TextField(
              controller: controller,
              onChanged: (_) {
                if (_dimension.lowerBound! < double.parse(controller.text) &&
                    double.parse(controller.text) < _dimension.upperBound!) {
                  checkPassed = !checkPassed;
                  _qcReport[0].dimensionResults![0].result[_time] =
                      double.parse(controller.text);
                }
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      gapPadding: 1.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0))),
              textAlign: TextAlign.center,
            )),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
            child: Container(
          width: 55,
          height: 55,
          padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
          child: Container(
            //padding: EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
                color: checkPassed ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(35.0),
                border: checkPassed
                    ? Border.all(color: Colors.black, width: 2.0)
                    : Border.all(color: Colors.black, width: 2.0)),
            width: 25,
            height: 25,
          ),
        ))
      ],
    );
  }
}

// dimensionresultadd
class InputDimensionTextFiled extends StatelessWidget {
  final Dimension _inputDimension;
  final List<QcReport> _qcReport;
  final int _time;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  InputDimensionTextFiled(this._time, this._qcReport, this._inputDimension);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 600,
          padding: EdgeInsets.only(left: 195),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(children: [
              // ignore: sized_box_for_whitespace
              Container(
                  height: 50,
                  width: 270,
                  child: InputTextField(_time, _qcReport, _inputDimension)),
            ]),
            //  customCheckboxState(false),
          ),
        ),
      ],
    );
  }
}

// inputnumberproduct
// ignore: must_be_immutable
class InputTextFieldNumberProduct extends StatelessWidget {
  int numberProduct;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  InputTextFieldNumberProduct(
    this.numberProduct,
  );
  @override
  Widget build(BuildContext context) {
    TextEditingController controllernNumberProduct = TextEditingController();
    // ignore: sized_box_for_whitespace
    return Container(
        height: SizeConfig.screenheight * 0.0664,
        width: SizeConfig.screenWidth * 0.22,
        child: TextField(
          style: TextStyle(fontSize: 20),
          keyboardType: TextInputType.number,
          controller: controllernNumberProduct,
          onSubmitted: (value) {
            numberProduct = int.parse(value);
            // ignore: unnecessary_null_comparison
            if (numberProduct != null) {
              Global.qcReport.batchQuantity = numberProduct;
            }
            // ignore: avoid_print
            print(Global.qcReport);
          },
          decoration: InputDecoration(
              hintText: "Nhập số lượng kiểm",
              hintStyle: TextStyle(fontSize: 15),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), gapPadding: 1.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0))),
          textAlign: TextAlign.center,
        ));
  }
}

// check date textfiled
class InputTextFieldCheckingDate extends StatelessWidget {
  String checkingDate;
  DateTime chekingDateInput = DateTime.now();
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  InputTextFieldCheckingDate(this.checkingDate);
  @override
  Widget build(BuildContext context) {
    TextEditingController controllernNumberProduct = TextEditingController();
    // ignore: sized_box_for_whitespace
    return Container(
        height: SizeConfig.screenheight * 0.0664,
        width: SizeConfig.screenWidth * 0.1953,
        child: TextField(
          controller: controllernNumberProduct,
          onSubmitted: (value) {
            if (value == null) {
              Global.qcReport.productionDate = DateTime.parse(checkingDate);
            } else {
              chekingDateInput = DateTime.parse(value);
              // ignore: unnecessary_null_comparison
              Global.qcReport.productionDate = chekingDateInput;
              // ignore: avoid_print
              print(Global.qcReport);
            }
          },
          decoration: InputDecoration(
              hintText: '${checkingDate}',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), gapPadding: 1.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0))),
          textAlign: TextAlign.center,
        ));
  }
}

// container appreancerror and Container appearancestandar

class Contain extends StatelessWidget {
  final Standard standard;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Contain(this.standard);
  // const Contain({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenheight * 0.7978,
        width: SizeConfig.screenWidth * 0.3906,
        padding: EdgeInsets.only(
            right: SizeConfig.screenWidth * 0.0859,
            bottom: SizeConfig.screenheight * 0.0132),
        // ignore: unnecessary_string_interpolations
        child: Center(
          child: Row(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                  width: SizeConfig.screenWidth * 0.1562,
                  height: SizeConfig.screenheight * 0.0664,
                  child: TextAnnotation(
                      text: standard.appearanceErrors.toString())),
              SizedBox(
                width: SizeConfig.screenWidth * 0.0234,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)));
  }
}
