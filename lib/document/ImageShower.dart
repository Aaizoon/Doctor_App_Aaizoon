import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Imageshower extends StatefulWidget {
  final String img;
  Imageshower({@required this.img});

  //final Map body;

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Imageshower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset(widget.img),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Consult Now'),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
