import 'package:aazioondoctorapp/WelcomeScreen.dart';
import 'package:aazioondoctorapp/home/HomeScreen.dart';
import 'package:aazioondoctorapp/home/custom_drawer.dart';
import 'package:aazioondoctorapp/util/drawer_vc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'city/cityPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var loginstate = prefs.getBool('login_app');
  initializeDateFormatting('en_US', null);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DrawerNavigationProvider(),
        )
      ],
      child: MaterialApp(
        home: loginstate == null ? MyApp() : CustomDrawer(),
        title: 'Aaizoon',
        supportedLocales: [
          const Locale('en', 'US')
        ],
        debugShowCheckedModeBanner: false,
      )));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() async {
    var tokenFirebase = "";
    _firebaseMessaging.getToken().then((token) async {
      tokenFirebase = token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("device_id", tokenFirebase);
      print("sf");
      String device_id = prefs.getString("device_id");
      print(device_id);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
        return CityPage();
      }));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _register();
    getMessage();
  }

  void getMessage() {
    _firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');

      setState(() => _message = message["notification"]["title"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );*/
    return Scaffold();
  }
}

/*
class MyApp extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}*/
