import 'dart:convert';
import 'dart:typed_data';
import 'package:cha_qaqc_department_mobile_app/data/model/qa_model.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:http/http.dart' as http;

class FetchQaDataService {
  //  Errorpacket errorpacket;
  //  FetchQaDataService(this.errorpacket);
  // Future<List<StandardModel>> getQAdata() async {}
  // truyen token lay ve dc vao va lay cac tieu chuan

  Future<List<StandardModel>> getQAdata() async {
    final res = await http.get(
        Uri.parse(Constants.baseUrlStandardClound + 'details'),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials": 'true',
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        });
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<StandardModel> standar =
          body.map((dynamic item) => StandardModel.fromJson(item)).toList();
      // ignore: avoid_print
      print(standar);
      return standar;
    } else {
      throw "Failed to load Data";
    }
  }

  // get file tieu chuan pdf
  Future<Uint8List> fetchPdfContent(
      List<Standard> _standard, bool pdfViewer) async {
    Uint8List uint8list = Uint8List(12);
    try {
      final res = await http.get(
          Uri.parse(Constants.baseUrlStandardClound +
              '${_standard[Global.i].id}/file'),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Credentials": 'true',
            "Access-Control-Allow-Headers":
                "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          });
      if (res.statusCode == 200) {
        final jsonresponse = jsonDecode(res.body);
        final jsonDatafile = jsonresponse['fileData'];
        // print(jsonDatafile);
        uint8list = base64Decode(jsonDatafile);
      }
      return uint8list;
    } catch (e) {
      print(e);
      throw Exception('');
    }
  }
}
