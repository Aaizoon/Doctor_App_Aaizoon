import 'package:aazioondoctorapp/Lab/repository/LabListRepository.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LabTestListPage.dart';
import 'model/LabModel.dart';

class Lab1 extends StatefulWidget {
  @override
  _Lab1State createState() => _Lab1State();
}

class _Lab1State extends State<Lab1> {
  var valc = false;
  var value;
  var value1;
  LabListRepository _labListRepository;
  Future<GetLabListModel> Labdata;

  @override
  void initState() {
    super.initState();
    _labListRepository = LabListRepository();
    Labdata = _labListRepository.getLabList();
  }

  Widget buildBottomSheet(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {

    TextStyle normalText= TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.width*.035,);
    Color mainColor = Color(0xFF48cde4);
    AppBar appBar = AppBar(
      backgroundColor: mainColor,
      title: Text(
        "Select Lab",
        style: TextStyle(color: Colors.white),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Lab Names",style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: FutureBuilder<GetLabListModel>(
                future: Labdata,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.labs.data.length,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            labId=snapshot.data.labs.data[index].labId.toString();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Lab2(snapshot.data.labs.data[index].labId.toString(),snapshot.data.labs.data[index].labName,snapshot.data.labs.data[index].labAddress,snapshot.data.labs.data[index].labEmail)),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(snapshot.data.labs.data[index].labName, ),
                                          Text("${snapshot.data.labs.data[index].labEmail}" ?? '', style: normalText),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on,size: MediaQuery.of(context).size. width*.042,),
                                              Flexible(child:Text("  ${snapshot.data.labs.data[index].labAddress}" ?? '', style: normalText)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " 4.2 ★ ",
                                    style: TextStyle(color: Colors.white, backgroundColor: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
              )),
        ],
      ),
    );
  }
}
