// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:typed_data';

import 'package:cha_qaqc_department_mobile_app/data/data_source/fetch_qadata.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/event/report_event.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/dialog.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/report_success_screen.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/autocomplete_textfiled.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/container_check_date.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/state/login_state.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/text_field_dimension.dart';
import 'package:flutter/material.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';
import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/bloc/report_bloc.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/state/report_state.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/radio_method.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class QuanlityScreen extends StatefulWidget {
  const QuanlityScreen({Key? key}) : super(key: key);

  // ignore: use_key_in_widget_constructors

  @override
  State<QuanlityScreen> createState() => _QuanlityScreenState();
}

class _QuanlityScreenState extends State<QuanlityScreen> {
  FetchQaDataService fetchQaDataService = FetchQaDataService();
  String checkingTime = DateFormat('HH:mm:ss').format(DateTime.now());
  String checkingDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  bool visible = false;
  bool pdfView = false;
  List<Standard> _standard = [];
  List<String> producId = [];
  List<String> machineId = ['L25', 'M26', 'L10', 'MS600'];
  List<String> molId = ['B109','B075','B074','B074','B272','B015','B223','B223','B075','B009','K045',
'B051','B227','B096','B111','B169','B070','B109','B099','B069','B063','B118','K044','K044','B061','B061',
'GC05','GC05','K076','K076','B074','B074','K055','B062-2'
];
  late QcTester _qcTester;
  String idSelector = '';
  int _numberDimension = 0;
  int _numberDimension1 = 0;
  int _numberDimension2 = 0;
  int _numberDimension3 = 0;
  int _numberDimension4 = 0;
  int _numberDimension5 = 0;
  final int _batchQuantity = 0;
  TextEditingController myController = TextEditingController();
  String label = "ProducId";
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    // ignore: avoid_print
    print("Textfield value: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    // final arg =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final employeeIdoverrall = arg['Id'];
    // final employeeFirstnameoverrall = arg['Firstname'];
    // final employeeLastnameoverrall = arg['Lastname'];

    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'KIỂM TRA CHẤT LƯỢNG SẢN PHẨM',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          )),
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            tooltip: 'Trở lại',
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
                      'Người Kiểm Tra: nhi0201',
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
                  SizedBox(
                    height: SizeConfig.screenheight * 0.0398,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.0468),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: SizeConfig.screenheight * 0.0398,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.0156,
                          ),
                          Text(
                            'Đăng Xuất',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Global.qcReport =
                          QcReport(null,null,null, null, null, [], [], null);
                      Navigator.popAndPushNamed(context, '/');
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        // body: SingleChildScrollView(
        //     scrollDirection: Axis.vertical,
        //     child: BlocConsumer<ReportBloc, ReportState>(
        //         listener: (context, qualityState) async {},
        //         builder: (context, qualityState) {
        //           return Column(children: [
        //                 ListView(
        //                   shrinkWrap: true,
        //                   padding: EdgeInsets.only(left: 100, right: 100),
        //                   children: [
        //                     SizedBox(height: 70),
        //                     // SizedBox(height:SizeConfig.screenheight * 0.0584,),
        //                     Column(
        //                       children: [
        //                         Row(
        //                           children: [
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(
        //                                 text: 'Mã Sản Phẩm:',
        //                               ),
        //                             ),
        //                             Textfield_seach(),
        //                             SizedBox(
        //                               // width: SizeConfig.screenWidth * 0.05242,
        //                               width: 100,
        //                             ),
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Ngày Kiểm:')),
        //                             ContainerText(
        //                                 productDate) // lay du lieu ngày thang gan vào bien text của container,
        //                           ],
        //                         ),
        //                         Row(
        //                           children: [
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Tên Sản Phẩm')),
        //                             ContainerText(productName),
        //                             SizedBox(
        //                               width: 100,
        //                             ),
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Thời Gian Kiểm')),
        //                             ContainerText(productTime)
        //                           ],
        //                         ),
        //                         Row(
        //                           children: [
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Mã Tiêu Chuẩn')),
        //                             ContainerText(standarId),
        //                             SizedBox(
        //                               width: 100,
        //                             ),
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Số Lượng Kiểm')),
        //                               InputTextField(),
        //                           ],
        //                         )
        //                       ],
        //                     )
        //                   ],
        //                 ),

        //           ]);
        //         })
        //         )
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: BlocConsumer<ReportBloc, ReportState>(
                listener: (context, reportState) {
              SizeConfig().init(context);
              if (reportState is IntState) {
                // ignore: unused_element
              } else if (reportState is GetStandarState) {
                
                _standard = reportState.standar;
                _numberDimension = _standard[Global.i].dimensions!.length;
                print('numberDimension:${_numberDimension}');
                if (_numberDimension == 1) {
                  _numberDimension1 = 0;
                  _numberDimension2 = 0;
                  _numberDimension3 = 0;
                  _numberDimension4 = 0;
                  _numberDimension5 = 0;
                } else if (_numberDimension == 2) {
                  _numberDimension1 = 0;
                  _numberDimension2 = 1;
                  _numberDimension3 = 1;
                  _numberDimension4 = 1;
                  _numberDimension5 = 1;
                } else if (_numberDimension == 3) {
                  _numberDimension1 = 0;
                  _numberDimension2 = 1;
                  _numberDimension3 = 2;
                  _numberDimension4 = 2;
                  _numberDimension5 = 2;
                } else if (_numberDimension == 4) {
                  _numberDimension1 = 0;
                  _numberDimension2 = 1;
                  _numberDimension3 = 2;
                  _numberDimension4 = 3;
                  _numberDimension5 = 3;
                } else if (_numberDimension == 5) {
                  _numberDimension1 = 0;
                  _numberDimension2 = 1;
                  _numberDimension3 = 2;
                  _numberDimension4 = 3;
                  _numberDimension5 = 4;
                }
                Global.qcReport.standardId = _standard[Global.i].id;
                try {
                  for (int m = 0; m < _standard.length; m++) {
                    producId.add(_standard[m].product!.id.toString());
                    // ignore: avoid_print
                    print(producId);
                  }
                  // ignore: empty_catches
                } catch (e) {}
                // ignore: avoid_print
                print(_standard);
              } else if (reportState is ReportCheckingState) {
                reportState.qcReport = Global.qcReport;
                if (reportState.fullInfo == true) {
                  ConfirmDialog(Global.qcReport, context)
                      .showMyAlertDialog(context);
                }
              } else if (reportState is ReportDoneState) {
              } else {}
            }, builder: (context, reportState) {
              // LoadingDialog _loadingDialog = LoadingDialog(context);
              if (reportState is ReportDoneState) {
                if (Global.processPostData = true) {
                  return ReportDoneScreen();
                }
              }
              if (reportState is GetStandarState ||
                  reportState is InitialState ||
                  reportState is ChooseIdState ||
                  reportState is ReportCheckingState) {
                return Column(children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                        width: SizeConfig.screenWidth * 0.54,
                        //decoration: BoxDecoration(color: Colors.blue),
                        margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.0234),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: SizeConfig.screenheight * 0.093),
                            Row(
                              children: [
                                Container(
                                    height: SizeConfig.screenheight * 0.0664,
                                    width: SizeConfig.screenWidth * 0.1462,
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.screenWidth * 0.0078,
                                        top: SizeConfig.screenheight * 0.0132),
                                    child: TextAnnotation(text: 'Mã Máy:')),
                                AutocompleteTextfieldMachine(machineId),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.0265,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: SizeConfig.screenheight * 0.0664,
                                  width: SizeConfig.screenWidth * 0.15625,
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * 0.0078,
                                      top: SizeConfig.screenheight * 0.01329),
                                  child: TextAnnotation(
                                    text: 'Mã Sản Phẩm:',
                                  ),
                                ),
                                Container(
                                    height: SizeConfig.screenheight * 0.0664,
                                    width: SizeConfig.screenWidth * 0.22,
                                    alignment: Alignment.center,
                                    child: DropdownSearch<String>(
                                      dropdownSearchDecoration: InputDecoration(
                                         filled: true,
                                         fillColor: Colors.grey[20],
                                          contentPadding: EdgeInsets.only(
                                              left: SizeConfig.screenWidth *
                                                  0.0781)),
                                      mode: Mode.MENU,
                                      showSelectedItems: true,
                                      showSearchBox: true,
                                      items: producId,
                                      dropdownSearchBaseStyle: TextStyle(
                                        fontSize: 20,
                                      ),
                                      popupItemDisabled: (String s) =>
                                          s.startsWith('I'),
                                      selectedItem: producId[0],
                                      onChanged: (id) {
                                        setState(() {
                                          for (int i = 0;
                                              i < producId.length;
                                              i++) {
                                            if (id == producId[i]) {
                                              Global.i = i;
                                              _numberDimension =
                                                  _standard[Global.i]
                                                      .dimensions!
                                                      .length;
                                              print(
                                                  'numberDimension:${_numberDimension}');
                                              if (_numberDimension == 1) {
                                                _numberDimension1 = 0;
                                                _numberDimension2 = 0;
                                                _numberDimension3 = 0;
                                                _numberDimension4 = 0;
                                                _numberDimension5 = 0;
                                              } else if (_numberDimension ==
                                                  2) {
                                                _numberDimension1 = 0;
                                                _numberDimension2 = 1;
                                                _numberDimension3 = 1;
                                                _numberDimension4 = 1;
                                                _numberDimension5 = 1;
                                              } else if (_numberDimension ==
                                                  3) {
                                                _numberDimension1 = 0;
                                                _numberDimension2 = 1;
                                                _numberDimension3 = 2;
                                                _numberDimension4 = 2;
                                                _numberDimension5 = 2;
                                              } else if (_numberDimension ==
                                                  4) {
                                                _numberDimension1 = 0;
                                                _numberDimension2 = 1;
                                                _numberDimension3 = 2;
                                                _numberDimension4 = 3;
                                                _numberDimension5 = 3;
                                              } else if (_numberDimension ==
                                                  5) {
                                                _numberDimension1 = 0;
                                                _numberDimension2 = 1;
                                                _numberDimension3 = 2;
                                                _numberDimension4 = 3;
                                                _numberDimension5 = 4;
                                              }
                                              Global.qcReport.standardId =
                                                  _standard[Global.i].id;
                                            }
                                          }
                                        });
                                      },
                                      favoriteItemsAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                    decoration:
                                        BoxDecoration(border: Border.all())),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.0265,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: SizeConfig.screenheight * 0.0664,
                                  width: SizeConfig.screenWidth * 0.1562,
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * 0.0078,
                                      top: SizeConfig.screenheight * 0.0132),
                                  child: TextAnnotation(
                                    text: 'Tên Sản Phẩm:',
                                  ),
                                ),
                                ContainerText(_standard[Global.i]
                                    .product!
                                    .name
                                    .toString()),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.0265,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: SizeConfig.screenheight * 0.0664,
                                  width: SizeConfig.screenWidth * 0.1562,
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * 0.0078,
                                      top: SizeConfig.screenheight * 0.0132),
                                  child: TextAnnotation(
                                    text: 'Mã Tiêu Chuẩn:',
                                  ),
                                ),
                                ContainerText(
                                    _standard[Global.i].id.toString()),
                              ],
                            ),
                            SizedBox(
                                height: SizeConfig.screenheight * 0.093,
                              ),
                            Row(
                              children: [
                                Container(
                                    width: SizeConfig.screenWidth * 0.39,
                                    height: SizeConfig.screenheight * 0.0664,
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.screenWidth * 0.1062),
                                    child: Text(
                                      'KÍCH THƯỚC',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.0398,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: SizeConfig.screenWidth * 0.0881,
                                ),
                                Text(
                                  'Chuẩn',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 0.1071,
                                ),
                                Text(
                                  'Kết Quả Đo',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.0265,
                            ),
                            Column(children: [
                              Visibility(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextAnnotation(
                                            text:
                                                ('${_standard[Global.i].dimensions![_numberDimension1].name.toString()}:')), // lay dư lieu "name" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0078,
                                        ),
                                        // ignore: unnecessary_string_interpolations
                                        ContainerTextDimenion(
                                            '${_standard[Global.i].dimensions![_numberDimension1].lowerBound.toString()} - ${_standard[Global.i].dimensions![_numberDimension1].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0156,
                                        ),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          // height: 50.0,
                                          width:
                                              SizeConfig.screenWidth * 0.2734,
                                          child: TextFieldDimesion(
                                              _standard[Global.i].dimensions![
                                                  _numberDimension1],
                                              checkingDate,
                                              checkingTime),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                visible: (_numberDimension1 == 0),
                              ),

                              // tieu chuan 2
                              SizedBox(
                                height: SizeConfig.screenheight * 0.0265,
                              ),
                              Visibility(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextAnnotation(
                                            text:
                                                //_standard[Global.i].product!.name.toString()
                                                ('${_standard[Global.i].dimensions![_numberDimension2].name.toString()}:')), // lay dư lieu "name" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0078,
                                        ),
                                        ContainerTextDimenion(
                                            '${_standard[Global.i].dimensions![_numberDimension2].lowerBound.toString()} - ${_standard[Global.i].dimensions![_numberDimension2].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0156,
                                        ),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          width:
                                              SizeConfig.screenWidth * 0.2734,
                                          child: TextFieldDimesion(
                                              _standard[Global.i].dimensions![
                                                  _numberDimension2],
                                              checkingDate,
                                              checkingTime),
                                        ),
                                      ],
                                    ),
                                    // add them widget inputtextfield cho tieu chuan 2
                                  ],
                                ),
                                visible: (_numberDimension2 == 1),
                              ),
                              SizedBox(
                                  height: SizeConfig.screenheight * 0.0265),

                              // tieu chuan 3
                              Visibility(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextAnnotation(
                                            text:
                                                // _standard[Global.i].product!.name.toString()
                                                ('${_standard[Global.i].dimensions![_numberDimension3].name.toString()}:')), // lay dư lieu "name" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0078,
                                        ),
                                        ContainerTextDimenion(
                                            '${_standard[Global.i].dimensions![_numberDimension3].lowerBound.toString()} - ${_standard[Global.i].dimensions![_numberDimension3].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0156,
                                        ),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          width:
                                              SizeConfig.screenWidth * 0.2734,
                                          child: TextFieldDimesion(
                                              _standard[Global.i].dimensions![
                                                  _numberDimension3],
                                              checkingDate,
                                              checkingTime),
                                        ),
                                      ],
                                    ),
                                    // add widget inputtextfield cho tieu chuan 2
                                  ],
                                ),
                                visible: (_numberDimension3 == 2),
                              ),
                              SizedBox(
                                height: SizeConfig.screenheight * 0.0265,
                              ),

                              // tieu chuan 4
                              Visibility(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextAnnotation(
                                            text:
                                                ('${_standard[Global.i].dimensions![_numberDimension4].name.toString()}:')), // lay dư lieu "name" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0078,
                                        ),
                                        ContainerTextDimenion(
                                            '${_standard[Global.i].dimensions![_numberDimension4].lowerBound.toString()} - ${_standard[Global.i].dimensions![_numberDimension4].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0156,
                                        ),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          width:
                                              SizeConfig.screenWidth * 0.2734,
                                          child: TextFieldDimesion(
                                              _standard[Global.i].dimensions![
                                                  _numberDimension4],
                                              checkingDate,
                                              checkingTime),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                visible: (_numberDimension4 == 3),
                              ),
                              SizedBox(
                                height: SizeConfig.screenheight * 0.0265,
                              ),

                              // tieu chuan 5
                              Visibility(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextAnnotation(
                                            text:
                                                ('${_standard[Global.i].dimensions![_numberDimension5].name.toString()}:')), // lay dư lieu "name" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0078,
                                        ),
                                        ContainerTextDimenion(
                                            '${_standard[Global.i].dimensions![_numberDimension5].lowerBound.toString()} - ${_standard[Global.i].dimensions![_numberDimension5].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                        SizedBox(
                                          width:
                                              SizeConfig.screenWidth * 0.0156,
                                        ),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          width:
                                              SizeConfig.screenWidth * 0.2734,
                                          child: TextFieldDimesion(
                                              _standard[Global.i].dimensions![
                                                  _numberDimension5],
                                              checkingDate,
                                              checkingTime),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                visible: (_numberDimension5 == 4),
                              ),
                            ]),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.0265,
                            ),
                            Row(
                              children: [
                                Container(
                                    width: SizeConfig.screenWidth * 0.3906,
                                    height: SizeConfig.screenheight * 0.0664,
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.screenWidth * 0.1062),
                                    child: Text(
                                      'NGOẠI QUAN',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.0265,
                            ),
                            RadioMethod(_standard),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.2698,
                            ),
                            Container(
                              height: SizeConfig.screenheight * 0.2260,
                              padding: EdgeInsets.only(
                                  bottom: SizeConfig.screenheight * 0.1329,
                                  left: SizeConfig.screenWidth * 0.3515),
                              child: SizedBox(
                                width: SizeConfig.screenWidth * 0.662,
                                height: SizeConfig.screenheight * 0.1063,
                                child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<ReportBloc>(context).add(
                                        ReportCheckingDataEvent(
                                            Global.qcReport));
                                    if (Global
                                        .qcReport.appearanceErrors!.isEmpty) {
                                      Global.qcReport.appearanceErrors
                                          ?.add(AppearanceError(''));
                                    }
                                  },
                                  child: const Text(
                                    'XÁC NHẬN',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff001D37),
                                      ),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                                ),
                              ),
                            ),
                            //row2
                          ],
                        )),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.019,
                    ),
                    Column(
                      //height
                      //width
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          width: SizeConfig.screenWidth * 0.4,
                          margin: EdgeInsets.only(
                              right: SizeConfig.screenWidth * 0.003),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: SizeConfig.screenheight * 0.093,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: SizeConfig.screenheight * 0.0664,
                                      width: SizeConfig.screenWidth * 0.1462,
                                      padding: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.0078,
                                          top:
                                              SizeConfig.screenheight * 0.0132),
                                      child: TextAnnotation(text: 'Mã Khuôn:')),
                                  AutocompleteTextfieldMold(molId)
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.screenheight * 0.0265,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: SizeConfig.screenheight * 0.0664,
                                      width: SizeConfig.screenWidth * 0.1562,
                                      padding: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.0078,
                                          top:
                                              SizeConfig.screenheight * 0.0132),
                                      child:
                                          TextAnnotation(text: 'Ngày Kiểm:')),
                                  ContainerCheckDate(),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.screenheight * 0.0265,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: SizeConfig.screenheight * 0.0664,
                                      width: SizeConfig.screenWidth * 0.1562,
                                      padding: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.0078,
                                          top:
                                              SizeConfig.screenheight * 0.0132),
                                      child: TextAnnotation(
                                          text: 'Thời Gian Kiểm:')),
                                  ContainerText(
                                    DateFormat('HH:mm:ss')
                                        .format(DateTime.now()),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.screenheight * 0.0265,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: SizeConfig.screenheight * 0.0664,
                                      width: SizeConfig.screenWidth * 0.1562,
                                      padding: EdgeInsets.only(
                                          left: SizeConfig.screenWidth * 0.0078,
                                          top:
                                              SizeConfig.screenheight * 0.0132),
                                      child: TextAnnotation(
                                          text: 'Số Lượng Kiểm:')),
                                  InputTextFieldNumberProduct(_batchQuantity),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.screenheight * 0.093,
                              ),
                              TopicText(text: 'TIÊU CHUẨN NGOẠI QUAN'),
                              SizedBox(
                                height: SizeConfig.screenheight * 0.0398,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                    height: SizeConfig.screenheight * 0.6648,
                                    width: SizeConfig.screenWidth * 0.3125,
                                    // ignore: unnecessary_string_interpolations
                                    child: FutureBuilder<Uint8List>(
                                      future: fetchQaDataService
                                          .fetchPdfContent(_standard, pdfView),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          // return PdfPreview(
                                          //   allowPrinting: false,
                                          //   allowSharing: false,
                                          //   canChangePageFormat: false,
                                          //   initialPageFormat:
                                          //       const PdfPageFormat(100 * PdfPageFormat.mm, 120 * PdfPageFormat.mm),
                                          //   build: (format) {
                                          //     print(snapshot.data!.lengthInBytes);
                                          //     return snapshot.data!;
                                          //   },
                                          // );
                                          return SfPdfViewer.memory(
                                            snapshot.data!,
                                            scrollDirection:
                                                PdfScrollDirection.vertical,
                                            canShowScrollHead: true,
                                          );
                                        }
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ])
                ]);
              } else {
                // LoadingDialog(context).show();
                return
                Container(
                  margin: EdgeInsets.all(150),
                  child: Center(
                    child: Container(
                      width: 600,
                      height: 400,
                      color: Constants.mainColor,
                      child: Dialog(
                                    insetAnimationDuration: Duration(seconds: 15),
                                    child: Column(children: [
                                      Icon(Icons.touch_app_outlined ,size: 150, color: Constants.mainColor,),
                                      SizedBox(height: SizeConfig.screenheight*0.05,),
                                      Row(
                                        children: [
                                          SizedBox(width: 20,),
                                          Text('Đăng nhập thành công',style: TextStyle(color: Constants.mainColor,fontSize: 40,fontWeight: FontWeight.bold),),
                                          SizedBox(width: 10,),
                                          Icon(Icons.library_add_check_outlined, size: 50,color: Constants.mainColor,)
                                        ],
                                      ),
                        
                                    ],),),
                    ),
                  ),
                );
                //  Center(
                //     child: Container(
                //   margin: EdgeInsets.all(350),
                //   child: Column(
                //     children: [

                //       CircularProgressIndicator(
                //         strokeWidth: 5,
                //       ),
                //     ],
                //   ),
                // ));
              }
            })));
  }
}
