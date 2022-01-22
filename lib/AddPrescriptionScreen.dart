import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPrescriptionScreen extends StatefulWidget {
  @override
  _AddPrescriptionScreenState createState() => _AddPrescriptionScreenState();
}

class _AddPrescriptionScreenState extends State<AddPrescriptionScreen> {
  var valc = false;
  var value;
  var value1;
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
                Stack(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              value == null ? 'Medicine1' : value,
                              style: TextStyle(color: Colors.grey),
                            ),
                            DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                isExpanded: false,
                                items: <String>[].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  setState(() {
                                    value = item;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Positioned(
                        left: 50,
                        top: 12,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Colors.grey.shade200,
                          child: Text(
                            'Select Medicine',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              value == null ? 'Medicine2' : value,
                              style: TextStyle(color: Colors.grey),
                            ),
                            DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                isExpanded: false,
                                items: <String>[].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  setState(() {
                                    value = item;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Positioned(
                        left: 50,
                        top: 12,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Colors.grey.shade200,
                          child: Text(
                            'Select Medicine',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Center(child: Text("Or")),
            ),
            Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              value == null ? 'Enter Prescription' : value,
                              style: TextStyle(color: Colors.grey),
                            ),
                            DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                isExpanded: false,
                                items: <String>[].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  setState(() {
                                    value = item;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: 250,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Positioned(
                        left: 50,
                        top: 12,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          color: Colors.grey.shade200,
                          child: Text(
                            'Enter Prescription',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                  ],
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
