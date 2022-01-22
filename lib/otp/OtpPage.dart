import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/home/HomeScreen.dart';
import 'package:aazioondoctorapp/model/RegisterApi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'bloc/OtpBloc.dart';

class OtpPage extends StatefulWidget {
  final String phoneNo;
  final int id;

  OtpPage({this.phoneNo, this.id});

  @override
  _OtpPageState createState() => _OtpPageState(phoneNo);
}

class _OtpPageState extends State<OtpPage> {
  bool onTap = false;
  OtpBloc otpBloc;
  SharedPreferences prefs;
  Map body;

  final String phoneNo;
  FirebaseAuth _auth;
  String codeVerificationId;
  String currentText = "";
  String device_id = "";

  _OtpPageState(this.phoneNo);

  @override
  void initState() {
    super.initState();
    createShrPrf();
    _auth = FirebaseAuth.instance;
    body = {"mobile_number": "+91" + phoneNo, "user_type": "3", "city_id": widget.id};
    otpBloc = OtpBloc();
    _getFirebaseUser();
    otpVerify(context);
  }

  Future<void> createShrPrf() async {
    prefs = await SharedPreferences.getInstance();
    device_id = prefs.getString('device_id');
  }

/////////////Firebase Code/////////
  TextEditingController _otpController = TextEditingController();
  User _firebaseUser;
  String _status;
  AuthCredential _phoneAuthCredential;
  String _verificationId;
  int _code;

  Future<void> _getFirebaseUser() async {
    this._firebaseUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      _status = (_firebaseUser == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
    });
  }

  void _login() {
    print("login push");
    showAlertDialog(context);
    Map body = {"mobile_number": "+91" + phoneNo, "user_type": "3", "device_id": device_id, "city_id": widget.id.toString()};

    Future.delayed(Duration(seconds: 1), () {
      otpBloc.getOtp(body);
    });
  }

  Future<void> _logout() async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
      _firebaseUser = null;
      setState(() {
        _status += 'Signed out\n';
      });
    } catch (e) {
      setState(() {
        _status += e.toString() + '\n';
      });
      print(e.toString());
    }
  }

  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    // String phoneNumber = "+91 " + _phoneNumberController.text.toString().trim();
    String phoneNumber = "+91 " + phoneNo;
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      setState(() {
        _status += 'verificationCompleted\n';
      });
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(FirebaseAuthException error) {
      print('verificationFailed');
      setState(() {
        _status += '$error\n';
        Fluttertoast.showToast(
          msg: "Invalid OTP",
          fontSize: 16,
          backgroundColor: Color.fromRGBO(1, 185, 255, 1),
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 2,
        );
      });
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      print(code.toString());
      setState(() {
        _status += 'Code Sent\n';
      });
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      setState(() {
        _status += 'codeAutoRetrievalTimeout\n';
      });
      print(verificationId);
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }

  void _submitOTP() {
    /// get the `smsCode` from the user
    onTap = true;
    setState(() {});
    String smsCode = _otpController.text.toString().trim();

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    this._phoneAuthCredential = PhoneAuthProvider.getCredential(verificationId: this._verificationId, smsCode: smsCode);

    // _login();
  }

  Future<void> otpVerify(BuildContext context) async {
    print("0000");

    _auth.verifyPhoneNumber(
        phoneNumber: "+91${phoneNo}",
        timeout: Duration(seconds: 120),
        verificationCompleted: (AuthCredential credential) async {
          User user = (await _auth.signInWithCredential(credential)).user;
          if (user != null) {
            print("login success via firebase otp auto");
            _login();
            Fluttertoast.showToast(msg: "OTP successfully verified", fontSize: 16, backgroundColor: Color.fromRGBO(1, 185, 255, 1), textColor: Colors.white, toastLength: Toast.LENGTH_LONG);
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(" $exception");
          print("Please Enter a Correct and New Phone Number");
          Fluttertoast.showToast(
              msg: "Please Enter a Correct and New Phone Number", fontSize: 16, backgroundColor: Color.fromRGBO(1, 185, 255, 1), textColor: Colors.white, toastLength: Toast.LENGTH_LONG);
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          // otpSentCheck = false;
          final code = currentText.trim();
          codeVerificationId = verificationId;
          try {
            AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
            User user = (await _auth.signInWithCredential(credential)).user;

            if (user != null) {
              print("successfully verify manually");
              _login();
              Fluttertoast.showToast(msg: "OTP successfully verified", fontSize: 16, backgroundColor: Color.fromRGBO(1, 185, 255, 1), textColor: Colors.white, toastLength: Toast.LENGTH_LONG);
            } else {
              print("Error");
            }
          } catch (PlatformException) {
            print("keno dibi ex $PlatformException");
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        });
  }

  otpVerification() async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: codeVerificationId, smsCode: currentText);
      User user = (await _auth.signInWithCredential(credential)).user;

      if (user != null) {
        print("successfully verify manually");
        _login();
      } else {
        print("Error");
      }
    } catch (PlatformException) {
      print("$PlatformException");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 163, 187, 1),
      body: SingleChildScrollView(
        primary: true,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: ListView(shrinkWrap: true,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .52,
              padding: EdgeInsets.only(top: 30, left: 0, right: 0),
              child: Image.asset(
                'assets/images/otpPage.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .5,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(0)), border: Border.all(width: 3, color: Colors.white, style: BorderStyle.solid)),
              height: MediaQuery.of(context).size.height * .59,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .17),
                    child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 50,
                      fieldStyle: FieldStyle.box,
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * .06, color: Colors.black, fontWeight: FontWeight.bold),
                      obscureText: true,
                      onChanged: (value) {

                      },
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                        _otpController.text = pin;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.bottomCenter,
                    child: StreamBuilder<ApiResponse<RegisterApi>>(
                      stream: otpBloc.registerStream,
                      builder: (context, snapshot) {
                        ///////////
                        if (snapshot.hasData) {
                          switch (snapshot.data.status) {
                            case Status.LOADING:
                              // showAlertDialog(context);
                              break;
                            case Status.COMPLETED:
                              loginPref();
                              saveUserId(snapshot.data.data);
                              prefs.setBool('login_app', true);
                              prefs.setString('noti_num', "0");
                              Future.delayed(Duration.zero, () async {
                                Navigator.pop(context);
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()), (Route<dynamic> route) => false);
                              });
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                              break;
                            case Status.ERROR:
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "The mobile number has already been taken. It's used in some other Aaizoon application may be in Patient App or Gnm App",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.red,
                                  textColor: Color.fromRGBO(1, 185, 255, 1),
                                  timeInSecForIosWeb: 5);

                              break;
                          }
                        }
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0), side: BorderSide(color: onTap == false ? Color.fromRGBO(44, 163, 187, 1) : Colors.grey)),
                              onPressed: () {
                                // otpVerify(context);
                                currentText = _otpController.text.trim();
                                otpVerification();
                                // setState(() {
                                // });
                              },
                              child: Text('Submit'),
                              textColor: Colors.white,
                              color: onTap == false ? Colors.cyan.shade600 : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

  Future<void> saveUserId(RegisterApi data) async {
    // SharedPreferences preferences =
    // await SharedPreferences.getInstance();

    prefs.setString("token", data.success.token);
    prefs.setInt("user_id", data.success.id);
    prefs.setString("phoneNo", phoneNo);
  }

  Future<void> loginPref() async {
    prefs.setBool('login_app', true);
  }
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
          ),
        ],
      ),
    );
  }
}
