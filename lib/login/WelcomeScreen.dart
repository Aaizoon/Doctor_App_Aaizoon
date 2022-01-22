/*
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/home/HomeScreen.dart';
import 'package:aazioondoctorapp/login/bloc/RegisterBloc.dart';
import 'package:aazioondoctorapp/utility/Error.dart';
import 'package:aazioondoctorapp/utility/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/RegisterResponseModel.dart';

class WelcomeScreen extends StatefulWidget {
  //final Map body;




  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<WelcomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  RegisterBloc _registerBloc;
  //Map  someMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 100,),
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30),
                    child: Image.asset(
                      'assets/images/AppIcon512.png',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,top: 40,right: 20),
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Welcome,please sign in to continue',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child:Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          suffix: StreamBuilder<ApiResponse<RegisterResponseModel>>(
                            stream: _registerBloc.registerStream,
                            builder:(context, snapshot) {
                              if(snapshot.hasData)
                              {
                                switch (snapshot.data.status) {
                                  case Status.LOADING:
                                    return Loading(
                                      loadingMessage: snapshot.data.message,
                                    );
                                    break;
                                  case Status.COMPLETED:
                                    if(snapshot.data.data.success!=null)
                                    {
                                      managedsharedpref(snapshot.data.data,nameController.text);
                                      proceedToVerifyPage(nameController.toString());
                                    }else
                                    {
                                      Fluttertoast.showToast(
                                          msg: "This number is already taken",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.black,
                                          timeInSecForIosWeb: 2);
                                      return Container();
                                    }

                                    break;
                                  case Status.ERROR:
                                    return Error(
                                      errorMessage: snapshot.data.message,
                                    );
                                    break;
                                }
                              }
                              return Arrow();
                            },


                          ),
//Arrow(),
*/
/*IconButton(
                icon: Icon(Icons.trending_flat,
                    color: Colors.white.withOpacity(0.5)),
                onPressed: ()
                {
                  if (nameController.text.length != 10)
                  {
                    invalidPhoneMsg();
                  } else {


                    Map<String, dynamic> body = {
                      "mobile_number": "+91"+nameController.text,
                      "user_type": "3",

                    };

                    _registerBloc.register(body);

                    //proceedToVerifyPage(nameController.text);
                  }
                }

                ),*/ /*

                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 1.0, color: Colors.blue),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          labelText: 'Enter 10 digits mobile number',
                          labelStyle: TextStyle(color: Colors.black,
                          )
                      ),
                    ),

                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: FlatButton(



                    onPressed: () {
                      if (phoneController.text.trim().length == 10) {
                        print("object");


                      } else {}
                    },
                    textColor: Colors.black,
                    child: Text('Trouble signing in'),

                  ),
                ),
                Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              'By continue agree to',
                              style: TextStyle(color: Color(0xff4b8bcc), fontSize: 12),
                            ),
                            FlatButton(
                              textColor: Color(0xff4b8bcc),
                              child: Text(
                                'Terms & Condition',
                                style: TextStyle(fontSize: 14),
                              ),
                              onPressed: () {
*/
/* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );*/ /*

//signup screen
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                )
              ],
            ))
    );




    ////////////////////////
  }

  invalidPhoneMsg() {
    return Fluttertoast.showToast(
        msg: "Please enter a valid mobile no.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black12,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  proceedToVerifyPage(String mobileNo,) {
    //final appBloc = OtpBlocMain();
    print(mobileNo);

    Future.delayed(Duration.zero, () async {

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        // return OtpPage(phoneNo:mobileNo);
        return HomeScreen();
      }));
    });
    */
/* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpPage(phoneNo:mobileNo))
    );*/ /*

  }

  @override
  void initState() {
    super.initState();
    _registerBloc=RegisterBloc();


  }

  // ignore: non_constant_identifier_names
  Arrow() {
    return InkWell(
      onTap: (){
        if (nameController.text.length != 10)
        {
          invalidPhoneMsg();
        } else {


          Map<String, dynamic> body = {
            "mobile_number": "+91"+nameController.text,
            "user_type": "3",

          };

          _registerBloc.register(body);
        //  proceedToVerifyPage(nameController.toString());
          //proceedToVerifyPage(nameController.text);
        }
      },
      child: Icon(Icons.arrow_forward,color: Colors.black,),
    );
  }
}
Future<void> managedsharedpref(RegisterResponseModel data, String phNo) async {
  //print(data.success.token);
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('user_id', data.success.id);
  prefs.setString("token", data.success.token);
  prefs.setString("number", phNo );
  prefs.setBool("login_app", true);
}
*/
