import 'package:aazioondoctorapp/ReceptionistManagement/ReceptionistManagementScreen.dart';
import 'package:aazioondoctorapp/bookinghistory/bookingHistoryScreen.dart';
import 'package:aazioondoctorapp/doctornote/doctornotewriting.dart';
import 'package:aazioondoctorapp/incomehistory/getIncome.dart';
import 'package:aazioondoctorapp/leaveManagement/leaveManagementScreen.dart';
import 'package:aazioondoctorapp/main.dart';
import 'package:aazioondoctorapp/notification/Notification.dart';
import 'package:aazioondoctorapp/notification/NotificationResponseModel.dart';
import 'package:aazioondoctorapp/notification/NotoficationRepusitory.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/onlineBookingPatientList.dart';
import 'package:aazioondoctorapp/profile/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AllPtientList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationRepository _notificationRepository;

  @override
  void initState() {
    super.initState();
    crtsheardprf();
    _notificationRepository = NotificationRepository();
    noti = _notificationRepository.notification();
  }

  Future<NotificationResponseModel> noti;
  var notifi;
  SharedPreferences prefs;
  Future<void> crtsheardprf() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {
                print(prefs.getString("noti_num"));
              },
            ),
            FutureBuilder<NotificationResponseModel>(
              future: noti,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int noti_num = int.parse(prefs.getString("noti_num"));
                  if (snapshot.data.notifications != null) {
                    int notifi = snapshot.data.notifications.length;
                    prefs.setInt('notifi', notifi);
                    if (notifi > noti_num) {
                      return IconButton(
                        icon: Icon(
                          Icons.notifications_active,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NotificationPage(data: snapshot.data.notifications, notifi: notifi, noti_num: noti_num)));
                        },
                      );
                    } else {
                      return IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NotificationPage(data: snapshot.data.notifications, notifi: notifi, noti_num: noti_num)));
                        },
                      );
                    }
                  } else {
                    prefs.setInt('notif', 0);
                    return Container(
                      child: Center(
                          child: Icon(
                        Icons.notifications,
                        color: Colors.grey,
                      )),
                    );
                  }
                } else if (snapshot.hasError) {
                  //print(snapshot.error.toString());
                  return Container(
                    child: Center(
                        child: Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    )),
                  );
                } else {
                  return Center(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 2,
                    ),
                  );
                }
              },
            ),
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: InkWell(
                    onTap: () {
                      Share.share(' Hi, I am using this Aaizoon app, You can also download the app from https://play.google.com/store/apps/details?id=com.aaizoon.doctor');
                    },
                    child: Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Share With Doctors",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: InkWell(
                    onTap: () {
                      Share.share(' Hi, You can book an appointment of mine at Aaizoon, You can also download the app from https://play.google.com/store/apps/details?id=com.aaizoon.patient');
                    },
                    child: Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Share With Patient",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => doctornotewriting()));
                    },
                    child: Text(
                      "Write Blog",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
                PopupMenuItem(
                  value: 5,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                      child: Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Profile",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      )),
                ),
                PopupMenuItem(
                  value: 6,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LeaveManagementScreen()));
                      },
                      child: Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Leave Management",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      )),
                ),
                PopupMenuItem(
                  value: 7,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingHistory()));
                      },
                      child: Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "History",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      )),
                ),
                PopupMenuItem(
                  value: 8,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GetIncome()));
                      },
                      child: Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Earnings",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                      )),
                ),
                PopupMenuItem(
                  value: 9,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReceptionistManagementScreen()));
                    },
                    child: Text(
                      "",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 10,
                  child: InkWell(
                    onTap: () async {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      await preferences.clear();
                      Navigator.pop(context);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MyApp()));
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            )
          ],
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'In Clinic Appointments'),
              Tab(
                text: 'Online Appointments',
              ),
            ],
          ),
          leading: Container(),
          title: Text(
            'AAIZOON',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
        body: TabBarView(
          children: [
            AllPtientList(),
            OnlineBookingPatientList(),
          ],
        ),
      ),
    );
  }
}
