import 'package:cha_qaqc_department_mobile_app/data/data_source/post_report.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/repositories/post_report_repository.dart';

class PosrReportRepositoryImpl implements PostReportRepository {
  final PostReportService postReportService;
  PosrReportRepositoryImpl(this.postReportService);
  @override
  Future<void> postReport(QcReport qcReport) {
    return postReportService.postReport(qcReport);
  }
}
