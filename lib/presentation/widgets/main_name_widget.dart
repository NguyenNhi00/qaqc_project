import 'package:flutter/material.dart';

import 'constant.dart';

class MainAppName extends StatelessWidget {
  const MainAppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: SizeConfig.screenheight * 0.156),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('lib/assets/logo_bachkhoa-nobackgr.png'),
              width: 200,
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.0224,
            ),
            Image(
              image: const AssetImage('lib/assets/DEE_nobackgr.png'),
              width: SizeConfig.screenWidth * 0.2590,
            )
          ],
        ),
      ],
    );
  }
}
