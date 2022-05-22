import 'dart:convert';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PostReportService {
  List bodyJson = [];
  List bodyJsonErr = [];
  bool processConfirmData = false;
  Future<void> postReport(
    QcReport qcReport,
  ) async {
    for (int i = 0; i < qcReport.dimensionResults!.length; i++) {
      Map<String, dynamic> dimensionJson = {
        "name": qcReport.dimensionResults![i].name.toString(),
        "sampleNumber":
            int.parse(qcReport.dimensionResults![i].time.toString()),
        "result": qcReport.dimensionResults![i]
            .result[int.parse(qcReport.dimensionResults![i].time.toString())]!
            .toDouble(),
        "passed": qcReport.dimensionResults![i].passed.toString() == 'true'
            ? true
            : false,
      };
      bodyJson.add(dimensionJson);
    }
    if (qcReport.appearanceErrors != null) {
      for (int j = 0; j < qcReport.appearanceErrors!.length; j++) {
        Map<String, dynamic> errJson = {
          "name": qcReport.appearanceErrors![j].name.toString(),
        };
        bodyJsonErr.add(errJson);
      }
    } else {
      Map<String, dynamic> errJson = {
        "name": qcReport.appearanceErrors![0].name.toString(),
      };
      bodyJsonErr.add(errJson);
    }
    final url =
        Uri.parse(Constants.postClound);
    http.Response res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'moldId': qcReport.moldId.toString(),
        'machineId': qcReport.machineId.toString(),
        "productionDate": qcReport.productionDate!.toString(),
        "timestamp": DateTime.now().toString(),
        "batchQuantity": int.parse(qcReport.batchQuantity.toString()),
        "standardId": qcReport.standardId.toString(),
        "dimensionResults": bodyJson,
        "appearanceResults": bodyJsonErr,
        "qcTesterId": "nynhi"
      }),
    );
    if (res.statusCode == 200) {
      bodyJson = [];
      bodyJsonErr = [];
      print('${res.statusCode} :Data posted!');
      processConfirmData = true;
      Global.processPostData = processConfirmData;
    } else {
      bodyJson = [];
      bodyJsonErr = [];
      Container();
      print(res.statusCode);
      throw Exception('Post process failed !');
    }
  }
}
