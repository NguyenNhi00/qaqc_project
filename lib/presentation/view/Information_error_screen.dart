

import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:flutter/material.dart';

class InformationErrorScreen extends StatelessWidget {
  AppearanceError appearanceError;
  InformationErrorScreen({required this.appearanceError, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final Uint8List _bytesImage =
    //     Base64Decoder().convert(appearanceError.fileImageErr.toString());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Thông Tin Lỗi',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Constants.mainColor,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  Text(
                    '${appearanceError.name}',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  // Image.memory(_bytesImage, width: 200,fit: BoxFit.fitWidth,),
                  //Text('Chi tiết: ${appearanceError.informationErr}'),
                  SizedBox(
                    height: SizeConfig.screenheight * 0.05,
                  ),
                  Image(
                    image: const AssetImage('lib/assets/bavie_nap_ban_cau.PNG'),
                    //width: SizeConfig.screenWidth * 0.5,
                    height: SizeConfig.screenWidth * 0.4,
                  ),
                  SizedBox(
                    height: SizeConfig.screenheight * 0.005,
                  ),
                  Text(
                    'Mô tả:',
                    style: TextStyle(
                      fontSize: 25,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Chiều cao ≤ 0.1 mm, không sắc nhọn, không ảnh hưởng lắp ráp, quan sát bằng mắt, tần suất: AQL 0.4 / Lot ',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
