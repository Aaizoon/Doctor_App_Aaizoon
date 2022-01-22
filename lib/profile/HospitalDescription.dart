import 'dart:convert';
import 'dart:core';

import 'package:aazioondoctorapp/help/api_response.dart';

import 'package:aazioondoctorapp/home/HomeScreen.dart';
import 'package:aazioondoctorapp/profile/Data/ProfileData1.dart';
import 'package:aazioondoctorapp/profile/Data/ProfileData2.dart';
import 'package:aazioondoctorapp/profile/bloc/DoctorProfileBloc.dart';
import 'package:aazioondoctorapp/profile/model/DoctorProfileModel.dart';
import 'package:aazioondoctorapp/utility/Error.dart';
import 'package:aazioondoctorapp/utility/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Data/ProfileData2.dart';
import 'ProfilePage.dart';
import 'model/DocProfileModel.dart';

class HospitalDescription extends StatefulWidget {
  Profile1 dataFirst;

  // Profile2 dataSecond;
  List<Profile2> dataSecond = [];
  DocProfileModel globalProfileApiModeldata;

  HospitalDescription({this.dataFirst, this.dataSecond, this.globalProfileApiModeldata});

  @override
  _HospitalDescriptionState createState() => _HospitalDescriptionState();
}

class _HospitalDescriptionState extends State<HospitalDescription> {
  bool isCheckedBed = false;
  String _isCheckedBedString = "y";
  bool isCheckedVentilator = false;
  String _isCheckedVentilatorString = "n";
  bool isCheckedemergency = false;
  String _isCheckedemergencyString = "n";
  /*_isChecked4bool _isChecked4 = false;
  String _isCheckedBedString = "n";*/
  bool isCheckedBloodbank = false;
  String _isCheckedBloodbankString = "n";
  bool isCheckedambulance = false;
  String _isCheckedambulanceString = "n";
  final ambulancenumberController = TextEditingController();
  DoctorProfileBloc doctorprofileBloc;

  @override
  void initState() {
    super.initState();
    doctorprofileBloc = DoctorProfileBloc();
    if (widget.globalProfileApiModeldata != null) {
//  bool _isCheckedBed = false;
      /*String _isCheckedBedString = "n";
  bool _isCheckedVentilator = false;
  String _isCheckedVentilatorString = "n";
  bool _isCheckedemergency = false;
  String _isCheckedemergencyString = "n";
  */ /*_isChecked4bool _isChecked4 = false;
  String _isCheckedBedString = "n";*/ /*
  bool _isCheckedBloodbank = false;
  String _isCheckedBloodbankString = "n";
  bool _isCheckedambulance = false;
  String _isCheckedambulanceString = "n";
  final ambulancenumberController = TextEditingController();*/
      String bedVal = widget.globalProfileApiModeldata.data.profileDetail[0].bed;
      isCheckedBed = bedVal == 'y' ? true : false;
      String ventilatorVal = widget.globalProfileApiModeldata.data.profileDetail[0].ventilator;
      isCheckedVentilator = ventilatorVal == 'y' ? true : false;
      String emergencyVal = widget.globalProfileApiModeldata.data.profileDetail[0].emergency;
      isCheckedemergency = emergencyVal == 'y' ? true : false;
      String bloodBankVal = widget.globalProfileApiModeldata.data.profileDetail[0].bloodBank;
      isCheckedBloodbank = bloodBankVal == 'y' ? true : false;
      String ambulanceVal = widget.globalProfileApiModeldata.data.profileDetail[0].ambulance;
      isCheckedambulance = bloodBankVal == 'y' ? true : false;
      ambulancenumberController.text = widget.globalProfileApiModeldata.data.profileDetail[0].ambulanceContact;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Profile Settings"),
      ),
      body: Container(
        height: 830,
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                "Hospital Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            CheckboxListTile(
              title: Text("Bed Availability"),
              controlAffinity: ListTileControlAffinity.platform,
              value: isCheckedBed,
              selected: isCheckedBed,
              activeColor: Colors.cyan,
              onChanged: (value) {
                setState(() {
                  isCheckedBed = !isCheckedBed;
                  print(isCheckedBed);
                  if (isCheckedBed)
                    _isCheckedBedString = "y";
                  else
                    _isCheckedBedString = "n";
                });
              },
            ),
            CheckboxListTile(
              title: Text("Ventilator Availability"),
              controlAffinity: ListTileControlAffinity.platform,
              value: isCheckedVentilator,
              activeColor: Colors.cyan,
              onChanged: (value) {
                setState(() {
                  isCheckedVentilator = !isCheckedVentilator;
                  if (isCheckedVentilator)
                    _isCheckedVentilatorString = "y";
                  else
                    _isCheckedVentilatorString = "n";
                });
              },
            ),
            CheckboxListTile(
              title: Text("Emergency Service"),
              controlAffinity: ListTileControlAffinity.platform,
              value: isCheckedemergency,
              activeColor: Colors.cyan,
              onChanged: (value) {
                setState(() {
                  isCheckedemergency = !isCheckedemergency;
                  if (isCheckedemergency)
                    _isCheckedemergencyString = "y";
                  else
                    _isCheckedemergencyString = "n";
                });
              },
            ),
            CheckboxListTile(
              title: Text("Blood Bank"),
              controlAffinity: ListTileControlAffinity.platform,
              value: isCheckedBloodbank,
              activeColor: Colors.cyan,
              onChanged: (value) {
                setState(() {
                  isCheckedBloodbank = !isCheckedBloodbank;
                  if (isCheckedBloodbank)
                    _isCheckedBloodbankString = "y";
                  else
                    _isCheckedBloodbankString = "n";
                });
              },
            ),
            CheckboxListTile(
              title: Text("Ambulance Service"),
              controlAffinity: ListTileControlAffinity.platform,
              value: isCheckedambulance,
              activeColor: Colors.cyan,
              onChanged: (value) {
                setState(() {
                  isCheckedambulance = !isCheckedambulance;
                  if (isCheckedambulance)
                    _isCheckedambulanceString = "y";
                  else
                    _isCheckedambulanceString = "n";
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: ambulancenumberController,
                cursorColor: Colors.cyan,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Ambulance Contact Number',
                  hintStyle: TextStyle(color: Colors.grey.shade100),
//
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  //fillColor: Colors.green
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 140, right: 10, bottom: 10),
              child: InkWell(
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String token = prefs.getString("token");

                    Map body = {
                      "email": widget.dataFirst.email,
                      "doctor_fee": widget.dataFirst.fees,
                      "date_of_birth": widget.dataFirst.date,
                      "address": widget.dataFirst.address,
                      "qualification": widget.dataFirst.qualification,
                      "experience": widget.dataFirst.experience,
                      "medical_license": widget.dataFirst.licensenumber,
                      "contact": widget.dataFirst.mobilenumber,
                      "doctor_online_fee": widget.dataFirst.onlineFees
                    };
                    print(jsonEncode(body));
                    try {
                      print(token);

                      doctorprofileBloc.AddDoctor(body, "Bearer " + token);
                    } catch (e, stacktrace) {
                      print(stacktrace);
                      print(e);
                    }
                  },
                  child: StreamBuilder<ApiResponse<DoctorProfileModel>>(
                      stream: doctorprofileBloc.doctorprofileStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          switch (snapshot.data.status) {
                            case Status.LOADING:
                              return Loading(
                                loadingMessage: snapshot.data.message,
                              );
                              break;
                            case Status.COMPLETED:
                              Future.delayed(Duration.zero, () async {
                                Fluttertoast.showToast(
                                    msg: "Successfully profile updated",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.cyan,
                                    textColor: Colors.white,
                                    timeInSecForIosWeb: 2);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()),
                                );
                                SnackFunction(context);
                              });
                              break;
                            case Status.ERROR:
                              /*return Error(
                                errorMessage: snapshot.data.message,
                              );*/
                              Future.delayed(Duration.zero, () async {
                                Fluttertoast.showToast(
                                    msg: "Profile Update Failed",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.cyan,
                                    textColor: Colors.white,
                                    timeInSecForIosWeb: 2);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfilePage()),
                                );
                              });
                              break;
                          }
                        }
                        return Container(
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.all(Radius.circular(25))),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

Widget SnackFunction(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('Successfully profile updated!'),
  ));
}
