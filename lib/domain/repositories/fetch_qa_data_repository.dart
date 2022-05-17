import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';

abstract class GetQAdataRepository {
  GetQAdataRepository(GetQAdataRepository getQAdataRepository);

  Future<dynamic> getQAdata();
}
// abstract class GetAppearanceInformationRepository {
//   GetAppearanceInformationRepository(GetAppearanceInformationRepository getAppearanceInformationRepository);

//   Future<List<AppearanceErrorInformation>> getAppearanceInformation(List<Standard> standard);
// }
