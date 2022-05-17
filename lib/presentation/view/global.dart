import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';

abstract class Global {
  static String token = '';
  static String id = '';
  static int i = 0;
  static int indexDetailInformation = 0;
  static int indexDimension = 0;
  static bool processPostData = false;
  static QcReport qcReport =
      QcReport( null,null,null, null, null, [], [], null);
}
