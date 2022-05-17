

import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/use_cases/get_data_qa_usecase.dart';
import 'package:cha_qaqc_department_mobile_app/domain/use_cases/post_report_usecase.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/event/report_event.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/state/report_state.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {

   bool full = false;
  final SendReportUsecase _sendReportUsecase;
  final GetDataQAUsecase _getDataQAUsecase;
  // final GetAppearanceInformationUsecase _getAppearanceInformationUsecase;
  ReportBloc(this._sendReportUsecase, this._getDataQAUsecase) : super(IntState()) {
    on<GetStandarEvent>(onGetStandar);
    on<ReportCheckingDataEvent>(onChecking);
    on<SendReportEvent>(onSendReport);
    on<ChooseIdEvent>(onChooseIdMachine);
    //  on<CheckErrorAppearanceEvent>(onCheckErr);
  }

  Future<void> onGetStandar(ReportEvent event, Emitter<ReportState> emit) async{
    if(event is GetStandarEvent){
  
      final standar = await _getDataQAUsecase.getQAdata();
      return emit(GetStandarState(standar, DateTime.now()));
    }
  }

  Future<void> onChecking(ReportEvent event, Emitter<ReportState> emit) async {
    if (event is ReportCheckingDataEvent) {
       try {
      int? batchQuanlity = Global.qcReport.batchQuantity;
      List<DimensionResult>? dimensionResult = Global.qcReport.dimensionResults;
      if (
          batchQuanlity != null &&
         dimensionResult != null
        ) 
        {
            full = !full;
            emit(ReportCheckingState(event.qcReport, full));
         // ignore: unused_local_variable
       }
        else {
          emit(ReportCheckingState(event.qcReport,false));
        }
       }catch(e){
         // ignore: avoid_print
         print(e);
      } 
    }
  }
  Future<void> onChooseIdMachine(ReportEvent event, Emitter<ReportState> emit) async {
    if(event is ChooseIdEvent){
      //Global.qcReport.machineId = event.value;
      print(Global.qcReport);
      return emit(ChooseIdState());
    }
  }

  // Future<void> onCheckErr(ReportEvent event,Emitter<ReportState> emit) async{
  //   if(event is CheckErrorAppearanceEvent){
  //     final dataAppearanceInformation = await _getAppearanceInformationUsecase.getAppearanceInformation(event.standard);
  //     return emit(CheckErrorAppearanceState(dataAppearanceInformation));
  //   }
  // }

  Future<void> onSendReport(ReportEvent event, Emitter<ReportState> emit) async{
    if(event is SendReportEvent){
      print('Global report in Bloc' + Global.qcReport.dimensionResults!.length.toString());
    await _sendReportUsecase.sendReport(Global.qcReport);
      return emit(ReportDoneState());
    }
  }

}