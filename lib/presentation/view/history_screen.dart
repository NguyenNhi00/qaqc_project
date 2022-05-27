import 'package:cha_qaqc_department_mobile_app/domain/entities/qc_data.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'global.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
            'SẢN PHẨM ĐÃ KIỂM TRA',
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(width: 2)),
              margin: EdgeInsets.all(30),
              child: Column(children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        height: 70,
                        padding: EdgeInsets.only(left: 30, top: 20),
                        color: Constants.mainColor,
                        child: Text('Mã tiêu chuẩn', style: TextStyle(color: Colors.white, fontSize: 25),),
                      ),
                      VerticalDivider(color: Colors.white,thickness: 0.05,),
                       Container(
                          width: 200,
                          height: 70,
                          color: Constants.mainColor,
                          padding: EdgeInsets.only(left: 30,top: 20),
                          child: Text('Mã máy',
                            style: TextStyle(color: Colors.white, fontSize: 25,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.white,
                          thickness: 0.05,
                        ),
                        Container(
                          width: 200,
                          height: 70,
                          padding: EdgeInsets.only(left: 30, top: 20),
                          color: Constants.mainColor,
                          child: Text('Mã Khuôn',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                       VerticalDivider(
                          color: Colors.white,
                          thickness: 0.05,
                        ),
                        Container(
                          width: 250,
                          height: 70,
                          padding: EdgeInsets.only(left: 30, top: 20),
                          color: Constants.mainColor,
                          child: Text('thời gian kiểm',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.white,
                          thickness: 0.05,
                        ),
                        Container(
                          width: 295,
                          height: 70,
                          padding: EdgeInsets.only(left: 30, top: 20),
                          color: Constants.mainColor,
                          child: Text(
                            'Số lượng kiểm',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                    ],
                  ),
                ),
                ListView.builder(
                   reverse: true,
                        shrinkWrap: true,
                        itemCount: Global.qcReportList.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 50,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(Global.qcReportList[index].standardId.toString(), style: TextStyle(fontSize: 25),)),
                            Container(
                              width: 200,
                              height: 50,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                    Global.qcReportList[index].machineId.toString(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                            ),
                            Container(
                                  width: 200,
                                  height: 50,
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    Global.qcReportList[index].moldId.toString(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                            Container(
                                  width: 250,
                                  height: 50,
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    DateFormat('HH:mm:ss')
                                            .format(DateTime.parse(
                                        Global.qcReportList[index].timestamp
                                            .toString())).toString(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                            Container(
                                  width: 260,
                                  height: 50,
                                  padding: EdgeInsets.only(left: 80),
                                  child: Text(
                                    Global.qcReportList[index].batchQuantity.toString(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                        ],),
                      ),
                    );
                  })
              ],),
            ),
            SizedBox(height: SizeConfig.screenheight * 0.14),
            SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenheight * 0.0915,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Global.processPostData = false;
                  },
                  child: Center(
                    child: Text(
                      'TRỞ LẠI',
                      style: TextStyle(fontSize: 35.0),
                    ),
                  ),
                  style: ButtonStyle(
                    shadowColor:
                        MaterialStateProperty.all<Color>(Constants.mainColor),
                    elevation: MaterialStateProperty.all(15),
                    alignment: Alignment.bottomLeft,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff001D37)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0))),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}