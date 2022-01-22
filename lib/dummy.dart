// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
//
// class OtpCheck extends StatefulWidget {
//   OtpCheck({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _OtpCheckState createState() => _OtpCheckState();
// }
//
// class _OtpCheckState extends State<OtpCheck> {
//   TextEditingController otp= TextEditingController();
//   String pin;
//
//   @override
//   void initState() {
//     super.initState();
//     pin="444444";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.cyan,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.3),
//             padding: EdgeInsets.only(left: 30,right: MediaQuery.of(context).size.width*.5),
//             child: Icon(Icons.phone_android_sharp,color: Colors.white,size: MediaQuery.of(context).size.height*.12,),
//           ),
//           Padding(
//
//             padding: EdgeInsets.only(left: 30,right: MediaQuery.of(context).size.width*.3,top: MediaQuery.of(context).size.height*.03),
//             child: Text("Please Enter",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*.07,fontWeight: FontWeight.bold),),
//
//           ),
//           Padding(
//
//             padding: EdgeInsets.only(left: 30,right: MediaQuery.of(context).size.width*.2,top: MediaQuery.of(context).size.height*.01,bottom: 20),
//             child: Text("The Validation Code That\n Get From Sms",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*.05),),
//
//           ),
//
//           Center(
//             child: OTPTextField(
//               length: 5,
//               width: MediaQuery.of(context).size.width,
//               textFieldAlignment: MainAxisAlignment.spaceAround,
//               fieldWidth: 50,
//               fieldStyle: FieldStyle.box,
//               style: TextStyle(
//                   fontSize:  MediaQuery.of(context).size.width*.06 ,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold
//               ),
//               obscureText: true,
//               onCompleted: (pin) {
//                 print("Completed: " + pin);
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: StreamBuilder<ApiResponse<RegisterApi>>(
//               stream: otpBloc.registerStream,
//               builder: (context, snapshot) {
//                 ///////////
//                 if (snapshot.hasData) {
//                   switch (snapshot.data.status) {
//                     case Status.LOADING:
//                       return Loading(loadingMessage: snapshot.data.message);
//                       break;
//                     case Status.COMPLETED:
//                       loginPref();
//                       saveUserId(snapshot.data.data);
//                       prefs.setBool('login_app', true);
//                       print("notification");
//                       prefs.setString('noti_num', "0");
//                       print(prefs.getString("noti_num"));
//                       Future.delayed(Duration.zero, () async {
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
//                           return HomeScreen();
//                         }));
//                       });
//                       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
//                       break;
//                     case Status.ERROR:
//                       Fluttertoast.showToast(
//                           msg: "The mobile number has already been taken. It's used in some other Aaizoon application may be in Patient App or Gnm App",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.CENTER,
//                           backgroundColor: Colors.red,
//                           textColor: Colors.white,
//                           timeInSecForIosWeb: 2);
//
//                       break;
//                   }
//                 }
//                 return Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Container(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     child: RaisedButton(
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0), side: BorderSide(color: onTap == false ? Colors.cyan : Colors.grey)),
//                       onPressed: () {
//                         // otpVerify(context);
//                         currentText = _otpController.text.trim();
//                         otpVerification();
//                         // setState(() {
//                         // });
//                       },
//                       child: Text('Submit'),
//                       textColor: Colors.white,
//                       color: onTap == false ? Colors.cyan : Colors.grey,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
