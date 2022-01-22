import 'dart:core';
import 'package:aazioondoctorapp/bookingconfirm/bloc/BookingConfirmBloc.dart';
import 'package:aazioondoctorapp/bookingconfirm/model/BookingConfirmModel.dart';
import 'package:aazioondoctorapp/chat/screens/chat.dart';
import 'package:aazioondoctorapp/document/NewMyrecord.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/appointmentClosingPage.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/repository/bookingCompletedRepository.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/todo.dart';
import 'package:aazioondoctorapp/patientlist/model/PatientListModel.dart';
import 'package:aazioondoctorapp/patientlist/repusitory/PatientListRepository.dart';
import 'package:aazioondoctorapp/videochat/callPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constant.dart';
import 'HomeScreen.dart';

class AllPtientList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<AllPtientList> {
  final PermissionHandler _permissionHandler = PermissionHandler();
  PatientListRepository _patientListReposutory;
  BookingCompletedRepository _bookingCompletedRepository;
  BookingConfirmBloc _bookingConfirmBloc;
  DateTime _dateTime = DateTime.now();
  int selected;
  String selectDate, selectDay, shift;
  var arr;
  bool firstTime = false;
  bool chee = false;
  bool tic1 = false;
  bool tic2 = false;
  bool tic3 = false;
  bool tic4 = false;
  bool tic5 = false;
  bool tic6 = false;
  bool tic7 = false;
  var ti = "9-10 AM";
  var apttimehr;
  var apttimemin;
  var apttimesec;
  var appoinment;

  var datecheck = [];
  var detailsofp = [];
  Future<PatientListModel> filterdata;
  PatientListModel dataSet, dataSetOriginal;

  @override
  void initState() {
    super.initState();
    _patientListReposutory = PatientListRepository();
    _bookingConfirmBloc = BookingConfirmBloc();
    filterdata = _patientListReposutory.patient();
    _bookingCompletedRepository = BookingCompletedRepository();
  }

  Color mainColor = Color(0xff48cde4);
  List<String> patientname = ["Raj Patel", "Sagar Shah ", "Kishore Modha", "Rahul Sardar"];
  List<String> patientImagePath = [
    "assets/images/profile.png",
    "assets/images/profile.png",
    "assets/images/profile.png",
    "assets/images/profile.png",
  ];
  List<String> agePatient = [
    "Male,24 Years",
    "Male,28 Years",
    "Male,32 Years",
    "Male,35 Years",
  ];
  List<String> patientAge = [
    "+919831098310",
    "+919831098310",
    "+919831098310",
    "+98730098300",
  ];
  List<String> healthproblem = [
    "Skin Problem,Hairfall",
    "Skin Problem,Hairfall",
    "Skin Problem,Hairfall",
    "Skin Problem,Hairfall",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Colors.black12,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, position) {
                      if (!firstTime) funDateCalculation(position);
                      int day = DateTime.now().day + position;
                      return GestureDetector(
                          child: FittedBox(
                              child: Container(
                                  height: 90,
                                  width: 90,
                                  margin: EdgeInsets.only(right: 15.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: new Border.all(
                                        width: 3,
                                          color: selected == null
                                              ? Colors.transparent
                                              : selected == day
                                                  ? selected == DateTime.now().day
                                                      ? Colors.transparent
                                                      : Colors.cyan.shade700
                                                  : Colors.transparent),
                                      color: day == DateTime.now().day ? Colors.cyan : Colors.cyan.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                    Text(DateTime.now().add(Duration(days: position)).day.toString(),
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: day == DateTime.now().day ? FontWeight.bold : FontWeight.normal,
                                          color: day == DateTime.now().day ? Colors.white : Colors.grey[500],
                                        )),
                                    Text(
                                      DateFormat('EE').format(DateTime.now().add(Duration(days: position))),
                                      style: TextStyle(color: day == DateTime.now().day ? Colors.white : Colors.grey[700], fontWeight: day == DateTime.now().day ? FontWeight.bold : FontWeight.normal),
                                    )
                                  ]))),
                          onTap: () {
                            setState(() {
                              selectDate = DateTime.now().add(Duration(days: position)).day.toString();
                              arr = DateTime.now().add(Duration(days: position)).toString().split(" ");
                              selectDate = arr[0];
                              selectDay = DateFormat('EE').format(DateTime.now().add(Duration(days: position)));

                              selected = DateTime.now().day + position;
                              print('Tag' + selected.toString());
                              funFilter(position);
                            });
                          });
                    })),
            /////////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: FutureBuilder<PatientListModel>(
                  future: filterdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (!firstTime) funCreateDataSet(snapshot.data);
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        //itemCount: snapshot.data.appointmentList.data.length,
                        itemCount: dataSet.appointmentList.data.length,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                              child: InkWell(
                                onTap: (){
                                  patientPicture=dataSet.appointmentList.data[index].profilePic;
                                  patientGender=dataSet.appointmentList.data[index].gender.toString();
                                  patientName =dataSet.appointmentList.data[index].bookingFullName.toString();
                                  patientEmail = dataSet.appointmentList.data[index].bookingEmail.toString();
                                  patientMobileNumber =dataSet.appointmentList.data[index].bookingMobile.toString();
                                  patientId=dataSet.appointmentList.data[index].userId.toString();
                                  doctorId=dataSet.appointmentList.data[index].doctorId.toString();
                                  bookingId=dataSet.appointmentList.data[index].apptId.toString();
                                  appointmentMode="offline";
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AppointmentClosingPage(isEnd:"0")));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          dataSet.appointmentList.data[index].profilePic != null
                                              ? CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: NetworkImage(imageBaseUrl + dataSet.appointmentList.data[index].profilePic),
                                                )
                                              : ClipOval(
                                                  child: Image.asset(
                                                    patientImagePath[0],
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                new Text(
                                                  "${dataSet.appointmentList.data[index].bookingFullName}" ?? "",
                                                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                        child: new Text(
                                                          "Appointment Time:" + DateFormat.jm().format(DateFormat("HH:mm:ss").parse(dataSet.appointmentList.data[index].apptmtTime)) ?? "",
                                                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                      0,
                                                      5,
                                                      0,
                                                      5,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text("Health Issue: "),
                                                        new Text(
                                                          dataSet.appointmentList.data[index].healthIssue ?? "",
                                                          style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
                                                        ),
                                                      ],
                                                    )),
                                                Row(
                                                  children: [
                                                    dataSet.appointmentList.data[index].gender == "f" ? Text("Female") : Text("Male"),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8.0),
                                                      child: Text("${dataSet.appointmentList.data[index].age ?? ""} Years"),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                                  child: Text(
                                                    dataSet.appointmentList.data[index].bookingMobile ?? "",
                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(top: 20),
                                            child: IconButton(
                                              icon: Icon(Icons.add_call),
                                              onPressed: () {
                                                launch(('tel:${(dataSet.appointmentList.data[index].bookingMobile ?? "")}'));
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left:10,right: 10,bottom: 10),
                                      child: Text("Tap To Provide Findings"),)
                                  ],
                                ),
                              ));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Center(
                              child: Text(
                            "No Data Found",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          )),
                        ),
                      );
                    } else {
                      return Center(
                        heightFactor: 5,
                        widthFactor: 10,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.cyan,
                          strokeWidth: 5,
                        ),
                      );
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> onJoin() async {
    await _permissionHandler.requestPermissions([PermissionGroup.camera, PermissionGroup.microphone]);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(channelName: "Aaizoon"),
        ));
    print(appID);
  }

  funDateCalculation(int position) {
    print("date");
    //datecheck.clear();
    datecheck.add(DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: position))));

    print(datecheck);
    /* print(DateFormat('yyyy-MM-dd').format(
        DateTime.now().add(
            Duration(days: position))));
*/ /*  print(DateTime.now()
       .add(Duration(days: position))
       .day
       .toString());*/
  }

  void funFilter(int position) {
    //dataSet.appointmentList.data.clear();
    print("original");
    print(dataSetOriginal.appointmentList.data.length);
    print("delete");
    dataSet.appointmentList.data.clear();

    print(dataSetOriginal.appointmentList.data.length);
    for (int i = 0; i < dataSetOriginal.appointmentList.data.length; i++) {
      print("stat " + dataSetOriginal.appointmentList.data[i].apptmtDate);
      print("kkkk " + datecheck[position]);
      if (dataSetOriginal.appointmentList.data[i].apptmtDate.toString().split(" ")[0] == datecheck[position]) {
        dataSet.appointmentList.data.add(dataSetOriginal.appointmentList.data[i]);
        print("match found");
      }
    }
    setState(() {});
  }

  void funCreateDataSet(PatientListModel data) {
    firstTime = true;
    dataSet = new PatientListModel.fromJson(data.toJson());
    dataSetOriginal = new PatientListModel.fromJson(data.toJson());
    dataSet.appointmentList.data.clear();
    for (int i = 0; i < dataSetOriginal.appointmentList.data.length; i++) {
      print("stat");
      print(dataSetOriginal.appointmentList.data[i].apptmtDate);
      print(datecheck[0]);
      if (dataSetOriginal.appointmentList.data[i].apptmtDate.toString().split(" ")[0] == datecheck[0]) {
        dataSet.appointmentList.data.add(dataSetOriginal.appointmentList.data[i]);
        print("match found");
      }
    }

    //funFilter(0);
  }
}

Widget SnackFunction1(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('Booking Confirmed'),
  ));
}

class Loading1 extends StatelessWidget {
  final String loadingMessage;

  const Loading1({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
            ),
          ],
        ),
      ),
    );
  }
}
