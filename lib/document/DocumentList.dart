import 'dart:convert';
import 'dart:io';

import 'package:aazioondoctorapp/document/repo/RecordRepo.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'Form.dart';
import 'ImageShower.dart';
import 'model/AllAppointmentForPatient.dart';

class DocumentList extends StatefulWidget {
  RecordRepo recordRepo;
  @override
  createState() {
    return new DocumentListState();
  }
}

class DocumentListState extends State<DocumentList> {
  RecordRepo recordRepo;
  File imageFile;
  bool firstTime = false;
  Future<AllAppointmentForPatient> patientData;
  String _valSelectId;
  List<Data> _dataBookingId = List();

  List<ListItem> _dropdownItemstype = [];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItemstype;
  ListItem _selectedItemtype;
  final nameController = TextEditingController();
  final forwhomController = TextEditingController();
  final DoctornameController = TextEditingController();
  List<String> DoctorName = ["S Krishna", "Raju Meheta ", "Manish Modha", "Ajit Deol"];
  List<String> ImagePath = [
    "assets/images/sample-invoice.png",
    "assets/images/empty-medical-prescription-rx-form-with-pills-vector-21487221.jpg",
    "assets/images/008191444_1-21e3ed4c77d5e8b2062dee0016f6cb59.png",
  ];
  List<String> Date = ["02-10-2020", "03-10-2020", "04-10-2020", "05-10-2020"];
  List<String> Forwhom = [
    "Father",
    "Mother",
    "Son",
    "Daughter",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: new Text(
          "Document List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewForm()),
                      );
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Add New',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'My Invoice',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            FutureBuilder<AllAppointmentForPatient>(
              future: patientData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.allAppointments.data.length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                          height: 200,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        width: MediaQuery.of(context).size.width * .4,
                                        child: Text(
                                          "date: ${snapshot.data.allAppointments.data[index].apptmtDate}",
                                          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Name of Doctor: ${snapshot.data.allAppointments.data[index].doctorName}',
                                        style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'For whom: ${snapshot.data.allAppointments.data[index].bookingFor}',
                                        style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Invoice:',
                                            style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Imageshower(img: ImagePath[0])),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text(
                                                'For Invoice Click Here',
                                                style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    child: Center(
                        child: Text(
                      "No Data ",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )),
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
                return Container();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewForm()),
                      );
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Add New',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'My Prescription',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: DoctorName.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(
                                    "date: ${Date[index]}",
                                    style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Name of Doctor: ${DoctorName[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'For whom: ${Forwhom[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      'Prescription:',
                                      style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Imageshower(img: ImagePath[1])),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'For Prescription Click Here',
                                          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewForm()),
                      );
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Add New',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'My Lab Report',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: DoctorName.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(
                                    "date: ${Date[index]}",
                                    style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Name of Doctor: ${DoctorName[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'For whom: ${Forwhom[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      'Lab Report:',
                                      style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Imageshower(img: ImagePath[2])),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'For Lab Report Click Here',
                                          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          String contentText = "Content of Dialog";
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content: new Container(
                    height: MediaQuery.of(context).size.height * .5,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder<AllAppointmentForPatient>(
                      future: recordRepo.recordRepo(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          generateList(snapshot.data);
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: nameController,
                                  cursorColor: Colors.cyan,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Full Name',
                                    hintStyle: TextStyle(color: Colors.grey.shade100),
//
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      borderSide: BorderSide(color: Colors.cyan),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: DoctornameController,
                                  cursorColor: Colors.cyan,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Doctor Name',
                                    hintStyle: TextStyle(color: Colors.grey.shade100),
//
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      borderSide: BorderSide(color: Colors.cyan),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text('Booking ID'),
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(2165), border: Border.all(color: Colors.grey)),
                                      /*child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  value: _selectedItemtype,
                                  items: _dropdownMenuItemstype,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedItemtype = value;
                                    });
                                  },
                                  style: new TextStyle(
                                    color: Colors.black,),
                                ),
                              ),*/
                                      child: DropdownButton(
                                        hint: Text("Select Booking Id"),
                                        value: _valSelectId,
                                        items: _dataBookingId.map((item) {
                                          print("cfk");
                                          print(item.apptId.toString());
                                          return DropdownMenuItem(
                                            child: Text(item.apptId.toString()),
                                            value: item.apptId.toString(),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _valSelectId = value;
                                            print(_valSelectId);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Expanded(child: Center(child: _buildImage())),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          child: Center(
                                              child: InkWell(
                                            onTap: () {
                                              _showSelectionDialog(context);
                                            },
                                            child: Text(
                                              'Browse',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          )

                                              /*Text(
                                    'Browse',
                                    style: TextStyle(color: Colors.black),
                                  ),*/
                                              ),
                                          height: 100,
                                          width: MediaQuery.of(context).size.width * .2,
                                          decoration: BoxDecoration(
                                              color: Colors.cyan,
                                              border: Border.all(
                                                color: Colors.cyanAccent,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(20))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          print(snapshot.error.toString());
                          return Container(
                            child: Center(
                                child: Text(
                              "No Data ",
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                            )),
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
                      },
                    )),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Submit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
          );
        });
  }

  @override
  void initState() {
    _dropdownMenuItemstype = buildDropDownMenuItems(_dropdownItemstype);
    //_selectedItemtype = _dropdownMenuItemstype[0].value;
    recordRepo = RecordRepo();
    patientData = recordRepo.recordRepo();
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  void generateList(AllAppointmentForPatient data) {
    // firstTime=true;
    _dataBookingId.clear();
    for (int x = 0; x < data.allAppointments.data.length; x++) {
      // _dataBookingId.add("country");
      print("appt id");
      print(data.allAppointments.data[x].apptId);

      _dataBookingId.add(data.allAppointments.data[x]);
      nameController.text = data.allAppointments.data[x].patientName;
      forwhomController.text = data.allAppointments.data[x].bookingFor;
      DoctornameController.text = data.allAppointments.data[x].doctorName;

      //  _dropdownItemstype.add(ListItem(1,data.allAppointments.data[x].apptId.toString()));

    }
    //_selectedItemtype = _dropdownMenuItemstype[0].value;
    print("length");
    // print(_dropdownItemstype.length.toString());
    print(_dataBookingId.length.toString());

    Future.delayed(Duration.zero, () async {
      setState(() {});
    });
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      if (imageFile == null)
        print("img null");
      else
        print("img not null");
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Widget _setImageView() {
    if (imageFile != null) {
      return Image.file(imageFile, width: 500, height: 500);
    } else {
      return Text("Please select ");
    }
  }

  _buildImage() {
    if (imageFile != null) {
      // uploadFile(_imageFile,widget.pharmaId);

      return Image.file(imageFile);
    } else {
      return Text('Take an image to start', style: TextStyle(fontSize: 18.0));
    }
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
