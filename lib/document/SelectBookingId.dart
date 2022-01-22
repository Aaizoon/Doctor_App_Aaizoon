import 'dart:convert';
import 'dart:io';

import 'package:aazioondoctorapp/document/repo/RecordRepo.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/otp/OtpPage.dart';
import 'package:aazioondoctorapp/utility/Error.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:aazioondoctorapp/document/model/AllAppointmentForPatient.dart' as dataObj;
import 'package:url_launcher/url_launcher.dart';

import 'BookingBlock.dart';
import 'BookingModel.dart';
import 'Form.dart';
import 'model/AllAppointmentForPatient.dart';

class SelectBookingId extends StatefulWidget {
  String fileType;

  @override
  createState() {
    return new NewFormState();
  }

  SelectBookingId({this.fileType});
}

class NewFormState extends State<SelectBookingId> {
  RecordRepo recordRepo;
  BookingBlocDoc _bookingBloc;
  File imageFile;
  bool firstTime = false;
  Future<AllAppointmentForPatient> patientData;
  String _valSelectId;
  List<dataObj.Data> _dataBookingId = List();

  /*List<ListItem> _dropdownItemstype = [
    ListItem(1, "ID-1"),
    ListItem(2, "ID-2"),
    ListItem(3, "ID-3"),
    ListItem(4, "ID-4"),
    ListItem(5, "ID-5"),
    ListItem(6, "ID-6"),

  ];*/
  BookingModel allUploadFileData;
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
      /*appBar: new AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text("Document List",style: TextStyle(color: Colors.black),)),*/
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Container(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder<AllAppointmentForPatient>(
                      future: patientData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (!firstTime) generateList(snapshot.data);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /* Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Container(
                                  width:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * .45,
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * .08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25.0),
                                          topRight: Radius.circular(25.0),
                                          bottomLeft: Radius.circular(25)),
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Center(
                                      child: Text(
                                        "My Invoice",style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*.025),
                                      )),
                                ),
                              ),*/
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(2165), border: Border.all(color: Colors.white)),
                                      child: StreamBuilder<ApiResponse<BookingModel>>(
                                        stream: _bookingBloc.profileStream,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            allUploadFileData = snapshot.data.data;
                                            switch (snapshot.data.status) {
                                              case Status.LOADING:
                                                return Loading(
                                                  loadingMessage: snapshot.data.message,
                                                );
                                                break;
                                              case Status.COMPLETED:
                                                Future.delayed(Duration.zero, () {
                                                  setState(() {});

                                                  /* funListWidget(
                                                      snapshot.data.data.filesUploaded);*/
                                                });

                                                break;
                                              case Status.ERROR:
                                                return Error(
                                                  errorMessage: snapshot.data.message,
                                                );
                                                break;
                                            }
                                          }
                                          return DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.cyan,
                                              ),
                                              hint: Text(
                                                "Select Booking Id",
                                                style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
                                              ),
                                              value: _valSelectId,
                                              items: _dataBookingId.map((item) {
                                                /*print("cfk");
                                                print(item.apptId.toString());*/
                                                return DropdownMenuItem(
                                                  child: Text(
                                                    item.apptId.toString(),
                                                    style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
                                                  ),
                                                  value: item.apptId.toString(),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  _valSelectId = value;
                                                  //  print(_valSelectId);
                                                  _bookingBloc.Appointment_uploded_file_patient(_valSelectId);
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      )),
                                ),
                              ),
                              allUploadFileData != null
                                  ? Padding(
                                      padding:
                                          EdgeInsets.only(top: MediaQuery.of(context).size.height * .02, left: MediaQuery.of(context).size.width * .05, right: MediaQuery.of(context).size.width * .05),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height * .5,
                                        child: ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: allUploadFileData.filesUploaded.data.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _launchURL(allUploadFileData.filesUploaded.data[index].filePath);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, border: Border.all(color: Colors.cyan, width: 2)),
                                                  height: MediaQuery.of(context).size.height * .2,
                                                  margin: EdgeInsets.only(bottom: 15),
                                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .05),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Name of Patient: ${allUploadFileData.filesUploaded.data[index].bookingFullName}",
                                                        style: TextStyle(color: Colors.cyan, fontSize: MediaQuery.of(context).size.height * .025),
                                                      ),
                                                      //  Text("For Whom: ${allUploadFileData.filesUploaded.data[index].bookingFor}",style: TextStyle(color: Colors.cyan,fontSize: MediaQuery.of(context).size.height*.025),),
                                                      Text(
                                                        "Date: ${allUploadFileData.filesUploaded.data[index].apptmtDate}",
                                                        style: TextStyle(color: Colors.cyan, fontSize: MediaQuery.of(context).size.height * .025),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  : Container(
                                      height: 200,
                                    ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .07,
                              ),
                              Container(
                                child: Center(
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.cyan, width: 2)),
                                    height: 60.0,
                                    minWidth: MediaQuery.of(context).size.width * .4,
                                    color: Colors.white,
                                    textColor: Colors.white,
                                    child: new Text(
                                      "Add Record",
                                      style: TextStyle(color: Colors.cyan),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => NewForm()),
                                      );
                                    },
                                    splashColor: Colors.cyan,
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          //print(snapshot.error.toString());
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
      /* floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * .83,
            child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ))),
        backgroundColor: Colors.cyan,
      ),*/
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void initState() {
    _dropdownMenuItemstype = buildDropDownMenuItems(_dropdownItemstype);
    //_selectedItemtype = _dropdownMenuItemstype[0].value;
    recordRepo = RecordRepo();
    patientData = recordRepo.recordRepo();
    _bookingBloc = BookingBlocDoc();
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
      // print("appt id");
      // print(data.allAppointments.data[x].apptId);

      _dataBookingId.add(data.allAppointments.data[x]);
      nameController.text = data.allAppointments.data[x].doctorName;
      forwhomController.text = data.allAppointments.data[x].bookingFor;
      DoctornameController.text = data.allAppointments.data[x].doctorName;

      //  _dropdownItemstype.add(ListItem(1,data.allAppointments.data[x].apptId.toString()));

    }
    //_selectedItemtype = _dropdownMenuItemstype[0].value;
    // print("length");
    // print(_dropdownItemstype.length.toString());
    //  print(_dataBookingId.length.toString());

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
    var request = http.MultipartRequest("POST", Uri.parse("http://demo.ewinfotech.com/bookingapp/public/api/users/global-upload-files"));
    //add text fields
    final prefs = await SharedPreferences.getInstance();
    int userIdApp = prefs.getInt('pid');

    request.fields["appt_id"] = apptId.toString();
    request.fields["uploader_id"] = userIdApp.toString();
    request.fields["uploading_for_id"] = userId.toString();
    request.fields["uploader_user_type"] = "3";
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

  Widget funListWidget(FilesUploaded filesUploaded) {
    return Container(
      height: 40,
      color: Colors.red,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: filesUploaded.data.length,
          itemBuilder: (context, index) {
            return Container(
              height: 40,
              color: Colors.cyan,
              child: Column(
                children: [
                  Text("${filesUploaded.data[index].doctorId}"),
                  Text("${filesUploaded.data[index].bookingFor}"),
                  Text(""),
                ],
              ),
            );
          }),
    );
  }

  _launchURL(String imagePath) async {
    String url = "http://demo.ewinfotech.com/healthgate/public/" + imagePath;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
