
import 'package:flutter/material.dart';
import 'package:cha_qaqc_department_mobile_app/injector.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/routers/app_router.dart';
Future<void> main() async{
  await initialzeDependencies();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    //final AppRouter _appRouter = AppRouter();
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Kiểm định chất lượng và Báo cáo',
     //  home: TextFieldDimesion(),
     onGenerateRoute: AppRouter.OnGenerateRoutes,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}

