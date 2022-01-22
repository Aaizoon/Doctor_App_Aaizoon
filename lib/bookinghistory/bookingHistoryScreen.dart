import 'package:aazioondoctorapp/Constant.dart';
import 'package:aazioondoctorapp/bookinghistory/repository/bookingHistoryRepository.dart';
import 'package:aazioondoctorapp/document/NewMyrecord.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model/bookingHistoryResponseModel.dart';

class BookingHistory extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BookingHistory> {
  BookingHistoryRepository _bookingHistoryRepository;
  Future<BookingHistoryResponseModel> history;
  List<String> patientImagePath = [
    "assets/images/profile.png",
    "assets/images/profile.png",
    "assets/images/profile.png",
    "assets/images/profile.png",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("History",style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder<BookingHistoryResponseModel>(
          future: history,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                //itemCount: snapshot.data.appointmentList.data.length,
                itemCount: snapshot.data.appointmentList.data.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                snapshot.data.appointmentList.data[index].profilePic != null
                                    ? CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(imageBaseUrl + snapshot.data.appointmentList.data[index].profilePic),
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
                                        "${snapshot.data.appointmentList.data[index].bookingFullName}" ?? "",
                                        style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "Date: ${snapshot.data.appointmentList.data[index].apptmtDate}" ?? "",
                                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
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
                                                snapshot.data.appointmentList.data[index].healthIssue ?? "",
                                                style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
                                              ),
                                            ],
                                          )),
                                      Row(
                                        children: [
                                          snapshot.data.appointmentList.data[index].gender == "f" ? Text("Female") : Text("Male"),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text("${snapshot.data.appointmentList.data[index].age ?? ""} Years"),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                        child: Text(
                                          snapshot.data.appointmentList.data[index].bookingMobile ?? "",
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
                                      launch(('tel:${(snapshot.data.appointmentList.data[index].bookingMobile ?? "")}'));
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NewMyrecord()),
                              );
                            },
                            child: Container(
                                color: Colors.cyan,
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                    child: Text(
                                      "Info",
                                      style: TextStyle(color: Colors.white),
                                    ))),
                          )
                        ],
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
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    _bookingHistoryRepository= BookingHistoryRepository();
    history=_bookingHistoryRepository.history();
  }
}
