
import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:cha_qaqc_department_mobile_app/injector.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/bloc/login_bloc.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/bloc/report_bloc.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/event/report_event.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/home_screen.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/login_view.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/quality_screen.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/report_success_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AppRouter {
 static final List<Standard> _standard = [];
  // ignore: non_constant_identifier_names
  static Route OnGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
      case '/second':
        return MaterialPageRoute(
            builder: (context) => BlocProvider<LoginBloc>(
                  create: (context) => injector(),
                  child: LoginScreen(),
                ));
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ReportBloc>(
                  create: (context) => injector()..add(GetStandarEvent()),
                  child: QuanlityScreen(),
                )
          );
      case '/four': return MaterialPageRoute(builder: (context)=>ReportDoneScreen());
      case '/five': return MaterialPageRoute(builder: (context)=>HistoryScreen());
      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}
