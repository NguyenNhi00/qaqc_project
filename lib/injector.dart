import 'package:cha_qaqc_department_mobile_app/data/data_source/fetch_qadata.dart';
import 'package:cha_qaqc_department_mobile_app/data/data_source/fetch_token.dart';
import 'package:cha_qaqc_department_mobile_app/data/data_source/post_report.dart';
import 'package:cha_qaqc_department_mobile_app/data/repositories/authentication_repo.dart';
import 'package:cha_qaqc_department_mobile_app/data/repositories/fetch_qadata_repo.dart';
import 'package:cha_qaqc_department_mobile_app/data/repositories/post_report_repo_impl.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/authentication_repository.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/fetch_qa_data_repository.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/post_report_repository.dart';
import 'package:cha_qaqc_department_mobile_app/domain/use_cases/get_data_qa_usecase.dart';
import 'package:cha_qaqc_department_mobile_app/domain/use_cases/get_user_usecase.dart';
import 'package:cha_qaqc_department_mobile_app/domain/use_cases/post_report_usecase.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/bloc/login_bloc.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/bloc/report_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initialzeDependencies() async {
  //register httpservice
  injector.registerSingleton<FetchQaDataService>(FetchQaDataService());
  injector.registerSingleton<FetchTokenService>(FetchTokenService());
  injector.registerSingleton<PostReportService>(PostReportService());
  //register repo
  injector.registerSingleton<AuthenticationRepository>(
      AuthenticationRepoimpl(injector()));
  injector.registerSingleton<GetQAdataRepository>(GetQAdataRepositoryimpl(injector()));
  injector.registerSingleton<PostReportRepository>(
      PosrReportRepositoryImpl(injector()));
  // register usecase
  injector.registerSingleton<GetDataQAUsecase>(GetDataQAUsecase(injector()));
  injector.registerSingleton<GetUserUsecase>(GetUserUsecase(injector()));
  injector.registerSingleton<SendReportUsecase>(SendReportUsecase(injector()));
  // register bloc
  injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
  injector.registerFactory<ReportBloc>(() => ReportBloc(injector(), injector()));
}
