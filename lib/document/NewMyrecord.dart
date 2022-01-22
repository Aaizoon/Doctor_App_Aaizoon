import 'package:flutter/material.dart';

import 'SelectBookingId.dart';

class NewMyrecord extends StatefulWidget {
  @override
  _NewMyrecordState createState() => _NewMyrecordState();
}

class _NewMyrecordState extends State<NewMyrecord> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        /* appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Colors.cyan,),
    onPressed: (){
    Navigator.of(context).pop();
    },
    ),
    title: new Text("Document List",style: TextStyle(color: Colors.cyan),),
    ),*/
        body: Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            /*Card(
            elevation:10,
            child: Container(
            height: MediaQuery.of(context).size.height*.1,
            decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage("assets/logos/app.jpg"),fit: BoxFit.fitWidth
            )),

              )
          ),*/
            Expanded(
                child: ListView(
              children: [
                /*InkWell(onTap:(){
                */ /*Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => SelectBookingId(fileType: "1",)));*/ /*
              },

                child: Container(
                  height:MediaQuery.of(context).size.height*.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/logos/invoice1.png"))
                  ),
                ),
              ),*/
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectBookingId(
                              fileType: "3",
                            )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/labrecord.png"))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectBookingId(
                              fileType: "2",
                            )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/prescribtion.png"))),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
