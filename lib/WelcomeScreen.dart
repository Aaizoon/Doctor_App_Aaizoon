import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:mobile_number/sim_card.dart';
import 'otp/OtpPage.dart';

class WelcomeScreen extends StatefulWidget {
  final int id;

  const WelcomeScreen(this.id);
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<WelcomeScreen> {
  String _mobileNumber = '';
  int count;
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();

    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
        print("yo");
        /*setState(() {
          print("set");
        });*/
        Future.delayed(Duration(seconds: 1), () {
          if (_mobileNumber != "") {
            count = _mobileNumber.length;
            print("yo1");
            showAlertDialog(context);
          }
        });
      } else {}
    });

    initMobileNumberState();
    Future.delayed(Duration(seconds: 1), () {
      if (_mobileNumber != "") {
        count = _mobileNumber.length;
        showAlertDialog(context);
        print(count);
      }
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget mobileNumber = Text(
      _mobileNumber.substring(count - 10),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Aaizoon"),
      content: Text("Use This Number For Login ?"),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .23, bottom: 20),
            child: InkWell(
              child: mobileNumber,
              onTap: () {
                nameController.text = _mobileNumber.substring(count - 10);
                Navigator.pop(context);
              },
            ))
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = await MobileNumber.mobileNumber;
      _simCard = await MobileNumber.getSimCards;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  bool checkBoxValue = false;
  String checkBoxValueString = "y";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 163, 187, 1),
      body: ListView(
        // physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .5,
            child: Image.asset(
              'assets/images/welcomePage.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .48,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(0)), border: Border.all(width: 3, color: Colors.white, style: BorderStyle.solid)),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .17,
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .08),
                  child: TextField(
                    autofocus: false,
                    controller: nameController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        suffix: IconButton(
                            icon: Icon(Icons.trending_flat, color: Colors.black.withOpacity(0.5)),
                            onPressed: () {
                              if (nameController.text.length != 10) {
                                invalidPhoneMsg();
                              } else {
                                proceedToVerifyPage(nameController.text, widget.id);
                              }
                            }),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(44, 163, 187, 1),
                          ),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'Enter 10 digits mobile number',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 80, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '  By Logging agree \nto Terms & Condition',
                          style: TextStyle(color: Color(0xff4b8bcc), fontSize: 14, wordSpacing: 2.2),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  invalidPhoneMsg() {
    return Fluttertoast.showToast(
        msg: "Please enter a valid mobile no.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  proceedToVerifyPage(String mobileNo, int id) {
    //final appBloc = OtpBlocMain();
    print(id);
    print(mobileNo);
    if (id != null)
      Future.delayed(Duration.zero, () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
          return OtpPage(phoneNo: mobileNo, id: id);
        }));
      });
  }
}
