import 'package:flutter/material.dart';

import 'chatData.dart';
import 'chatWidget.dart';

class ChatScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    ChatData.init("    ChatPot", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ChatWidget.getAppBar(), backgroundColor: Colors.white, body: ChatWidget.widgetWelcomeScreen(context));
  }
}
