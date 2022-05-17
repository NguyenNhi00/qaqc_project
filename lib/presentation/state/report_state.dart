import 'package:equatable/equatable.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';

class ReportState extends Equatable {
  @override
  List<Object?> get props => [];
}
class IntState extends ReportState{
   @override
  List<Object?> get props => [];
}
// gettandar
class GetStandarState extends ReportState{
  DateTime timestamp;
  final List<Standard> standar;
  GetStandarState(this.standar, this.timestamp);
  @override
  List<Object> get props => [timestamp];
}
class ChooseIdState extends ReportState{
  @override
  List<Object> get props => [];
}
// kiểm tra info of the report
// ignore: must_be_immutable
class ReportCheckingState extends ReportState {
  QcReport qcReport;
  bool fullInfo;
  ReportCheckingState(this.qcReport,this.fullInfo);
   @override
  List<Object?> get props => [fullInfo,qcReport];
}
class CheckErrorAppearanceState extends ReportState{
  // List<AppearanceErrorInformation> appearanceErrorInformation;
  // CheckErrorAppearanceState(this.appearanceErrorInformation);
  @override
  List<Object> get props => [];
}

// màn hình xác nhận report thành công
class ReportDoneState extends ReportState {
  @override
  List<Object?> get props => [];
}
