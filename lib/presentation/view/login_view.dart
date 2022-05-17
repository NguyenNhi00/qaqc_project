import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:flutter/material.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/bloc/login_bloc.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/event/login_event.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/state/login_state.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/dialog.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:cha_qaqc_department_mobile_app/utils/password_preferences.dart';
import 'package:cha_qaqc_department_mobile_app/utils/username_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  bool _passwordErr = false;
  bool _userErr = false;
  bool _isShow = true;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  void initState() {
    super.initState();
    userController.text = UsernamePreferences.getUsername() ?? '';
    passController.text = PasswordPreferences.getPassword() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    LoadingDialog loadingDialog = LoadingDialog(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'ĐĂNG NHẬP',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          )),
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            tooltip: 'nut tro ve',
            iconSize: 24.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Constants.thirdColor,
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.3421,
                height: SizeConfig.screenheight * 0.4659,
                decoration: BoxDecoration(
                    color: Constants.mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0))),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenheight * 0.0664,
                    ),
                    Icon(
                      Icons.account_circle_rounded,
                      size: SizeConfig.screenheight * 0.2659,
                      color: Colors.white,
                    ),
                    Text(
                      'Người Kiểm Tra:',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.0468,
                        top: SizeConfig.screenheight * 0.0797),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          size: SizeConfig.screenheight * 0.0398,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.0156,
                        ),
                        Text(
                          'Cài Đặt',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, loginstate) async {
              if (loginstate is LoginLoadingState) {
                loadingDialog.show();
              }
              // else if(loginstate is LoginDoneState){
              //   loadingDialog.dismiss();
              //}
              else if (loginstate is LoginStateFormatChecking) {
                _passwordErr = loginstate.isPasswordErr;
                _userErr = loginstate.isUsernameErr;
              } else if (loginstate is LoginStateToggleShow) {
                _isShow = !loginstate.isShow;
              } else if (loginstate is LoginDoneState) {
                loadingDialog.dismiss();
                await UsernamePreferences.setUsername(userController.text);
                await PasswordPreferences.setPassword(passController.text);
                // ignore: unused_local_variable
                String? employeeIdoverrall =
                    loginstate.user.employee?.employeeId;
                // ignore: unused_local_variable
                String? employeeFirstnameoverrall =
                    loginstate.user.employee?.firstname;
                // ignore: unused_local_variable
                String? employeeLastnameoverrall =
                    loginstate.user.employee?.lastname;
                // Navigator.popAndPushNamed(context, '/third', arguments: {
                //   'Id': employeeIdoverrall.toString(),
                //   'Firstname': employeeFirstnameoverrall.toString(),
                //   'Lastname': employeeLastnameoverrall.toString(),
                // }
                // );
              }
            },
            builder: (context, loginState) {
              SizeConfig().init(context);
              return Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.0781,
                        right: SizeConfig.screenWidth * 0.0781),
                    children: <Widget>[
                      SizedBox(height: SizeConfig.screenheight * 0.0256),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage(
                                'lib/assets/logo_bachkhoa-nobackgr.png'),
                            width: SizeConfig.screenWidth * 0.1550,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.0524,
                          ),
                          Image(
                            image:
                                const AssetImage('lib/assets/DEE_nobackgr.png'),
                            width: SizeConfig.screenWidth * 0.1630,
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenheight * 0.05761),
                      TextField(
                        controller: userController,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(), // add padding to adjust icon
                            child: Icon(
                              Icons.assignment_ind_outlined,
                              size: 20,
                            ),
                          ),
                          hintText: 'Tên Đăng Nhập',
                          hintStyle: TextStyle(fontSize: 18),
                          errorText: _userErr
                              ? 'Tên Đăng Nhập Phải Dài Hơn 3 Ký Tự'
                              : null,
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            gapPadding: 15,
                          ),
                        ),
                        onChanged: (_) {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginEventChecking(
                                  userController.text, passController.text));
                        },
                      ),
                      SizedBox(height: SizeConfig.screenheight * 0.03761),
                      Stack(alignment: AlignmentDirectional.topEnd, children: [
                        TextFormField(
                          obscureText: _isShow,
                          controller: passController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets
                                  .only(), // add padding to adjust icon
                              child: Icon(
                                Icons.assignment_ind_outlined,
                                size: 20,
                              ),
                            ),
                            hintText: 'Mật Khẩu',
                            hintStyle: TextStyle(fontSize: 18),
                            errorText: _userErr
                                ? 'Mật Khẩu Phải Dài Hơn 6 Ký Tự'
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              gapPadding: 15,
                            ),
                          ),
                          onChanged: (_) {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginEventChecking(
                                    userController.text, passController.text));
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(LoginEventToggleShow(_isShow));
                          },
                          icon: Icon(
                            _isShow ? Icons.visibility_off : Icons.visibility,
                            color: Constants.mainColor,
                          ),
                        )
                      ]),
                      SizedBox(
                        height: SizeConfig.screenheight * 0.04375,
                      ),
                      Container(
                        width: SizeConfig.screenWidth * 0.3,
                        height: SizeConfig.screenheight * 0.0815,
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.2109,
                            right: SizeConfig.screenWidth * 0.2109),
                        child: SizedBox(
                          width: SizeConfig.screenWidth * 0.3,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Constants.mainColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            onPressed: () {
                              // (userController.text == "" ||
                              //         passController.text == "" ||
                              //         _userErr ||
                              //         _passwordErr)
                              //     ? null
                              //     : () async {
                              //         BlocProvider.of<LoginBloc>(context).add(
                              //             LoginLoadingEvent(
                              //                 userController.text,
                              //                 passController.text,
                              //                 ));
                              //       };
                              Navigator.pushNamed(context, '/third');
                              
                            },
                            child: Text(
                              'ĐĂNG NHẬP',
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ));
  }
}
