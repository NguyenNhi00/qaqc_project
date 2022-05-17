import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/fetch_qa_data_repository.dart';

class GetDataQAUsecase {
  GetQAdataRepository getQAdataRepository;
  GetDataQAUsecase(this.getQAdataRepository);
  Future<List<Standard>> getQAdata() async {
    final dataQA = await getQAdataRepository.getQAdata();
    return dataQA;
  }
}
// class GetAppearanceInformationUsecase{
//   List<Standard> _standard;
//   GetAppearanceInformationRepository getAppearanceInformationRepository;
//   GetAppearanceInformationUsecase(this._standard,this.getAppearanceInformationRepository);
//   Future<List<AppearanceErrorInformation>> getAppearanceInformation(_standard) async{
//     final dataAppearanceInformation = await getAppearanceInformationRepository.getAppearanceInformation(_standard);
//     return dataAppearanceInformation;
//   }
// }
