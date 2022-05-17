import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:equatable/equatable.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:flutter/animation.dart';

class ReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class ReporttoggleEvent extends ReportEvent{
  final QcReport qcReport;

  ReporttoggleEvent(this.qcReport);
  @override
  List<Object?> get props => [qcReport];
}
// getStandarEvent
 class GetStandarEvent extends ReportEvent{
   @override
   List<Object> get props => [];
 }
 class ChooseIdEvent extends ReportEvent{
   final String value;
   ChooseIdEvent(this.value);
  @override
  List<Object> get props => [];
}
// nút nhấn "xác nhận lần 1"
class ReportCheckingDataEvent extends ReportEvent {
  final QcReport qcReport;
  ReportCheckingDataEvent(this.qcReport);
   @override
  List<Object?> get props => [qcReport];
}
// nút nhấn "xác nhận" lần 2
class SendReportEvent extends ReportEvent {
  final QcReport qcReport;
   SendReportEvent(this.qcReport);
  @override
  List<Object?> get props => [qcReport];
}
class CheckErrorAppearanceEvent extends ReportEvent{
  final List<Standard> standard;
  CheckErrorAppearanceEvent(this.standard);
  @override
  List<Object> get props => [];
}

