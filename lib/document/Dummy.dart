import 'package:flutter/material.dart';

import 'ImageShower.dart';

class DocumentList extends StatefulWidget {
  @override
  createState() {
    return new DocumentListState();
  }
}

class DocumentListState extends State<DocumentList> {
  List<ListItem> _dropdownItemstype = [
    ListItem(1, "ID-1"),
    ListItem(2, "ID-2"),
    ListItem(3, "ID-3"),
    ListItem(4, "ID-4"),
    ListItem(5, "ID-5"),
    ListItem(6, "ID-6"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItemstype;
  ListItem _selectedItemtype;
  final nameController = TextEditingController();
  final forwhomController = TextEditingController();
  final DoctornameController = TextEditingController();
  List<String> DoctorName = ["S Krishna", "Raju Meheta ", "Manish Modha", "Ajit Deol"];
  List<String> ImagePath = [
    "assets/images/sample-invoice.png",
    "assets/images/empty-medical-prescription-rx-form-with-pills-vector-21487221.jpg",
    "assets/images/008191444_1-21e3ed4c77d5e8b2062dee0016f6cb59.png",
  ];
  List<String> Date = ["02-10-2020", "03-10-2020", "04-10-2020", "05-10-2020"];
  List<String> Forwhom = [
    "Father",
    "Mother",
    "Son",
    "Daughter",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
        ),
        title: new Text(
          "Document List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.cyan,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      _showMaterialDialog();
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Add New',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'My Invoice',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: DoctorName.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(
                                    "date: ${Date[index]}",
                                    style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Name of Doctor: ${DoctorName[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'For whom: ${Forwhom[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      'Invoice:',
                                      style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Imageshower(img: ImagePath[0])),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'For Invoice Click Here',
                                          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      _showMaterialDialog();
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Add New',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'My Prescription',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: DoctorName.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(
                                    "date: ${Date[index]}",
                                    style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Name of Doctor: ${DoctorName[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'For whom: ${Forwhom[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      'Prescription:',
                                      style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Imageshower(img: ImagePath[1])),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'For Prescription Click Here',
                                          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      _showMaterialDialog();
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Add New',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'My Lab Report',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: DoctorName.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(
                                    "date: ${Date[index]}",
                                    style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Name of Doctor: ${DoctorName[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'For whom: ${Forwhom[index]}',
                                  style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      'Lab Report:',
                                      style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Imageshower(img: ImagePath[2])),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          'For Lab Report Click Here',
                                          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Please Fill up"),
              content: new Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        cursorColor: Colors.cyan,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          hintStyle: TextStyle(color: Colors.grey.shade100),
//
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: forwhomController,
                        cursorColor: Colors.cyan,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'For Whom',
                          hintStyle: TextStyle(color: Colors.grey.shade100),
//
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: DoctornameController,
                        cursorColor: Colors.cyan,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
//                                  textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Doctor Name',
                          hintStyle: TextStyle(color: Colors.grey.shade100),
//
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Booking ID'),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(2165), border: Border.all(color: Colors.grey)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: Colors.white,
                                value: _selectedItemtype,
                                items: _dropdownMenuItemstype,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedItemtype = value;
                                  });
                                },
                                style: new TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Center(
                              child: Text(
                                'Browse',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            height: 100,
                            width: MediaQuery.of(context).size.width * .2,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Submit'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  @override
  void initState() {
    _dropdownMenuItemstype = buildDropDownMenuItems(_dropdownItemstype);
    _selectedItemtype = _dropdownMenuItemstype[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
