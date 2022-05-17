import 'package:flutter/material.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/main_name_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'KIỂM ĐỊNH CHẤT LƯỢNG SẢN PHẨM KHU MÁY ÉP',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Constants.mainColor,
      ),
      body: Column(
        children: [
          MainAppName(),
          SizedBox(
            height: SizeConfig.screenheight * 0.0837,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.7,
            height: SizeConfig.screenheight * 0.0815,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text(
                'ĐĂNG NHẬP',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xff001D37),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
            ),
          ),
        ],
      ),
    );
  }
}
