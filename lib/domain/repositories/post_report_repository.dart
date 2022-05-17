import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';

abstract class PostReportRepository {
  Future<void> postReport(QcReport qcReport);
}
