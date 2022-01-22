import 'package:aazioondoctorapp/Lab/bloc/GivenTestBloc.dart';
import 'package:aazioondoctorapp/Lab/repository/LabListRepository.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/appointmentClosingPage.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'model/GivenLabTesTModel.dart';
import 'model/LabTestListModel.dart';


class Lab2 extends StatefulWidget {
  final labId;
  final labName;
  final labAddress;
  final labEmail;
  Lab2(this.labId, this.labName, this.labAddress, this.labEmail);

  @override
  _Lab2State createState() => _Lab2State();
}

class _Lab2State extends State<Lab2> {
  GivenTestBloc _givenTestBloc;
  List testNameSearch = [];
  List testIdSearch = [];
  List addedTestIdSearch = [];
  List addedTestNameSearch = [];
  List testDataBool = [];
  List testDataTap = [];
  List testBookingID = [];
  bool searchOn=false;
  String testId = "";
  final searchController = TextEditingController();
  var arrlabName = [
    "Lab 1",
    "Lab 2",
    "Lab 3",
  ];
  var arrlabaddress = ["Nimta", "Birati", "Pathanpur"];
  var Phonenumber = ["9804068663", "6291464260", "7003284185"];
  LabListRepository _labListRepository;
  Future<LabTestListModel> Labdata;

  @override
  void initState() {
    super.initState();
    _labListRepository = LabListRepository();
    Labdata = _labListRepository.getLabTestList(widget.labId);
    _givenTestBloc=GivenTestBloc();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle heading1= TextStyle(color: Colors.black,fontSize:MediaQuery.of(context).size.width*.04,fontWeight: FontWeight.w500);
    TextStyle heading2= TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.width*.035,);
    TextStyle normalText= TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*.03,);
    AppBar appBar =  AppBar(
      elevation: 0,
      title: Text(
        "${widget.labName??''}",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.cyan,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.width*.2,
                padding: EdgeInsets.fromLTRB(20, 10, 15, 5),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(widget.labName, style:heading1),
                                Text("${widget.labEmail}" ?? '', style: heading2),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,size: MediaQuery.of(context).size.width*.042,),

                                    Flexible(child:Text("  ${widget.labAddress}" ?? '', style: heading2)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          " 4.2 ★ ",
                          style: TextStyle(color: Colors.white, backgroundColor: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              Container(
                  height: MediaQuery.of(context).size.height*.77,
                  color: Colors.white,
                  child: FutureBuilder<LabTestListModel>(
                    future: Labdata,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.hasError) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 60.0),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.data.length,
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                testDataBool.add(List.generate(snapshot.data.data[index].tests.length, (index1) => false));
                                testDataTap.add(List.generate(snapshot.data.data[index].tests.length, (index1) => false));
                                testBookingID.add(List.generate(snapshot.data.data[index].tests.length, (index1) => ""));
                                return Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      height: MediaQuery.of(context).size.height * .09,
                                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, MediaQuery.of(context).size.height * .02),
                                      child: TextField(
                                        onTap: (){
                                          searchOn=true;

                                        },
                                        controller: searchController,
                                        onChanged: (text) {
                                          testNameSearch.clear();
                                          testIdSearch.clear();
                                          if(searchController.text.length>1){
                                            for(int i=0;i<snapshot.data.data[index].tests.length;i++) {
                                              if (snapshot.data.data[index].tests[i].testName.toLowerCase().contains(searchController.text.toLowerCase())) {
                                                testNameSearch.add(snapshot.data.data[index].tests[i].testName);
                                                testIdSearch.add(snapshot.data.data[index].tests[i].testId);
                                                print(testNameSearch[i]);
                                              }else{
                                                print("Not Available");
                                              }
                                              setState(() {

                                              });
                                            }
                                          }
                                        },
                                        decoration: new InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                            ),
                                            enabledBorder: new OutlineInputBorder(
                                              borderSide: new BorderSide(color: Colors.grey),
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                            ),
                                            filled: true,
                                            hintStyle: new TextStyle(color: Colors.grey),
                                            hintText: "Search Test",
                                            fillColor: Colors.white),
                                      ),
                                    ),
                                    searchOn==true?testNameSearch.length!=0?ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: testNameSearch.length,
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index2) {
                                          return InkWell(
                                            onTap: () {
                                              for(int i=0;i<testIdSearch.length;i++)
                                                {
                                                  if(!addedTestIdSearch.contains(testIdSearch[index2])){
                                                    addedTestIdSearch.add(testIdSearch[index2]);
                                                    addedTestNameSearch.add(testNameSearch[index2]);
                                                    testNameSearch.clear();
                                                    testIdSearch.clear();
                                                    searchController.clear();
                                                    setState(() {

                                                    });
                                                  }else{
                                                    Fluttertoast.showToast(msg: "Already in selected test", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 3, backgroundColor: Colors.cyan);
                                                  }
                                                }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                              child: Card(
                                                elevation: 3,
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                                  height: MediaQuery.of(context).size.height * 0.1,
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    testNameSearch[index2],
                                                    style: TextStyle(fontWeight: FontWeight.w400,),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }):searchController.text.length!=0?Text("This test is not available at this Lab",style: TextStyle(color: Colors.red),):Container():Container(),
                                    searchOn==true?Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text("Your Selected Test", style: TextStyle(fontSize: MediaQuery.of(context).size.width*.045, fontWeight: FontWeight.w600),),
                                    ):Container(),
                                    searchOn==true?ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: addedTestNameSearch.length,
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index2) {
                                          return Container(
                                            margin: const EdgeInsets.only(left: 20.0, right: 10.0,top: 20),
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                Text(
                                                "${(index2+1).toString()} .   ",
                                                  style: TextStyle(fontWeight: FontWeight.w400,),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                   "${ addedTestNameSearch[index2]}",
                                                    style: TextStyle(fontWeight: FontWeight.w400,),
                                                  ),
                                                ),
                                                Padding(padding: EdgeInsets.only(right: 30),
                                                child: InkWell(
                                                  onTap:(){
                                                    addedTestNameSearch.removeAt(index2);
                                                    addedTestIdSearch.removeAt(index2);
                                                    setState(() {

                                                    });
                                                  },
                                                  child: Icon(Icons.cancel),

                                                ),
                                                )


                                              ],
                                            ),
                                          );
                                        }):Container(),
                                    searchOn==false?Column(
                                      children: [
                                        Container(padding: EdgeInsets.only(left: 15,top: 10,bottom: 10),
                                          color: Colors.white,
                                          child:Text("Select  Lab test",style: heading1,),
                                        ),
                                        ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: snapshot.data.data[index].tests.length,
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, idex) {
                                              return InkWell(
                                                onTap: () {
                                                  if (testDataTap[index][idex] == false) {
                                                    testBookingID[index][idex] = snapshot.data.data[index].tests[idex].testId.toString();
                                                    testDataBool[index][idex] = true;
                                                    testDataTap[index][idex] = true;
                                                    setState(() {});
                                                  } else {
                                                    testBookingID[index][idex] = "";
                                                    testDataBool[index][idex] = false;
                                                    testDataTap[index][idex] = false;
                                                    setState(() {});
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                                  child: Card(
                                                    color: (testDataBool[index][idex]) ? Colors.cyan : Colors.white,
                                                    elevation: 3,
                                                    child: Container(
                                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                                      height: MediaQuery.of(context).size.height * 0.1,
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Expanded(
                                                                child: Container(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: Text(
                                                                    snapshot.data.data[index].tests[idex].testName,
                                                                    style: TextStyle(fontWeight: FontWeight.w400,color: (testDataBool[index][idex]) ? Colors.white : Colors.cyan,),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Container(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: Text(
                                                                    "Rs. ${snapshot.data.data[index].tests[idex].testFee.toString() ?? ''}",
                                                                    style:TextStyle(fontWeight: FontWeight.w400,color: (testDataBool[index][idex]) ? Colors.white : Colors.cyan),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ],
                                    ):Container(),

                                  ],
                                );
                              }),
                        );
                      }
                      return Container();
                    },
                  )),
            ],
          ),
          StreamBuilder<ApiResponse<GivenLabTesTModel>>(
              stream: _givenTestBloc.getStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.LOADING:
                      Future.delayed(Duration.zero, () {
                        return CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                        );
                      });

                      break;
                    case Status.COMPLETED:
                      Fluttertoast.showToast(
                          msg: "Lab tests recorded successfully", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, backgroundColor: Colors.cyan, textColor: Colors.white, timeInSecForIosWeb: 5);
                      Future.delayed(Duration.zero, () async {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AppointmentClosingPage(isEnd:"1")), (Route<dynamic> route) => false);
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
              })
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          testId="";
          if(searchOn){
            for(int i=0;i<addedTestIdSearch.length;i++){
              if(addedTestIdSearch[i]!=""){
                if(testId==""){
                  testId=addedTestIdSearch[i].toString();
                }else
               { testId= testId+","+addedTestIdSearch[i].toString();}
              }
            }
          }
          else{
            for (int i = 0; i < testBookingID.length; i++) {
              for (int j = 0; j < testBookingID[i].length; j++) {
                if (testBookingID[i][j] != "") {
                  if (testId == "")
                    testId = testBookingID[i][j];
                  else
                    testId = testId + "," + testBookingID[i][j];
                }
              }
            }
          }
            print(testId);
          if (testId == "")
           { Fluttertoast.showToast(msg: "Please Select a Test First", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 3, backgroundColor: Colors.red);}
          else{
            Map body={
              "doctor_id": doctorId,
              "user_id": patientId,
              "lab_id": widget.labId,
              "test_id": testId,
              "booking_id":bookingId,
              "booking_type":appointmentMode
            };
            _givenTestBloc..givenTests(body);
            print(body);
          }
          },
        label: Text(
          '          Submit          ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
