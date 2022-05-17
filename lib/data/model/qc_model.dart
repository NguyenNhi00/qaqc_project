import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';

class QcTesterModel extends QcTester {
  const QcTesterModel({String? id, String? firstname, String? lastname})
      : super(id, firstname, lastname);
}

class DimensionResultModel extends DimensionResult {
  const DimensionResultModel(
      {String? name, int? time, List<double?>? result, bool? passed})
      : super(name, time, result as List<double>, passed);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['count'] = time;
    data['result'] = result;
    data['passed'] = passed;
    return data;
  }
}

class AppearanceErrorModel extends AppearanceError {
  // ignore: prefer_const_constructors_in_immutables
  AppearanceErrorModel(
      {String? name, 
      // String? fileImageErr, 
      // String? informationErr
      })
      : super(name, 
      // fileImageErr, 
      // informationErr
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    // data[''] = fileImageErr;
    // data[''] = informationErr;
    return data;
  }
}

class QcReportModel extends QcReport {
  QcReportModel(
      {
      //QcTester? tester,
      final String? machineId,
      final String? moldId,
      final String? standardId,
      final DateTime? productionDate,
      final DateTime? timestamp,
      final List<DimensionResult>? dimensionResults,
      final List<AppearanceError>? appearanceErrors,
      final int? batchQuantity})
      : super(
          // tester,
          machineId,
          moldId,
          standardId,
          productionDate,
          timestamp,
          dimensionResults,
          appearanceErrors,
          batchQuantity,
        );
}
