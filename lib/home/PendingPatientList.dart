import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PendingPatientList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<PendingPatientList> {
  Color mainColor = Color(0xff48cde4);
  List<String> patientname = ["S Krishna", "Raju Meheta ", "Manish Modha", "Ajit Deol"];
  List<String> patientImagePath = [
    "assets/images/avtarman.jpg",
    "assets/images/avtarman.jpg",
    "assets/images/avtarman.jpg",
    "assets/images/avtarman.jpg",
  ];
  List<String> agePatient = [
    "Male,24 Years",
    "Male,28 Years",
    "Male,32 Years",
    "Male,39 Years",
  ];
  List<String> patientAge = [
    "+919831098310",
    "+98015987505",
    "+919831098310",
    "+94330945590",
  ];
  List<String> healthproblem = [
    "Skin Problem,Hairfall",
    "Skin Problem,Hairfall",
    "Skin Problem,Hairfall",
    "Skin Problem,Hairfall",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Container(
          color: Colors.black12,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                    child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: patientname.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        height: 130,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                patientImagePath[index],
                                width: 50,
                                height: 60,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    patientname[index],
                                    style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                                  Text(
                                    agePatient[index],
                                    style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                                  Text(
                                    patientAge[index],
                                    style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                                  Row(
                                    children: [
                                      Text(
                                        healthproblem[index],
                                        style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _profileClicked() {}
}
