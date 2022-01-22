import 'package:aazioondoctorapp/Lab/labListPage.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/home/HomeScreen.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/bloc/AddMedicineBloc.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/bloc/DeleteMedbloc.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/bloc/updateFindindsBloc.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/repository/bookingCompletedRepository.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant.dart';
import 'model/AddMedicineListModel.dart';
import 'model/DeleteMedicineModel.dart';
import 'model/GetMedicineModel.dart';
import 'model/updateFindingsModel.dart';

class AppointmentClosingPage extends StatefulWidget {
  AppointmentClosingPage({this.isEnd});
  final String isEnd;

  @override
  _AppointmentClosingPageState createState() => _AppointmentClosingPageState();
}

class _AppointmentClosingPageState extends State<AppointmentClosingPage> {
  List<MedicineList> medList=[];
  BookingCompletedRepository _bookingCompletedRepository;
  DeleteMedbloc _deleteMedbloc;
  Future<GetMedicineModel> getMed;
  Future<GetMedicineModel> getMedByComposition;
  UpdateFindingsBloc _updateFindingsBloc;
  AddMedicineBloc _addMedicineBloc;
  bool otherFindings = false;
  bool followUpDate = false;
  bool referDoctor = false;
  bool showToast1 = false;
  bool showToast3 = false;
  bool showToast2 = false;
  bool recommendLab = false;
  bool noTest = false;
  bool findings = true;
  bool next = true;
  bool lab = false;
  bool offlineSubmission = false;
  bool medicine = false;
  bool medicineNextStep = false;
  bool medicineSearch = false;
  bool showMedicine = false;
  bool statusComplete = false;
  bool byCompany=true;
  String medId = "";
  String genericName = "";
  int indexx;
  String companyName = "";
  final medSearchController = TextEditingController();
  final howManyDaysController = TextEditingController();
  final howToTakeController = TextEditingController();
  final bloodPressureUpController = TextEditingController();
  final bloodPressureDownController = TextEditingController();
  final ageController = TextEditingController();
  final oxygenSaturationController = TextEditingController();
  final bodyTemperatureController = TextEditingController();
  final bodyWeightController = TextEditingController();
  final otherFindingsController = TextEditingController();
  final referDoctorController = TextEditingController();
  final followUoDateController = TextEditingController();
  final testController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEnd == "1") {
      findings = false;
      medicine = true;
      lab = false;
      statusComplete = true;
      next=false;
      showMedicine=true;
    }
    _bookingCompletedRepository = BookingCompletedRepository();
    _updateFindingsBloc = UpdateFindingsBloc();
    _addMedicineBloc=AddMedicineBloc();
    _deleteMedbloc=DeleteMedbloc();
  }

  final kLabelStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );
  final kHintTextStyle = TextStyle(
    color: Colors.black54,
    fontFamily: 'OpenSans',
  );
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
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: selectedDate, lastDate: DateTime(2025, 12, 31));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        followUoDateController.value = TextEditingValue(text: picked.toString().split(' ')[0]);
      });
  }

  Widget _buildDOBTF() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
              child: TextFormField(
            controller: followUoDateController,
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
              hintText: 'Provide the next date',
              hintStyle: kHintTextStyle,
            ),
          ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    bodyWeightController.text = patientWeight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Appointment Details"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
          children: [
            Center(
              child: patientPicture != null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(imageBaseUrl + patientPicture),
                    )
                  : ClipOval(
                      child: Image.asset(
                        "assets/images/profile.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Patient Name:",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                  )),
                  Text(
                    patientName,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Patient Email:",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                  )),
                  Text(
                    patientEmail ?? "",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Patient Number:",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                  )),
                  Text(
                    patientMobileNumber ?? "",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            appointmentMode=="online"?   Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Patient Date of Birth:",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                  )),
                  Text(
                    patientDOB ?? "Not given by user",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ):SizedBox(height: 0,),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Patient Gender",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                  )),
                  Text(
                    patientGender == "m" ? "Male" : "Female",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            appointmentMode=="online"?   Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Patient Height",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                  )),
                  Text(
                    patientHeight ?? "",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ):SizedBox(height: 0,),
            appointmentMode=="online"?   Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Patient weight",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                  )),
                  Text(
                    "${patientWeight ?? ""} kg",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ):SizedBox(height: 0,),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        "Booking Id:",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                      )),
                  Text(
                    bookingId ?? "",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            findings
                ? Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, top: 20),
                            alignment: Alignment.center,
                            child: Text(
                              "Please Provide Your Findings",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Blood Pressure:",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                                )),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * .2,
                                  child: TextField(
                                    controller: bloodPressureUpController,
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                    keyboardType: TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.cyan),
                                        borderRadius:
                                            new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  " /",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * .08, fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * .2,
                                  child: TextField(
                                    controller: bloodPressureDownController,
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                    keyboardType: TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.cyan),
                                        borderRadius:
                                            new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Oxygen Saturation:",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                                )),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * .24,
                                  child: TextField(
                                    controller: oxygenSaturationController,
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                    keyboardType: TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.cyan),
                                        borderRadius:
                                            new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Body Temperature",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                                )),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * .24,
                                  child: TextField(
                                    controller: bodyTemperatureController,
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                    keyboardType: TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.cyan),
                                        borderRadius:
                                            new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                      "age:",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                                    )),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * .24,
                                  child: TextField(
                                    controller: ageController,
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                    keyboardType: TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.cyan),
                                        borderRadius:
                                        new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Patient's Weight",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                                )),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * .24,
                                  child: TextField(
                                    controller: bodyWeightController,
                                    onChanged: (text) {
                                      patientWeight = bodyWeightController.text;
                                    },
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                    keyboardType: TextInputType.numberWithOptions(),
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.cyan),
                                        borderRadius:
                                            new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                if (!otherFindings) {
                                  otherFindings = true;
                                  setState(() {});
                                } else {
                                  otherFindings = false;
                                  otherFindingsController.text = "";
                                  setState(() {});
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Want to add any other finding?",
                                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                                  )),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 35, bottom: 10),
                                    width: MediaQuery.of(context).size.width * .06,
                                    height: MediaQuery.of(context).size.width * .06,
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: otherFindings == true ? Colors.cyan : Colors.black),
                                        shape: BoxShape.circle,
                                        color: otherFindings == true ? Colors.cyan : Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          otherFindings == true
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: TextField(
                                    controller: otherFindingsController,
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.cyan),
                                        borderRadius:
                                            new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 0,
                                ),
                          //refer doc
                          // Container(
                          //   alignment: Alignment.center,
                          //   height: referDoctor == true ? 80 : 50,
                          //   margin: const EdgeInsets.all(10.0),
                          //   child: InkWell(
                          //     onTap: () {
                          //       if (!referDoctor) {
                          //         referDoctor = true;
                          //         setState(() {});
                          //       } else {
                          //         referDoctor = false;
                          //         referDoctorController.text = "";
                          //         setState(() {});
                          //       }
                          //     },
                          //     child: Row(
                          //       children: [
                          //         Expanded(
                          //             child: Text(
                          //           "Want to refer this patient\n to another doctor ?",
                          //           style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                          //         )),
                          //         Container(
                          //           margin: EdgeInsets.only(left: 5, right: 35, bottom: 10),
                          //           width: MediaQuery.of(context).size.width * .06,
                          //           height: MediaQuery.of(context).size.width * .06,
                          //           child: Icon(
                          //             Icons.circle,
                          //             size: 15,
                          //             color: Colors.white,
                          //           ),
                          //           decoration: BoxDecoration(
                          //               border: Border.all(color: referDoctor == true ? Colors.cyan : Colors.black), shape: BoxShape.circle, color: referDoctor == true ? Colors.cyan : Colors.white),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // referDoctor == true
                          //     ? SizedBox(
                          //         width: MediaQuery.of(context).size.width * .9,
                          //         child: TextField(
                          //           controller: referDoctorController,
                          //           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                          //           keyboardType: TextInputType.multiline,
                          //           maxLines: null,
                          //           decoration: InputDecoration(
                          //             labelText: "Please Provide Doctor's Name",
                          //             hintStyle: TextStyle(color: Colors.grey.shade100),
                          //             border: new OutlineInputBorder(
                          //               borderSide: new BorderSide(color: Colors.cyan),
                          //               borderRadius:
                          //                   new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : SizedBox(
                          //         height: 0,
                          //       ),
                          //refer doc
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                if (!followUpDate) {
                                  followUpDate = true;
                                  setState(() {});
                                } else {
                                  followUpDate = false;
                                  followUoDateController.text = "";
                                  setState(() {});
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Want a date to follow Up ?",
                                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                                  )),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 35, bottom: 10),
                                    width: MediaQuery.of(context).size.width * .06,
                                    height: MediaQuery.of(context).size.width * .06,
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: followUpDate == true ? Colors.cyan : Colors.black), shape: BoxShape.circle, color: followUpDate == true ? Colors.cyan : Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          followUpDate == true
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: _buildDOBTF(),
                                )
                              : SizedBox(
                                  height: 0,
                                ),
                          InkWell(
                            onTap: () {
                              showToast1 = true;
                              Map body = {
                                "user_id": patientId,
                                "doctor_id": doctorId,
                                "age":ageController.text,
                                "booking_id":bookingId,
                                "blood_pressure": "${bloodPressureUpController.text}/${bloodPressureDownController.text}",
                                "oxygen_saturation": oxygenSaturationController.text,
                                "body_temp": bodyTemperatureController.text,
                                "weight": bodyWeightController.text,
                                "other_finding": otherFindingsController.text,
                                "follow_up_date": followUoDateController.text,
                                "reffered_doctor": referDoctorController.text,
                                "booking_type":appointmentMode
                              };
                              _updateFindingsBloc.updateFindings(body);
                              print(body);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * .06,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: Colors.cyan),
                              child: Text(
                                "Next",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .04),
                              ),
                            ),
                          )
                        ],
                      ),
                      StreamBuilder<ApiResponse<UpdateFindingsModel>>(
                          stream: _updateFindingsBloc.getStream,
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
                                  if (showToast1) {
                                    Fluttertoast.showToast(
                                        msg: "Findings recorded successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor: Colors.cyan,
                                        textColor: Colors.white,
                                        timeInSecForIosWeb: 5);
                                    Future.delayed(Duration(seconds: 1), () async {
                                      findings = false;
                                      medicine=true;
                                      lab = false;
                                      setState(() {});
                                    });
                                  }
                                  showToast1 = false;
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
                    ],
                  )
                : SizedBox(
                    height: 0,
                  ),
            medicine
                ? Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 20),
                          alignment: Alignment.center,
                          child: Text(
                            "Please Provide Medication if Needed",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("By Company\nName", style: TextStyle(fontSize: MediaQuery.of(context).size.width * .04, fontWeight: FontWeight.w400)),
                            InkWell(
                              onTap: () {
                                byCompany=true;
                                setState(() {

                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 20, bottom: 10, top: 10),
                                width: MediaQuery.of(context).size.width * .05,
                                height: MediaQuery.of(context).size.width * .05,
                                child: Icon(
                                  Icons.circle,
                                  size: 13,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: byCompany == true ? Colors.cyan : Colors.black), shape: BoxShape.circle, color: byCompany == true ? Colors.cyan : Colors.white),
                              ),
                            ),
                            Text("By Composition", style: TextStyle(fontSize: MediaQuery.of(context).size.width * .04, fontWeight: FontWeight.w400)),
                            InkWell(
                              onTap: () {
                                byCompany=false;
                                setState(() {

                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                                width: MediaQuery.of(context).size.width * .05,
                                height: MediaQuery.of(context).size.width * .05,
                                child: Icon(
                                  Icons.circle,
                                  size: 13,
                                  color: Colors.white,
                                ),
                                decoration:
                                BoxDecoration(border: Border.all(color: byCompany == false ? Colors.cyan : Colors.black), shape: BoxShape.circle, color: byCompany == false ? Colors.cyan : Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            onChanged: (text) {
                              if(medSearchController.text.length>0){ if(byCompany==true){
                                Map body = {
                                  "medicine_name": medSearchController.text.toString(),
                                  "booking_type":appointmentMode
                                };
                                getMed = _bookingCompletedRepository.getMedicine1(body);
                                medicineSearch = true;
                                setState(() {});
                              }else{
                                Map body = {
                                  "medicine_name": medSearchController.text.toString(),
                                  "booking_type":appointmentMode
                                };
                                getMedByComposition = _bookingCompletedRepository.getMedicineByComposition(body);
                                medicineSearch = true;
                                setState(() {});
                              }}


                            },
                            controller: medSearchController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffix: InkWell(
                                onTap: () {
                                  medSearchController.text = "";
                                },
                                child: Icon(Icons.cancel_rounded),
                              ),
                              hintText: "Add Medicine",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.cyan),
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        medicineSearch
                            ? Container(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  left: 10.0,
                                  right: 10,
                                ),
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.width * .8,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: byCompany==true?FutureBuilder<GetMedicineModel>(
                                    future: getMed,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: snapshot.data.data.length>15?15:snapshot.data.data.length>10?10:snapshot.data.data.length>5?5:snapshot.data.data.length>=1?1:0,
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    medSearchController.text = snapshot.data.data[index].name;
                                                    medId = snapshot.data.data[index].id.toString();
                                                    genericName = snapshot.data.data[index].composition;
                                                    companyName = snapshot.data.data[index].name;
                                                    medicineSearch = false;
                                                    medicineNextStep = true;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                        left: 20,
                                                        top: 15,
                                                      ),
                                                      child: Text(
                                                        snapshot.data.data[index].name ?? "",
                                                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                                      )),
                                                ),
                                                Divider(
                                                  thickness: 2,
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                          child: Text("No Medicine Found", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                                        );
                                      } else {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                    }):FutureBuilder<GetMedicineModel>(
                                    future: getMedByComposition,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData&&snapshot.data.data.length!=null) {
                                        return ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount:  snapshot.data.data.length==null?0:snapshot.data.data.length>15?15:snapshot.data.data.length>10?10:snapshot.data.data.length>5?5:snapshot.data.data.length>=1?1:0,
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    medSearchController.text = snapshot.data.data[index].name;
                                                    medId = snapshot.data.data[index].id.toString();
                                                    genericName = snapshot.data.data[index].composition;
                                                    companyName = snapshot.data.data[index].name;
                                                    medicineSearch = false;
                                                    medicineNextStep = true;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                        left: 20,
                                                        top: 15,
                                                      ),
                                                      child: Text(
                                                        snapshot.data.data[index].name ?? "",
                                                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                                      )),
                                                ),
                                                Divider(
                                                  thickness: 2,
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      } else if (snapshot.hasError) {
                                        return Center(
                                          child: Text("No Medicine Found", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                                        );
                                      } else {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                    }),
                              )
                            : SizedBox(
                                height: 0,
                              ),
                        medicineNextStep
                            ? Column(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 10.0, right: 10, top: 10,bottom: 10),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: TextField(
                                      controller: howToTakeController,
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        suffix: InkWell(
                                          onTap: () {
                                            howToTakeController.text = "";
                                          },
                                          child: Icon(Icons.cancel_rounded),
                                        ),
                                        hintText: "How to take",
                                        hintStyle: TextStyle(color: Colors.grey.shade400),
                                        border: new OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.cyan),
                                          borderRadius:
                                              new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                  ),
                                Container(
                                    margin: const EdgeInsets.only(left: 10.0, right: 10, top: 10,bottom: 10),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: TextField(
                                      controller: howManyDaysController,
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                                      keyboardType: TextInputType.number,
                                      maxLength: 3,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(icon:  Icon(Icons.cancel_rounded),
                                            onPressed: () {
                                              howManyDaysController.text = "";
                                            },
                                            ),
                                        suffix: Text("Days"),
                                        hintText: "How many days",
                                        hintStyle: TextStyle(color: Colors.grey.shade400),
                                        border: new OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.cyan),
                                          borderRadius:
                                              new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            )
                            : SizedBox(
                                height: 0,
                              ),
                        InkWell(
                          onTap: () {
                            showToast2 = true;
                            if(medSearchController.text!=""&&howManyDaysController.text!=""&&howToTakeController.text!="")
                              {
                                Map body = {
                                  "user_id": patientId,
                                  "doctor_id": doctorId,
                                  "medicine_name":companyName,
                                  "generic_name":genericName,
                                  "medicine_id":medId,
                                  "how_to_take":howToTakeController.text,
                                  "how_many_days":howManyDaysController.text,
                                  "booking_id":bookingId,
                                  "booking_type":appointmentMode

                                };
                                _addMedicineBloc.addMed(body);
                                print(body);
                              }
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * .06,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: Colors.cyan),
                            child: Text(
                              "Add Medicine",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .04),
                            ),
                          ),
                        ),
                        showMedicine? Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10, top: 30),
                              alignment: Alignment.center,
                              child: Text(
                                "Your Prescribed Medicines",
                                style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                              ),
                            ),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount:  medList.length,
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index1) {
                                return Container(
                                    padding: EdgeInsets.only(bottom: 10,left:10,top:10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color:Colors.grey.shade400))
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("${(index1+1).toString()}. ", style: TextStyle(fontWeight: FontWeight.w700)),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left:10.0),
                                                child: Text( medList[index1].medicineName??"",style: TextStyle(fontWeight: FontWeight.w700),),
                                                // child: Text("${medList[index1].medicineName}-${medList[index1].genericName}"),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(left:10.0,right: 10),
                                                child: Stack(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons.delete_forever_outlined,color: Colors.cyan,),
                                                      iconSize: MediaQuery.of(context).size.width*.065,
                                                      onPressed: (){
                                                        showToast3=true;
                                                        indexx=index1;
                                                        Map body={
                                                          "booking_id":bookingId,
                                                          "user_id":patientId,
                                                          "doctor_id":doctorId,
                                                          "id":medList[index1].id.toString(),
                                                          "booking_type":appointmentMode
                                                        };
                                                        _deleteMedbloc.deleteMed(body);
                                                      },
                                                    ),
                                                    StreamBuilder<ApiResponse<DeleteMedicineModel>>(
                                                        stream: _deleteMedbloc.getStream,
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
                                                                if (showToast3) {
                                                                  Fluttertoast.showToast(
                                                                      msg: "Deleted successfully",
                                                                      toastLength: Toast.LENGTH_SHORT,
                                                                      gravity: ToastGravity.CENTER,
                                                                      backgroundColor: Colors.cyan,
                                                                      textColor: Colors.white,
                                                                      timeInSecForIosWeb: 3);
                                                                  medList.removeAt(indexx);
                                                                  Future.delayed(Duration(seconds: 1), () async {
                                                                    setState(() {});
                                                                  });
                                                                }
                                                                showToast3 = false;
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
                                                  ],
                                                )
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:15.0,top: 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex:2,
                                                  child: Text( medList[index1].howToTake??"")),
                                              Text("   ---->"),
                                              Expanded(
                                                  flex:1,
                                                  child: Text( "   ${medList[index1].howManyDays.toString()??""} day/days")),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          ],
                        ):SizedBox(height: 0,),
                        next? InkWell(
                          onTap: (){
                            lab=true;
                            medicine=false;
                            offlineSubmission=true;
                            setState(() {

                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * .06,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: Colors.cyan),
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .04),
                            ),
                          ),
                        ):SizedBox(height: 0,),
                      ],
                    ),
                    StreamBuilder<ApiResponse<AddMedicineListModel>>(
                        stream: _addMedicineBloc.getStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            switch (snapshot.data.status) {
                              case Status.LOADING:
                                return CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                                );
                                break;
                              case Status.COMPLETED:
                                if (showToast2) {
                                  medList.clear();
                                  Fluttertoast.showToast(
                                      msg: "Medicine Added successfully",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.cyan,
                                      textColor: Colors.white,
                                      timeInSecForIosWeb: 5);
                                      medList = snapshot.data.data.data.medicineList;
                                  showMedicine=true;
                                  Future.delayed(Duration(seconds: 1), () async {
                                    setState(() {});

                                  });
                                }
                                showToast2 = false;
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
                  ],
                )
                : SizedBox(
                    height: 0,
                  ),

             lab
                ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 30),
                        alignment: Alignment.center,
                        child: Text(
                          "Need to do some medical test?",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Yes", style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400)),
                          InkWell(
                            onTap: () {
                              recommendLab = true;
                              noTest = false;
                              statusComplete = false;
                              setState(() {});
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                return Lab1();
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 25, bottom: 10, top: 10),
                              width: MediaQuery.of(context).size.width * .06,
                              height: MediaQuery.of(context).size.width * .06,
                              child: Icon(
                                Icons.circle,
                                size: 15,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: recommendLab == true ? Colors.cyan : Colors.black), shape: BoxShape.circle, color: recommendLab == true ? Colors.cyan : Colors.white),
                            ),
                          ),
                          Text("No", style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w400)),
                          InkWell(
                            onTap: () {
                              recommendLab = false;
                              noTest = true;
                              statusComplete = true;
                              setState(() {});
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                              width: MediaQuery.of(context).size.width * .06,
                              height: MediaQuery.of(context).size.width * .06,
                              child: Icon(
                                Icons.circle,
                                size: 15,
                                color: Colors.white,
                              ),
                              decoration:
                                  BoxDecoration(border: Border.all(color: noTest == true ? Colors.cyan : Colors.black), shape: BoxShape.circle, color: noTest == true ? Colors.cyan : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : SizedBox(
                    height: 0,
                  ),
            statusComplete
                ? Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Status:",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                            )),
                            Text(
                              "Completed",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width * .045, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            String token = prefs.getString("token");
                            Map body = {"booking_id": bookingId, "booking_type": appointmentMode, "booking_status": "Completed"};
                            _bookingCompletedRepository.appointmentCompleted(body, token);
                            print("submitted");
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()), (Route<dynamic> route) => false);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15, top: 50),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * .06,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: Colors.cyan),
                            child: Text(
                              " Submit ",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width * .03),
                            ),
                          ),
                        )
                      ],
                    ),
                )
                : SizedBox(
                    height: 0,
                  ),


          ],
        ),
      ),
    );
  }
}
