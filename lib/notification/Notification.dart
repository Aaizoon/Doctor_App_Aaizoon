import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends StatefulWidget {
  final data;
  final notifi;
  final noti_num;
  NotificationPage({this.data, this.notifi, this.noti_num});

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<NotificationPage> {
  int n1;
  Color mainColor = Color(0xff48cde4);
  SharedPreferences prefs;
  Future<void> crtsheardprf() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    crtsheardprf();
    n1 = widget.data.length;

    Future.delayed(Duration(seconds: 5), () {
      print("notification");
      prefs.setString('noti_num', widget.data.length.toString());
      print(prefs.getString("noti_num"));
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: const Color(0xFF48cde4),
      title: Text(
        "Notification",
        style: TextStyle(color: Colors.white),
      ),
      /*actions: <Widget>[
        // action button
        IconButton(
          icon: Image.asset("assets/logos/user_profile.png"),
          onPressed: () {
            _profileClicked();
          },
        ),
      ],*/
    );
    return Scaffold(
      appBar: appBar,
      body: new Center(
        child: new Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.data.length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // GetDoctorListModel doctorlist = snapshot.data.data[index] as GetDoctorListModel ;
                      return Card(
                        elevation: 5,
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            //   height: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: n1-- > widget.noti_num
                                      ? Text(
                                          widget.data[index].message,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )
                                      : Text(widget.data[index].message),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: n1-- > widget.noti_num
                                      ? Text(
                                          widget.data[index].sentAt,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        )
                                      : Text(widget.data[index].sentAt),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
