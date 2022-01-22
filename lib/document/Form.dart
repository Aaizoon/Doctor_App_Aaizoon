import 'dart:convert';
import 'dart:io';
import 'package:aazioondoctorapp/document/repo/RecordRepo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/AllAppointmentForPatient.dart';

class NewForm extends StatefulWidget {
  @override
  createState() {
    return new NewFormState();
  }
}

class NewFormState extends State<NewForm> {
  RecordRepo recordRepo;
  File imageFile;
  bool firstTime = false;
  Future<AllAppointmentForPatient> patientData;
  String _valSelectId;
  List<Data> _dataBookingId = List();
  /*List<ListItem> _dropdownItemstype = [
    ListItem(1, "ID-1"),
    ListItem(2, "ID-2"),
    ListItem(3, "ID-3"),
    ListItem(4, "ID-4"),
    ListItem(5, "ID-5"),
    ListItem(6, "ID-6"),

  ];*/
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
          icon: Icon(Icons.arrow_back),
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
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Container(
                    height: MediaQuery.of(context).size.height * .5,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder<AllAppointmentForPatient>(
                      future: patientData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (!firstTime) generateList(snapshot.data);
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
                                      child: DropdownButton(
                                        hint: Text("Select Booking Id"),
                                        value: _valSelectId,
                                        items: _dataBookingId.map((item) {
                                          //print("cfk");
                                          //print(item.apptId.toString());
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
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(child: Center(child: _buildImage(snapshot.data.allAppointments))),
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
                                              style: TextStyle(color: Colors.white),
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: Container(
            width: MediaQuery.of(context).size.width * .83,
            child: Center(
                child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ))),
        backgroundColor: Colors.cyan,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  /*_showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context){
          String contentText = "Content of Dialog";
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: new Text("Please Fill up"),
                content: new Container(
                    height: MediaQuery.of(context).size.height*.5,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder<AllAppointmentForPatient>(
                      future: recordRepo.recordRepo(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData)
                        {
                          generateList(snapshot.data);
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: nameController,
                                  cursorColor: Colors.cyan,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Full Name',
                                    hintStyle: TextStyle(color: Colors.grey.shade100),
//
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      borderSide: BorderSide(color: Colors.cyan),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: forwhomController,
                                  cursorColor: Colors.cyan,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'For Whom',
                                    hintStyle: TextStyle(color: Colors.grey.shade100),
//
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText: 'Doctor Name',
                                    hintStyle: TextStyle(color: Colors.grey.shade100),
//
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
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
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          color: Color(2165),
                                          border:
                                          Border.all(color: Colors.grey)),
                                      */ /*child: DropdownButtonHideUnderline(
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
                              ),*/ /*
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
                                              child:InkWell(
                                                onTap: () {
                                                  _showSelectionDialog(context);

                                                },
                                                child:  Text(
                                                  'Browse',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              )



                                            */ /*Text(
                                    'Browse',
                                    style: TextStyle(color: Colors.black),
                                  ),*/ /*
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

                        }
                        else if(snapshot.hasError) {

                          print(snapshot.error.toString());
                          return Container(
                            child:Center(
                                child:Text("No Data ",
                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                            ) ,
                          );
                        }else {
                          return Center(
                            heightFactor: 5,
                            widthFactor: 10,
                            child:
                            CircularProgressIndicator(
                              backgroundColor: Colors.cyan,
                              strokeWidth: 5,),
                          );
                        }


                      },

                    )
                ),
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
        }


    );

  }
*/
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
    firstTime = true;
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

  _buildImage(AllAppointments allAppointments) {
    if (imageFile != null) {
      uploadFile(imageFile, allAppointments.data[0].apptId, allAppointments.data[0].userId);

      return Image.file(imageFile);
    } else {
      return Text('Take an image to start', style: TextStyle(fontSize: 18.0));
    }
  }

  uploadFile(File imageFile, int apptId, String userId) async {
    print("apptid");
    print(apptId);
    print("userId");
    print(userId);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    Map<String, String> headers = {"Authorization": "Bearer " + token};
    print(token);

    var request = http.MultipartRequest("POST", Uri.parse("http://demo.ewinfotech.com/healthgate/public/api/users/global-upload-files"));
    //add text fields

    int userIdApp = prefs.getInt('uid');
    print("userIdApp");
    print(userIdApp);
    request.fields["appt_id"] = apptId.toString();
    request.fields["uploader_id"] = userIdApp.toString();
    request.fields["uploading_for_id"] = userId.toString();
    request.fields["uploader_user_type"] = "2";
    request.fields["file_type"] = 1.toString();
    print("request--->");
    //print(jsonEncode(request));

    //create multipart using filepath, string or bytes
    print("path--");
    print(imageFile.path);
    // var pic = await http.MultipartFile.fromPath("filenames", imageFile.path);
    //var pic = await http.MultipartFile.fromPath("filenames", imageFile.path,contentType: new MediaType('image', 'jpeg'));
    var pic = await http.MultipartFile.fromPath("filenames", imageFile.path, contentType: MediaType('image', 'jpeg'));

    //add multipart to request
    request.files.add(pic);
    request.headers.addAll(headers);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Prescription Uploaded Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
