import 'package:cha_qaqc_department_mobile_app/data/data_source/fetch_qadata.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/fetch_qa_data_repository.dart';

class GetQAdataRepositoryimpl implements GetQAdataRepository {
  final FetchQaDataService httpService;
  GetQAdataRepositoryimpl(this.httpService);
  @override
  Future<List<Standard>> getQAdata() {
    return httpService.getQAdata();
  }
}
// class GetAppearanceInformationRepositoryimpl implements GetAppearanceInformationRepository{
//   List<Standard> standard;
//   final FetchQaDataService httpService;
//   GetAppearanceInformationRepositoryimpl(this.standard,this.httpService);
//   @override
//   Future<List<AppearanceErrorInformation>> getAppearanceInformation(standard) {
//     return httpService.getAppearanceInformation(standard);
//   }}
