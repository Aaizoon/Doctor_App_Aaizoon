import 'package:aazioondoctorapp/NewFinding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AddPrescriptionScreen.dart';
import '../ReferDoctor.dart';
import '../RefereLabReport.dart';

class PatientDetailsScreen extends StatefulWidget {
  @override
  _PatientDetailsScreenState createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  String radioItem = '10 days';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.cyan,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'R.Patel',
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          'Female,24 years',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text('6972213546', style: TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 80),
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset("assets/images/profile.png", height: 70),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 15, bottom: 5, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Text(
                      'Medical History',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 2),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  'Diabetic',
                                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Text(
                                      'yes',
                                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.green, fontSize: 15),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
                            child: Text(
                              'Medicine 50mg,Medicine 2 100 mg',
                              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.cyan, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 2),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  'Heart Probleme',
                                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Text(
                                      'yes',
                                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.green, fontSize: 15),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
                            child: Text(
                              'Medicine 50mg,Medicine 2 100 mg',
                              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.cyan, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 2),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  'Diabetic',
                                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15),
                                )),
                                Container(
                                    child: Row(
                                  children: <Widget>[
                                    Text(
                                      'yes',
                                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.green, fontSize: 15),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
                            child: Text(
                              'Medicine 50mg,Medicine 2 100 mg',
                              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.cyan, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NewFinding()),
                            );
                          }, // handle your onTap here
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.find_in_page,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'New Finding',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.5,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddPrescriptionScreen()),
                            );
                          }, // handle your onTap here
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.collections_bookmark,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Prescription',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.4,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReferLabReport()),
                            );
                          }, // handle your onTap here
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.report,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Refer Lab Report',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.5,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReferDoctorReport()),
                            );
                          }, // handle your onTap here
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.local_hospital,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Refer Doctor',
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.all(Radius.circular(20))),
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.4,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Next Appointment',
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700, fontSize: 17),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile(
                    title: Text('10 days'),
                    value: '10 days',
                    groupValue: radioItem,
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text('20 days'),
                    value: '20 days',
                    groupValue: radioItem,
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 17),
                )),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
