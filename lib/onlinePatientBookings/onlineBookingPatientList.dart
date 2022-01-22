import 'dart:async';
import 'package:aazioondoctorapp/chat/screens/chat.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/bloc/availabilityBloc.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/repository/onlinePatientBookingRepository.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant.dart';
import 'model/availabilityModel.dart';
import 'model/onlinePatientBookingModel.dart';

class OnlineBookingPatientList extends StatefulWidget {
  @override
  _OnlineBookingPatientListState createState() => _OnlineBookingPatientListState();
}

class _OnlineBookingPatientListState extends State<OnlineBookingPatientList> {
  bool isOnline = false;
  SharedPreferences prefs;
  String token = "";
  int userId;
  OnlinePatientBookingRepository _onlinePatientBookingRepository;
  Future<OnlinePatientBookingModel> _onlinePatientFuture;
  Timer timer;
  AvailabilityBloc _availabilityBloc;
  bool oneTime = false;
  bool isOnline1 = false;

  Future<void> createShrPrf() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    userId = prefs.getInt('user_id');
    isOnline1 = prefs.getBool('isOnline1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                    child: isOnline == false
                        ? Text(
                            "Go Online",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : Text("Go Offline", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                IconButton(
                    onPressed: () async {
                      oneTime = false;
                      if (isOnline == false) {
                        Map body = {"doctor_id": userId.toString(), "is_avl_for_online_const": "1"};
                        _availabilityBloc.availability(body, token);
                      } else {
                        prefs.setBool('isOnline1', false);
                        Map body = {"doctor_id": userId.toString(), "is_avl_for_online_const": "0"};
                        _availabilityBloc.availability(body, token);
                      }
                    },
                    icon: StreamBuilder<ApiResponse<AvailabilityModel>>(
                        stream: _availabilityBloc.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            switch (snapshot.data.status) {
                              case Status.LOADING:
                                return Container(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                                  ),
                                );

                                break;
                              case Status.COMPLETED:
                                if (oneTime != true) {
                                  print("j");
                                  oneTime = true;

                                  Future.delayed(Duration(seconds: 1), () {
                                    if (isOnline == false) {
                                      isOnline = true;
                                      prefs.setBool('isOnline1', true);
                                      setState(() {});
                                      timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
                                        _onlinePatientFuture = _onlinePatientBookingRepository.getOnlinePatient();
                                        setState(() {});
                                      });
                                    } else {
                                      isOnline = false;
                                      print(prefs.getBool('isOnline1').toString());
                                      timer.cancel();
                                      setState(() {});
                                    }
                                    Fluttertoast.showToast(
                                        msg: isOnline == true ? "You Are Online Now" : "You Went Offline",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor: Colors.cyan,
                                        textColor: Colors.white,
                                        timeInSecForIosWeb: 5);
                                  });
                                }
                                break;
                              case Status.ERROR:
                                Future.delayed(Duration.zero, () async {
                                  Fluttertoast.showToast(
                                      msg: snapshot.data.message,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      timeInSecForIosWeb: 2);
                                });
                                break;
                            }
                          }
                          return Icon(
                            Icons.power_settings_new,
                            color: isOnline == false ? Colors.grey : Colors.green,
                            size: MediaQuery.of(context).size.width * .09,
                          );
                        }))
              ],
            ),
          ),
          FutureBuilder<OnlinePatientBookingModel>(
            future: _onlinePatientFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.data.activeBooking == true) {
                  print("abd");
                  timer?.cancel();
                  patientPicture=snapshot.data.data.patientDetails[0].profilePic;
                  patientWeight=snapshot.data.data.patientDetails[0].weight;
                  patientHeight=snapshot.data.data.patientDetails[0].height;
                  patientGender=snapshot.data.data.patientDetails[0].gender;
                  patientDOB=snapshot.data.data.patientDetails[0].dateOfBirth;
                  patientName = snapshot.data.data.patientDetails[0].name;
                  patientEmail = snapshot.data.data.patientDetails[0].email;
                  patientMobileNumber = snapshot.data.data.patientDetails[0].mobileNumber;
                  channelName = snapshot.data.data.doctorDetails[0].mobileNumber;
                  doctorFirebaseId = snapshot.data.data.doctorFirebaseId;
                  patientFirebaseId = snapshot.data.data.patientFirebaseId;
                  pName = snapshot.data.data.patientDetails[0].name;
                  peerAvatar = snapshot.data.data.patientDetails[0].profilePic;
                  doctorId = snapshot.data.data.doctorDetails[0].id.toString();
                  patientId = snapshot.data.data.patientDetails[0].id.toString();
                  print(channelName);
                  bookingId=snapshot.data.data.bookingDetails.id.toString();
                  appointmentMode="online";
                  prefs.setInt('pId', snapshot.data.data.bookingDetails.id);
                  print(snapshot.data.data.bookingDetails.id.toString());
                  Future.delayed(Duration(seconds: 1), () {
                    print("abc");
                    FlutterRingtonePlayer.playRingtone();
                    // _showMaterialDialog(snapshot.data.data);
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (_) => new AlertDialog(
                              title: new Text("You Have An Appointment"),
                              content: new Container(
                                child: Text("Please Proceed"),
                              ),
                              actions: <Widget>[
                                // ignore: deprecated_member_use
                                FlatButton(
                                  child: Text('Join'),
                                  onPressed: () {
                                    FlutterRingtonePlayer.stop();
                                    timer?.cancel();
                                    print(snapshot.data.data.patientDetails[0].profilePic);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Chat(
                                                  currentUserId: snapshot.data.data.doctorFirebaseId,
                                                  peerId: snapshot.data.data.patientFirebaseId,
                                                  peerName: snapshot.data.data.patientDetails[0].name,
                                                  peerAvatar: snapshot.data.data.patientDetails[0].profilePic!=null?imageBaseUrl + snapshot.data.data.patientDetails[0].profilePic:"",
                                                  // peerAvatar: "https://lh3.googleusercontent.com/a-/AOh14GhkPR7VND0AD-081OLeDvmmNvLs14Ijl_iuky-T=s96-c",
                                                )));
                                  },
                                )
                              ],
                            ));
                    timer.cancel();
                  });
                  return Container();
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * .6,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      "You Don't Have Any Appointment Yet.",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Container();
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .7,
                  width: MediaQuery.of(context).size.width,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 3,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    createShrPrf();
    Future.delayed(Duration(seconds: 1), () {
      print("gddv" + isOnline1.toString());

      if (isOnline1) {
        isOnline = isOnline1;
        setState(() {});
      }
      ;
    });
    _onlinePatientBookingRepository = OnlinePatientBookingRepository();
    _onlinePatientFuture = _onlinePatientBookingRepository.getOnlinePatient();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
      _onlinePatientFuture = _onlinePatientBookingRepository.getOnlinePatient();
      setState(() {});
    });
    _availabilityBloc = AvailabilityBloc();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
