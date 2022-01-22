import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/leaveManagement/leaveRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/leaveBloc.dart';
import 'bloc/leaveDeleteBloc.dart';
import 'model/getLeaveListModel.dart';
import 'model/leaveDeleteModel.dart';
import 'model/leaveResponseModel.dart';

class LeaveManagementScreen extends StatefulWidget {
  @override
  _LeaveManagementScreenState createState() => _LeaveManagementScreenState();
}

class _LeaveManagementScreenState extends State<LeaveManagementScreen> {
  LeaveDeleteBloc _leaveDeleteBloc;
  bool isMTO = false;
  bool isOD = false;
  bool isOneTime = false;
  bool isOneDelete = false;
  List arrDate = [];
  int indexx;
  final dateNow = DateTime.now();
  DateTime date;
  final kLabelStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );
  final kHintTextStyle = TextStyle(
    color: Colors.black54,
    fontFamily: 'OpenSans',
  );
  LeaveBloc _leaveBloc;
  LeaveRepository _leaveRepository;
  Future<GetLeaveListModel> leaveList;

  final kBoxDecorationStyle = BoxDecoration(
    color: Color(0xFFFFFFFF),
    border: Border(
      top: BorderSide(color: Colors.grey),
      right: BorderSide(color: Colors.grey),
      left: BorderSide(color: Colors.grey),
      bottom: BorderSide(color: Colors.grey),
    ),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  DateTime selectedDateForSingle = DateTime(2021, 1, 1);
  TextEditingController _dateForSingleLeave = new TextEditingController();
  Future<Null> _selectDateForSingle(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDateForSingle, firstDate: DateTime(2021, 01, 01), lastDate: DateTime(2100, 12, 31));
    if (picked != null && picked != selectedDateForSingle)
      setState(() {
        selectedDateForSingle = picked;
        _dateForSingleLeave.value = TextEditingValue(text: picked.toString().split(' ')[0]);
      });
  }

  DateTime selectedDateFirst = DateTime(2021, 1, 1);
  TextEditingController _dateForFirst = new TextEditingController();
  Future<Null> _selectDateFirst(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDateFirst, firstDate: DateTime(2021, 01, 01), lastDate: DateTime(2100, 12, 31));
    if (picked != null && picked != selectedDateFirst)
      setState(() {
        selectedDateFirst = picked;
        _dateForFirst.value = TextEditingValue(text: picked.toString().split(' ')[0]);
      });
  }

  DateTime selectedDateForLast = DateTime(2021, 1, 1);
  TextEditingController _dateForLast = new TextEditingController();
  Future<Null> _selectDateForLast(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDateForLast, firstDate: DateTime(2021, 01, 01), lastDate: DateTime(2100, 12, 31));
    if (picked != null && picked != selectedDateForLast)
      setState(() {
        selectedDateForLast = picked;
        _dateForLast.value = TextEditingValue(text: picked.toString().split(' ')[0]);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leave Management"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .28),
                child: InkWell(
                  onTap: () {
                    isMTO = true;
                    isOD = false;
                    setState(() {});
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(50))),
                    elevation: isMTO == true ? 15 : 0,
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.zero,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * .33,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "Get Leave For More Than One Day",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    decoration: kBoxDecorationStyle,
                                    height: 60.0,
                                    child: GestureDetector(
                                        onTap: () => _selectDateFirst(context),
                                        child: AbsorbPointer(
                                            child: TextFormField(
                                          controller: _dateForFirst,
                                          keyboardType: TextInputType.datetime,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'OpenSans',
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(top: 14.0),
                                            prefixIcon: Icon(
                                              Icons.calendar_today,
                                              color: Colors.grey,
                                            ),
                                            hintText: 'From Date',
                                            hintStyle: kHintTextStyle,
                                          ),
                                        ))),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    decoration: kBoxDecorationStyle,
                                    height: 60.0,
                                    child: GestureDetector(
                                        onTap: () => _selectDateForLast(context),
                                        child: AbsorbPointer(
                                            child: TextFormField(
                                          controller: _dateForLast,
                                          keyboardType: TextInputType.datetime,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'OpenSans',
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(top: 14.0),
                                            prefixIcon: Icon(
                                              Icons.calendar_today,
                                              color: Colors.grey,
                                            ),
                                            hintText: 'Enter The Date',
                                            hintStyle: kHintTextStyle,
                                          ),
                                        ))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: RaisedButton(
                              child: Text("Submit"),
                              onPressed: () async {
                                if (_dateForLast.text != "" && _dateForFirst.text != "") {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();

                                  int userId = prefs.getInt("user_id");
                                  Map body = {"doctor_id": userId.toString(), "from_date": _dateForFirst.text, "to_date": _dateForLast.text};
                                  _leaveBloc.leave(body);
                                  print("ddd");
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  isMTO = false;
                  isOD = true;
                  setState(() {});
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(50))),
                  elevation: isOD == true ? 15 : 0,
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.zero,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * .33,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            "Get Leave For Only One Day",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.cyan),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: kBoxDecorationStyle,
                            height: 60.0,
                            child: GestureDetector(
                                onTap: () => _selectDateForSingle(context),
                                child: AbsorbPointer(
                                    child: TextFormField(
                                  controller: _dateForSingleLeave,
                                  keyboardType: TextInputType.datetime,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14.0),
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Enter The Date',
                                    hintStyle: kHintTextStyle,
                                  ),
                                ))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: RaisedButton(
                            child: Text("Submit"),
                            onPressed: () async {
                              if (_dateForSingleLeave.text != "") {
                                SharedPreferences prefs = await SharedPreferences.getInstance();

                                int userId = prefs.getInt("user_id");
                                Map body = {"doctor_id": userId.toString(), "from_date": _dateForSingleLeave.text, "to_date": _dateForSingleLeave.text};
                                _leaveBloc.leave(body);
                                print("h");
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          StreamBuilder<ApiResponse<LeaveResponseModel>>(
              stream: _leaveBloc.getStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.LOADING:
                      Future.delayed(Duration.zero, () {
                        return showAlertDialog(context);
                      });

                      break;
                    case Status.COMPLETED:
                      Future.delayed(Duration.zero, () async {
                        Fluttertoast.showToast(
                            msg: "Leave recorded successfully", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, backgroundColor: Colors.cyan, textColor: Colors.white, timeInSecForIosWeb: 5);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LeaveManagementScreen()),
                        );
                      });
                      break;
                    case Status.ERROR:
                      print(snapshot.error);
                      Future.delayed(Duration.zero, () async {
                        Fluttertoast.showToast(
                            msg: "Please Try Again After Some Time",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 2);
                      });
                      break;
                  }
                }
                return Container();
              }),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: FutureBuilder<GetLeaveListModel>(
                future: leaveList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (isOneTime == false) {
                      for (int i = 0; i < snapshot.data.data.length; i++) {
                        date = DateTime.parse(snapshot.data.data[i].leaveOn);
                        if (date.difference(dateNow).inDays > 0) {
                          print("matched");
                          arrDate.add(snapshot.data.data[i].leaveOn);
                        }
                      }
                    }
                    isOneTime = true;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: arrDate.length,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
                                    child: Text(
                                      arrDate[index].toString() ?? "",
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                    )),
                              ),
                              InkWell(
                                onTap: () async {
                                  isOneDelete = true;
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  int userId = prefs.getInt("user_id");
                                  Map body = {"doctor_id": userId.toString(), "effective_date": arrDate[index].toString()};
                                  _leaveDeleteBloc.leaveDelete(body);
                                  indexx=index;
                                },
                                child: StreamBuilder<ApiResponse<LeaveDeleteModel>>(
                                    stream: _leaveDeleteBloc.deleteStream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        switch (snapshot.data.status) {
                                          case Status.LOADING:
                                            Future.delayed(Duration.zero, () {
                                              return Container(
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                                                ),
                                              );
                                            });

                                            break;
                                          case Status.COMPLETED:
                                            Future.delayed(Duration(seconds: 1), () async {
                                              if (isOneDelete == true) {
                                                arrDate.removeAt(indexx);
                                                setState(() {});
                                                isOneDelete = false;
                                                Fluttertoast.showToast(
                                                    msg: "Leave Deleted",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.CENTER,
                                                    backgroundColor: Colors.cyan,
                                                    textColor: Colors.white,
                                                    timeInSecForIosWeb: 5);
                                              }
                                            });
                                            break;
                                          case Status.ERROR:
                                            Fluttertoast.showToast(
                                                msg: snapshot.data.message,
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                backgroundColor: Colors.cyan,
                                                textColor: Colors.white,
                                                timeInSecForIosWeb: 3);
                                            break;
                                        }
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10.0, right: 20),
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: Colors.cyan,
                                          size: MediaQuery.of(context).size.width * .065,
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("No Leave Found", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _leaveBloc = LeaveBloc();
    _leaveRepository = LeaveRepository();
    leaveList = _leaveRepository.leaveList();
    _leaveDeleteBloc = LeaveDeleteBloc();
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        content: Row(
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Loading"),
        )
      ],
    ));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
