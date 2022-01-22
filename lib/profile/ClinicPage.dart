import 'package:aazioondoctorapp/profile/Data/availability.dart';
import 'package:aazioondoctorapp/profile/HospitalDescription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Data/ProfileData1.dart';
import 'Data/ProfileData2.dart';
import 'model/DocProfileModel.dart';

class ClinicPage extends StatefulWidget {
  Profile1 data;
  DocProfileModel globalProfileApiModeldata;

  ClinicPage({this.data, this.globalProfileApiModeldata});

  @override
  _ClinicPageState createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  final clinicnameController = TextEditingController();
  final clinicaddressController = TextEditingController();
  final MontimemorningController = TextEditingController();
  final monTimeSlotController = TextEditingController();
  final MontimemorningstartController = TextEditingController();
  final MontimemorningendController = TextEditingController();
  final MontimeeveningstartController = TextEditingController();
  final MontimeeveningendController = TextEditingController();
  final MontimeeveningController = TextEditingController();
  final TuetimemorningController = TextEditingController();
  final tueTimeSlotController = TextEditingController();
  final TuetimemorningstartController = TextEditingController();
  final TuetimemorningendController = TextEditingController();

  final TuetimeeveningController = TextEditingController();
  final TuetimeeveningstartController = TextEditingController();
  final TuetimeeveningendController = TextEditingController();

  final WedtimemorningController = TextEditingController();
  final wedTimeSlotController = TextEditingController();
  final WedtimemorningstartController = TextEditingController();
  final WedtimemorningendController = TextEditingController();

  final WedtimeeveningController = TextEditingController();
  final WedtimeeveningstartController = TextEditingController();
  final WedtimeeveningendController = TextEditingController();

  final ThutimemorningController = TextEditingController();
  final thuTimeSlotController = TextEditingController();
  final ThutimemorningstartController = TextEditingController();
  final ThutimemorningendController = TextEditingController();

  final ThutimeeveningController = TextEditingController();
  final ThutimeeveningstartController = TextEditingController();
  final ThutimeeveningendController = TextEditingController();
  final FritimemorningController = TextEditingController();
  final friTimeSlotController = TextEditingController();
  final FritimeeveningController = TextEditingController();
  final FritimemorningstartController = TextEditingController();
  final FritimemorningendController = TextEditingController();

  final FritimeeveningstartController = TextEditingController();
  final FritimeeveningendController = TextEditingController();
  final SattimemorningController = TextEditingController();
  final satTimeSlotController = TextEditingController();
  final SattimemorningstartController = TextEditingController();
  final SattimemorningendController = TextEditingController();
  final SattimeeveningController = TextEditingController();
  final SattimeeveningstartController = TextEditingController();
  final SattimeeveningendController = TextEditingController();
  final SuntimemorningController = TextEditingController();
  final sunTimeSlotController = TextEditingController();
  final SuntimemorningstartController = TextEditingController();
  final SuntimemorningendController = TextEditingController();
  final SuntimeeveningController = TextEditingController();
  final SuntimeeveningstartController = TextEditingController();
  final SuntimeeveningendController = TextEditingController();

  @override
  void initState() {
    super.initState();
    clinicnameController.text = widget.globalProfileApiModeldata.data.clinic[0].clinicName.toString();
    clinicaddressController.text = widget.globalProfileApiModeldata.data.clinic[0].clinicAddress.toString();

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[1].morningSlot != null) {
      var mondayMorningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[1].morningSlot.split("-");
      if (mondayMorningSplit.length > 0) MontimemorningstartController.text = mondayMorningSplit[0];
      if (mondayMorningSplit.length > 1) MontimemorningendController.text = mondayMorningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[1].consultationDuration != null)
      monTimeSlotController.text = widget.globalProfileApiModeldata.data.clinic[0].availability[1].consultationDuration;

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[1].eveningSlot != null) {
      var mondayEveningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[1].eveningSlot.split("-");
      if (mondayEveningSplit.length > 0) MontimeeveningstartController.text = mondayEveningSplit[0];
      if (mondayEveningSplit.length > 1) MontimeeveningendController.text = mondayEveningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[2].morningSlot != null) {
      var tuesdayMorningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[2].morningSlot.split("-");
      if (tuesdayMorningSplit.length > 0) TuetimemorningstartController.text = tuesdayMorningSplit[0];
      if (tuesdayMorningSplit.length > 1) TuetimemorningendController.text = tuesdayMorningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[2].consultationDuration != null)
      tueTimeSlotController.text = widget.globalProfileApiModeldata.data.clinic[0].availability[2].consultationDuration;

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[2].eveningSlot != null) {
      var tuesdayEveningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[2].eveningSlot.split("-");
      if (tuesdayEveningSplit.length > 0) TuetimeeveningstartController.text = tuesdayEveningSplit[0];
      if (tuesdayEveningSplit.length > 1) TuetimeeveningendController.text = tuesdayEveningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[3].morningSlot != null) {
      var wednesdayMorningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[3].morningSlot.split("-");
      if (wednesdayMorningSplit.length > 0) WedtimemorningstartController.text = wednesdayMorningSplit[0];
      if (wednesdayMorningSplit.length > 1) WedtimemorningendController.text = wednesdayMorningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[3].consultationDuration != null)
      wedTimeSlotController.text = widget.globalProfileApiModeldata.data.clinic[0].availability[3].consultationDuration;

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[3].eveningSlot != null) {
      var wednesdayEveningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[3].eveningSlot.split("-");
      if (wednesdayEveningSplit.length > 0) WedtimeeveningstartController.text = wednesdayEveningSplit[0];
      if (wednesdayEveningSplit.length > 1) WedtimeeveningendController.text = wednesdayEveningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[4].morningSlot != null) {
      var thursdayMorningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[4].morningSlot.split("-");
      if (thursdayMorningSplit.length > 0) ThutimemorningstartController.text = thursdayMorningSplit[0];
      if (thursdayMorningSplit.length > 1) ThutimemorningendController.text = thursdayMorningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[4].consultationDuration != null)
      thuTimeSlotController.text = widget.globalProfileApiModeldata.data.clinic[0].availability[4].consultationDuration;

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[4].eveningSlot != null) {
      var thursdayEveningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[4].eveningSlot.split("-");
      if (thursdayEveningSplit.length > 0) ThutimeeveningstartController.text = thursdayEveningSplit[0];
      if (thursdayEveningSplit.length > 1) ThutimeeveningendController.text = thursdayEveningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[5].morningSlot != null) {
      var friMorningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[5].morningSlot.split("-");
      if (friMorningSplit.length > 0) FritimemorningstartController.text = friMorningSplit[0];
      if (friMorningSplit.length > 1) FritimemorningendController.text = friMorningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[5].consultationDuration != null)
      friTimeSlotController.text = widget.globalProfileApiModeldata.data.clinic[0].availability[5].consultationDuration;

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[5].eveningSlot != null) {
      var fridayEveningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[5].eveningSlot.split("-");
      if (fridayEveningSplit.length > 0) FritimeeveningstartController.text = fridayEveningSplit[0];
      if (fridayEveningSplit.length > 1) FritimeeveningendController.text = fridayEveningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[6].morningSlot != null) {
      var saturdayMorningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[6].morningSlot.split("-");
      if (saturdayMorningSplit.length > 0) SattimemorningstartController.text = saturdayMorningSplit[0];
      if (saturdayMorningSplit.length > 1) SattimemorningendController.text = saturdayMorningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[6].consultationDuration != null)
      satTimeSlotController.text = widget.globalProfileApiModeldata.data.clinic[0].availability[6].consultationDuration;

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[6].eveningSlot != null) {
      var saturdayEveningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[6].eveningSlot.split("-");
      if (saturdayEveningSplit.length > 0) SattimeeveningstartController.text = saturdayEveningSplit[0];
      if (saturdayEveningSplit.length > 1) SattimeeveningendController.text = saturdayEveningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[0].morningSlot != null) {
      var sundayMorningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[0].morningSlot.split("-");
      if (sundayMorningSplit.length > 0) SuntimemorningstartController.text = sundayMorningSplit[0];
      if (sundayMorningSplit.length > 1) SuntimemorningendController.text = sundayMorningSplit[1];
    }

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[0].consultationDuration != null)
      sunTimeSlotController.text = widget.globalProfileApiModeldata.data.clinic[0].availability[0].consultationDuration;

    if (widget.globalProfileApiModeldata.data.clinic[0].availability[0].eveningSlot != null) {
      var sundayEveningSplit = widget.globalProfileApiModeldata.data.clinic[0].availability[0].eveningSlot.split("-");
      if (sundayEveningSplit.length > 0) SuntimeeveningstartController.text = sundayEveningSplit[0];
      if (sundayEveningSplit.length > 1) SuntimeeveningendController.text = sundayEveningSplit[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Card(
              child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade100, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.0),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: clinicnameController,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Clinic Name',
                      hintStyle: TextStyle(color: Colors.grey.shade100),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                      ),
//
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  TextField(
                    controller: clinicaddressController,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: 'Clinic Address',
                      hintStyle: TextStyle(color: Colors.grey.shade100),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                      ),
//
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Please Provide Clinic Timings",
                            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: InkWell(
                              onTap: () {
                                TuetimemorningstartController.text = MontimemorningstartController.text.toString();
                                TuetimemorningendController.text = MontimemorningendController.text.toString();
                                TuetimeeveningstartController.text = MontimeeveningstartController.text.toString();
                                TuetimeeveningendController.text = MontimeeveningendController.text.toString();

                                WedtimemorningstartController.text = MontimemorningstartController.text.toString();
                                WedtimemorningendController.text = MontimemorningendController.text.toString();
                                WedtimeeveningstartController.text = MontimeeveningstartController.text.toString();
                                WedtimeeveningendController.text = MontimeeveningendController.text.toString();

                                ThutimemorningstartController.text = MontimemorningstartController.text.toString();
                                ThutimemorningendController.text = MontimemorningendController.text.toString();
                                ThutimeeveningstartController.text = MontimeeveningstartController.text.toString();
                                ThutimeeveningendController.text = MontimeeveningendController.text.toString();

                                FritimemorningstartController.text = MontimemorningstartController.text.toString();
                                FritimemorningendController.text = MontimemorningendController.text.toString();
                                FritimeeveningstartController.text = MontimeeveningstartController.text.toString();
                                FritimeeveningendController.text = MontimeeveningendController.text.toString();

                                SattimemorningstartController.text = MontimemorningstartController.text.toString();
                                SattimemorningendController.text = MontimemorningendController.text.toString();
                                SattimeeveningstartController.text = MontimeeveningstartController.text.toString();
                                SattimeeveningendController.text = MontimeeveningendController.text.toString();

                                SuntimemorningstartController.text = MontimemorningstartController.text.toString();
                                SuntimemorningendController.text = MontimemorningendController.text.toString();
                                SuntimeeveningstartController.text = MontimeeveningstartController.text.toString();
                                SuntimeeveningendController.text = MontimeeveningendController.text.toString();
                                thuTimeSlotController.text = monTimeSlotController.text.toString();
                                wedTimeSlotController.text = monTimeSlotController.text.toString();
                                thuTimeSlotController.text = monTimeSlotController.text.toString();
                                friTimeSlotController.text = monTimeSlotController.text.toString();
                                satTimeSlotController.text = monTimeSlotController.text.toString();
                                sunTimeSlotController.text = monTimeSlotController.text.toString();
                              },
                              child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.cyan),
                                  child: Center(
                                      child: Text(
                                    "Copy to All Field",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            height: 30,
                            child: Center(
                              child: Text(
                                "Morning",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            height: 30,
                            child: Center(
                              child: Text(
                                "evening",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Monday",
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: MontimemorningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      ///
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: MontimemorningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Spacer(),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: MontimeeveningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: MontimeeveningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Provide Consultation Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: monTimeSlotController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Tuesday",
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: TuetimemorningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      ///
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: TuetimemorningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Spacer(),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: TuetimeeveningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: TuetimeeveningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Provide Consultation Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: tueTimeSlotController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Wednesday",
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: WedtimemorningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      ///
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: WedtimemorningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Spacer(),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: WedtimeeveningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: WedtimeeveningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Provide Consultation Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: wedTimeSlotController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Thursday",
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: ThutimemorningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      ///
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: ThutimemorningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Spacer(),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: ThutimeeveningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: ThutimeeveningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Provide Consultation Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: thuTimeSlotController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Friday",
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: FritimemorningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      ///
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: FritimemorningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Spacer(),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: FritimeeveningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: FritimeeveningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Provide Consultation Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: friTimeSlotController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Saturday",
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: SattimemorningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      ///
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: SattimemorningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Spacer(),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: SattimeeveningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: SattimeeveningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Provide Consultation Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: satTimeSlotController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Sunday",
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: SuntimemorningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      ///
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: SuntimemorningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Spacer(),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: SuntimeeveningstartController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Container(
                            height: 70,
                            width: 17,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "-",
                                  style: TextStyle(),
                                ))),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: SuntimeeveningendController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Provide Consultation Duration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: TextField(
                            controller: sunTimeSlotController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: '00:00',

                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HospitalDescription(
                              dataFirst: widget.data,
                              globalProfileApiModeldata: widget.globalProfileApiModeldata,
                            )),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.all(Radius.circular(25))),
                      height: 50,
                      width: MediaQuery.of(context).size.width * .4,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
