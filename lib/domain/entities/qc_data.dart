import 'package:equatable/equatable.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';

class QcTester extends Equatable {
  final String? id;
  final String? firstname;
  final String? lastname;
  const QcTester(this.id, this.firstname, this.lastname);
  @override
  List<Object?> get props => [id, firstname, lastname];
}

class DimensionResult extends Equatable {
  final String? name;
  final int? time;
  final List<double?> result;
  final bool? passed;
  const DimensionResult(this.name, this.time, this.result, this.passed);
  @override
  List<Object?> get props => [name, time, result, passed];
}

class QcReport extends Equatable {
  // final QcTester? tester;
  String? machineId;
  String? moldId;
  String? standardId;
  DateTime? productionDate;
  DateTime? timestamp;
  List<DimensionResult>? dimensionResults;
  List<AppearanceError>? appearanceErrors;
  int? batchQuantity;
  QcReport(
      //  this.tester,
      this.machineId,
      this.moldId,
      this.standardId,
      this.productionDate,
      this.timestamp,
      this.dimensionResults,
      this.appearanceErrors,
      this.batchQuantity);
  @override
  List<Object?> get props => [
        // tester,
        machineId,
        moldId,
        standardId,
        productionDate,
        timestamp,
        dimensionResults,
        appearanceErrors,
        batchQuantity
      ];
}
