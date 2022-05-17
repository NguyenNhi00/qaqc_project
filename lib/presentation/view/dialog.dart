import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/bloc/report_bloc.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/event/report_event.dart';
import 'package:ndialog/ndialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingDialog {
  BuildContext buildContext;
  LoadingDialog(this.buildContext);
  ProgressDialog? progressDialog;
  void show() {
    progressDialog = ProgressDialog(
      buildContext,
      title: null,
      message: Text(
        "Đang tải",
        style: TextStyle(fontSize: 20),
      ),
      dismissable: true,
      defaultLoadingWidget: Container(
          //Do dialog ko có kích thước, nên dùng chính Container để chỉnh kích thước cho Dialog và padding để ép size Circular
          padding: EdgeInsets.all(15),
          //  width: 60,
          height: 60,
          child: CircularProgressIndicator(
            strokeWidth: 3,
          )),
    );
    progressDialog!.show();
  }

  void dismiss() {
    progressDialog!.dismiss();
  }
}

class ConfirmDialog {
  QcReport qcReport;
  BuildContext buildContext;
  ConfirmDialog(this.qcReport, this.buildContext);
  void showMyAlertDialog(BuildContext context) {
    // bool tappedCancel = false;
    // creater a AlertDialog
    AlertDialog dialog = AlertDialog(
      title: Container(
        height: 70,
        width: double.infinity,
        color: Constants.mainColor,
        child: Center(child: Text('XÁC NHẬN', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),))),
      content: Text(
        'Bạn Có Chắc Chắn Muốn Xác Nhận?',
        style: TextStyle(fontSize: 25, color:Constants.mainColor),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<ReportBloc>(context)
                .add(SendReportEvent(Global.qcReport));
            if (Global.processPostData = true) {
              Navigator.pop(context);
              Global.i = 0;
              // Global.qcReport = QcReport(null,null,null, [], [], null);
            }
          },
          child: Text(
            'XÁC NHẬN',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xff001D37)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'HỦY BỎ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
        ),
      ],
    );
    Future futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
    futureValue.then((value) {
      // ignore: avoid_print
      print("Return value: " + value.toString()); // true/false
    });
  }
}
