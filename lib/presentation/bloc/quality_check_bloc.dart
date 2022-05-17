// import 'dart:ffi';

// import 'package:bloc/bloc.dart';
// import 'package:cha_qaqc_department_mobile_app/domain/use_cases/get_data_qa_usecase.dart';
// import 'package:cha_qaqc_department_mobile_app/presentation/event/quality_check_event.dart';
// import 'package:cha_qaqc_department_mobile_app/presentation/state/quality_check_state.dart';

// class QualityCheckBloc extends Bloc<QualityCheckEvent, QualityCheckState>{
//   final GetAppearanceInformationUsecase _getAppearanceInformationUsecase;

//   QualityCheckBloc(QualityCheckState initialState, this._getAppearanceInformationUsecase) : super(initialState);
//   // QualityCheckBloc(this._getAppearanceInformationUsecase) : super(QualityCheckErrorAppearanceState()){
//   //   on<QualityCheckErrorAppearanceEvent>(onCheckErr);
//   // }
//   // Future<void> onCheckErr(QualityCheckEvent event,Emitter<QualityCheckState> emit)async{
//   //   if(event is QualityCheckErrorAppearanceEvent){
//   //     final dataAppearanceInformation = await _getAppearanceInformationUsecase.getAppearanceInformation();
//   //     return emit(QualityCheckErrorAppearanceState());
//   //   }
//   // }
// }