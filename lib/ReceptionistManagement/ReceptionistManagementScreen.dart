import 'package:flutter/material.dart';

class ReceptionistManagementScreen extends StatefulWidget {
  @override
  _ReceptionistManagementScreenState createState() => _ReceptionistManagementScreenState();
}

class _ReceptionistManagementScreenState extends State<ReceptionistManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Receptionist Management"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView(),
    );
  }
}
