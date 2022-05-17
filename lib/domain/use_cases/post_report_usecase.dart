import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/post_report_repository.dart';

class SendReportUsecase {
  PostReportRepository sendReportRepository;
  SendReportUsecase(this.sendReportRepository);
  Future<void> sendReport(QcReport qcReport) async {
     sendReportRepository.postReport(qcReport);
  }
}
