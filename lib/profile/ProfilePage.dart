import 'dart:io';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/utility/Error.dart';
import 'package:aazioondoctorapp/utility/Loading.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'ClinicPage.dart';
import 'Data/ProfileData1.dart';
import 'bloc/DocProfileBloc.dart';
import 'model/DocProfileModel.dart';
import '../Constant.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File imageFile1;
  bool ispicup;
  File imageFile;
  DocProfileModel globalProfileApiModel;
  bool firstTimeLoad = false;
  String experience = "";
  String qualification = "";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobilenumberController = TextEditingController();
  final licensenumberController = TextEditingController();
  final qualificationController = TextEditingController();
  final experienceController = TextEditingController();
  final addressController = TextEditingController();
  final feesController = TextEditingController();
  final onlineFeesController = TextEditingController();
  DocProfileBloc docprofileBloc;
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

  Widget _buildDOBTF() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      height: 60.0,
      child: GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
              child: TextFormField(
            controller: _date,
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
              hintText: 'Enter Your Date of Birth',
              hintStyle: kHintTextStyle,
            ),
          ))),
    );
  }

  var resultHolder = 'Checkbox is UN-CHECKED';
  DateTime selectedDate = DateTime(2020, 1, 1);

  TextEditingController _date = new TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1940, 1, 1), lastDate: DateTime(2020, 10, 31));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: picked.toString().split(' ')[0]);
      });
  }

  List<ListItem> _dropdowndegreetype = [
    ListItem(1, "Select Qualification "),
    ListItem(2, "MBBS "),
    ListItem(3, "BDS "),
    ListItem(4, "BAMS"),
    ListItem(5, "BUMS"),
    ListItem(6, "BHMS"),
    ListItem(7, "BYNS"),
    ListItem(8, "B.V.Sc & AH"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenudegreetype;
  ListItem _selecteddegreetype;
  List<ListItem> _dropdownItemstype = [
    ListItem(1, "Enter Experience"),
    ListItem(2, "1 Year"),
    ListItem(3, "2 Years"),
    ListItem(4, "3 Years"),
    ListItem(5, "4 Years"),
    ListItem(6, "5 Years"),
    ListItem(7, "6 Years"),
    ListItem(8, "7 Years"),
    ListItem(9, "8 Years"),
    ListItem(10, "9 Years"),
    ListItem(11, "10 Years"),
    ListItem(12, "10 Years +"),
    ListItem(12, "20 Years +"),
    ListItem(12, "30 Years +"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItemstype;
  ListItem _selectedItemtype;

  @override
  void initState() {
    super.initState();
    docprofileBloc = DocProfileBloc();
    _dropdownMenudegreetype = buildDropDownMenuItems(_dropdowndegreetype);
    _selecteddegreetype = _dropdownMenudegreetype[0].value;
    _dropdownMenuItemstype = buildDropDownMenuItems1(_dropdownItemstype);
    _selectedItemtype = _dropdownMenuItemstype[0].value;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    mobilenumberController.dispose();
    licensenumberController.dispose();
    qualificationController.dispose();
    experienceController.dispose();
    addressController.dispose();
    feesController.dispose();
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
      body: SafeArea(
          child: StreamBuilder<ApiResponse<DocProfileModel>>(
        stream: docprofileBloc.docprofileStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                return Loading(
                  loadingMessage: snapshot.data.message,
                );
                break;
              case Status.COMPLETED:
                globalProfileApiModel = snapshot.data.data;
                if (!firstTimeLoad) setDataFromApi(snapshot.data.data);
                print("step1");
                //print(ApiBaseHelper.baseUrl);
                print("step2");
                print(snapshot.data.data.data.profileDetail[0].profilePic);
                return Container(
                    child: ListView(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // height: 110,
                          // width: 200,
                          margin: EdgeInsets.only(top: 40),
                          /* padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 1 / 2.8,
                              left: MediaQuery.of(context).size.width * 1 / 2.8),*/
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: imageFile == null && snapshot.data.data.data.profileDetail[0].profilePic != null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(imageBaseUrl + snapshot.data.data.data.profileDetail[0].profilePic),
                                )
                              : Container(
                                  margin: EdgeInsets.only(top: 0),
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    shape: BoxShape.circle,
                                  ),
                                  child: _buildImage(),
                                ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 105, left: 70),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(color: Colors.cyan, shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              ispicup = true;
                              _showSelectionDialog(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    ////////Profile Pic End//////////
                    //////////

                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            enabled: true,
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
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Enter Email',
                              hintStyle: TextStyle(color: Colors.grey.shade100),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
//
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            enabled: false,
                            controller: mobilenumberController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Enter Mobile Number',
                              hintStyle: TextStyle(color: Colors.grey.shade100),
//
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: _buildDOBTF(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: licensenumberController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Enter License Number',
                              hintStyle: TextStyle(color: Colors.grey.shade100),
//
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                borderSide: new BorderSide(style: BorderStyle.solid, color: Colors.cyan),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(2165), border: Border.all(color: Colors.grey)),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                  dropdownColor: Colors.white,
                                  value: _selecteddegreetype,
                                  items: _dropdownMenudegreetype,
                                  onChanged: (value) {
                                    qualification = value.toString();
                                    setState(() {
                                      _selecteddegreetype = value;
                                    });
                                  },
                                  style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:  const EdgeInsets.only(left: 20, right: 10, bottom: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(2165), border: Border.all(color: Colors.grey)),
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            value: _selectedItemtype,
                            items: _dropdownMenuItemstype,
                            onChanged: (value1) {
                              experience = value1.toString();
                              setState(() {
                                _selectedItemtype = value1;
                              });
                            },
                            style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _setImageView1(),
                          Container(
                            child: RaisedButton(
                              child: Text("Upload a Document"),
                              onPressed: () {
                                _showSelectionDialog1(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: addressController,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: 'Enter Full Address',
                            hintStyle: TextStyle(color: Colors.grey.shade100),
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.cyan),
                              borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                         height: MediaQuery.of(context).size.height*.1,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: feesController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              labelText: 'Enter Your Fees For Offline Bookings',
                              hintStyle: TextStyle(color: Colors.grey.shade100),
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.cyan),
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: onlineFeesController,
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              labelText: 'Enter Your Fees For Online Bookings',
                              hintStyle: TextStyle(color: Colors.grey.shade100),
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.cyan),
                                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                          onTap: () {
                            print("eeee " + emailController.text);
                            Profile1 todo = Profile1(nameController.text, emailController.text, mobilenumberController.text, licensenumberController.text, qualification, experience,
                                addressController.text, _date.text, feesController.text, onlineFeesController.text);
                            String _email = '${emailController.text}';
                            bool isValid = EmailValidator.validate(_email);
                            if (nameController.text == "" ||
                                emailController.text == "" ||
                                mobilenumberController.text == "" ||
                                licensenumberController.text == "" ||
                                experience == "" ||
                                experience == "" ||
                                qualification == "" ||
                                qualification == "" ||
                                addressController.text == "" ||
                                feesController.text =="" ||
                                onlineFeesController.text==""
                            ) {
                              Fluttertoast.showToast(
                                  msg: "Add required fields",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  timeInSecForIosWeb: 2);
                            } else if (isValid == false) {
                              Fluttertoast.showToast(
                                  msg: "email address is invalid",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  timeInSecForIosWeb: 2);
                            } else {
                              print("------>>>>549 ${globalProfileApiModel}");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ClinicPage(data: todo, globalProfileApiModeldata: globalProfileApiModel)));
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                            decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.all(Radius.circular(25))),
                            height: 50,
                          )),
                    ),
                  ],
                ));

                break;
              case Status.ERROR:
                return Error(
                  errorMessage: snapshot.data.message,
                );
                break;
            }
          }
          docprofileBloc.getDoctor();
          return Container();
        },
      )),
    );
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

  Future<void> setDataFromApi(DocProfileModel data) async {
    firstTimeLoad = true;
    mobilenumberController.text = data.data.profileDetail[0].mobileNumber;
    nameController.text = data.data.profileDetail[0].name;
    emailController.text = data.data.profileDetail[0].email;
    licensenumberController.text = data.data.profileDetail[0].medicalLicense;
    // qualificationController.text = data.data.profileDetail[0].qualification;
    experience = data.data.profileDetail[0].experience;
    qualification = data.data.profileDetail[0].qualification;
    addressController.text = data.data.profileDetail[0].address;
    feesController.text = data.data.profileDetail[0].doctorFee.toString();
    _date.text = data.data.profileDetail[0].dateOfBirth.toString().split(" ")[0];
    onlineFeesController.text= data.data.profileDetail[0].doctorOnlineFee.toString();
    int exeperiencePosition = 0;
    int qualificationPosition = 0;

    for (int i = 0; i < _dropdowndegreetype.length; i++) {
      if (qualification != null) if (_dropdowndegreetype[i].name.trim() == qualification.trim()) {
        qualificationPosition = i;
        print("match found");
        print(qualification);
        break;
      }
    }
    _selecteddegreetype = _dropdownMenudegreetype[qualificationPosition].value;

    /////////////
    for (int x = 0; x < _dropdownItemstype.length; x++) {
      if (_dropdownItemstype[x].name == experience) {
        exeperiencePosition = x;
        break;
      }
    }

    _selectedItemtype = _dropdownMenuItemstype[exeperiencePosition].value;
    setState(() {});

    ///////
  }

  _buildImage() {
    if (imageFile != null) {
      if (ispicup) {
        uploadFile(imageFile);
      }
      return Container(
          height: 110,
          width: 110,
          child: ClipOval(
              child: Image.file(
            imageFile,
            fit: BoxFit.cover,
          )));
    } else {
      return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/images/blank-profile-picture-973460_1280.webp'))));
    }
  }

  uploadFile(File imageFile) async {
    ispicup = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    int doctorId = prefs.getInt("user_id");
    print("userid");
    print(doctorId.toString());
    Map<String, String> headers = {"Authorization": "Bearer " + token};
    var request = http.MultipartRequest("POST", Uri.parse("https://aaizoon.in/" + "api/user/profile-photo-update"));
    //add text fields
    request.headers.addAll(headers);

    request.fields["user_id"] = doctorId.toString();
    request.fields["user_type"] = "3";
    print("request--->");
    print("path--");
    print(imageFile.path);
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
          msg: "Profile Photo Uploaded Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> _showSelectionDialog1(BuildContext context) {
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
                        _openGallery1(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera1(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void _openGallery1(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      if (imageFile1 == null)
        print("img null");
      else
        print("img not null");
      imageFile1 = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera1(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile1 = picture;
    });
    Navigator.of(context).pop();
  }

  Widget _setImageView1() {
    if (imageFile1 != null) {
      uploadFile1(imageFile1);
      return Container(height: 100, child: Image.file(imageFile1, width: 500, height: 500));
    } else {
      return Text("Please select ");
    }
  }

  _buildImage1() {
    if (imageFile1 != null) {
      uploadFile1(imageFile1);
      return Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
              child: Image.file(
            imageFile1,
            fit: BoxFit.cover,
          )));
    } else {
      return Container(
          height: 50, width: 50, decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle, image: DecorationImage(image: AssetImage('asset/blank-profile-picture-973460_1280.webp')))
          // child: Image.asset("asset/blank-profile-picture-973460_1280.webp")
          );
    }
  }

  uploadFile1(File imageFile1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    int doctorId = prefs.getInt("user_id");
    print("userid");
    print(doctorId.toString());
    Map<String, String> headers = {"Authorization": "Bearer " + token};
    var request = http.MultipartRequest("POST", Uri.parse(imageBaseUrl + "api/upload-lisence"));
    //add text fields
    request.headers.addAll(headers);

    request.fields["user_id"] = doctorId.toString();
    request.fields["user_type"] = "3";
    print("request--->");
    print("path--");
    print(imageFile1.path);
    var pic = await http.MultipartFile.fromPath("'lisence", imageFile1.path, contentType: MediaType('image', 'jpeg'));

    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: " Document Uploaded Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
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

List<DropdownMenuItem<ListItem>> buildDropDownMenuItems1(List listItems) {
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

class ListItem {
  int value;
  String name;

  @override
  String toString() {
    return name;
  }

  ListItem(this.value, this.name);
}
