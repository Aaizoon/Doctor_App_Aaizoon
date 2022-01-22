import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:aazioondoctorapp/incomehistory/bloc/getInClinicEarnings.dart';
import 'package:flutter/material.dart';
import 'package:aazioondoctorapp/incomehistory/model/getIncomeOfflineResponseModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InClinicIncome extends StatefulWidget {
  @override
  _InClinicIncomeState createState() => _InClinicIncomeState();
}

class _InClinicIncomeState extends State<InClinicIncome> {
  GetInClinicEarningsBloc _clinicEarningsBloc;
  bool tap=false;
  var pData=[];
  String month="";
  String year="";
  String totalEarning="";
  GetIncomeOfflineResponseModel apiModel;
  List<ListItem> _dropdownItemsMonths = [
    ListItem(1, "Select Month"),
    ListItem(2, "01"),
    ListItem(3, "02"),
    ListItem(4, "03"),
    ListItem(5, "04"),
    ListItem(6, "05"),
    ListItem(7, "06"),
    ListItem(8, "07"),
    ListItem(9, "08"),
    ListItem(10, "09"),
    ListItem(11, "10"),
    ListItem(12, "11"),
    ListItem(13, "12"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItemsMonths;
  ListItem _selectedItemMonths;
  
  List<ListItem> _dropdownItemsYear = [
    ListItem(1, "Select Year"),
    ListItem(2, "2021"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItemsYear;
  ListItem _selectedItemYear;

  @override
  void initState() {
    super.initState();
    _clinicEarningsBloc=GetInClinicEarningsBloc();
    _dropdownMenuItemsMonths = buildDropDownMenuItems(_dropdownItemsMonths);
    _selectedItemMonths = _dropdownMenuItemsMonths[0].value;
    _dropdownMenuItemsYear = buildDropDownMenuItems(_dropdownItemsYear);
    _selectedItemYear = _dropdownMenuItemsYear[0].value;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5,right: 5,top:10,bottom: 10),
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(2165), border: Border.all(color: Colors.grey)),
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    value: _selectedItemMonths,
                    items: _dropdownMenuItemsMonths,
                    onChanged: (value1) {
                      setState(() {
                        _selectedItemMonths = value1;
                        print(_selectedItemMonths.name);
                        month=_selectedItemMonths.name;
                      });
                    },
                    style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container
              (
              margin: EdgeInsets.only(left: 5,right: 5,top:10,bottom: 10),
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Color(2165), border: Border.all(color: Colors.grey)),
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,),
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    value: _selectedItemYear,
                    items: _dropdownMenuItemsYear,
                    onChanged: (value1) {
                      setState(() {
                        _selectedItemYear = value1;
                        year=_selectedItemYear.name;
                      });
                    },
                    style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 10,right: 5),
              child: RaisedButton(onPressed:() async {
                tap=true;

                SharedPreferences prefs = await SharedPreferences.getInstance();
                int doctorId = prefs.getInt("user_id");
                Map body={

                  "doctor_id":doctorId.toString(),
                  "requested_year":year,
                  "requested_month":month
                };
                _clinicEarningsBloc.getEarnings(body);
              }, child: Text("Get Details",style: TextStyle(color: Colors.black),),
              color: Colors.white,),
            )
          ],
        ),
        StreamBuilder<ApiResponse<GetIncomeOfflineResponseModel>>(
            stream: _clinicEarningsBloc.getStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.LOADING:
                    return Center(child: CircularProgressIndicator());
                    break;
                  case Status.COMPLETED:
                    apiModel= snapshot.data.data;
                    totalEarning=snapshot.data.data.data.totalEarning;
                    Future.delayed(Duration(seconds: 1), () async {
                      setState(() {

                      });
                    });
                    break;
                  case Status.ERROR:
                    print(snapshot.error);
                    Future.delayed(Duration.zero, () async {
                      Fluttertoast.showToast(
                          msg: "Please Try Again After Some Time",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          timeInSecForIosWeb: 2);
                    });
                    break;
                }
              }
              return Container();
            }),
        tap==true?Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 10,right: 10,bottom: 20),
          child:Text(" Your Earnings(In-clinic): $totalEarning  ",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))
        ):Container(),
        tap==true?ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: apiModel.data.appointmentList.data.length,
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
                        "assets/images/profile.png",
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
                            apiModel.data.appointmentList.data[index].bookingFullName,
                            style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                          Text(
                            apiModel.data.appointmentList.data[index].apptmtDate.toString().substring(0,9),

                            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                          Text(
                            apiModel.data.appointmentList.data[index].bookingMobile,
                            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                          Row(
                            children: [
                              Text(
                                (" Your Fees ${apiModel.data.appointmentList.data[index].doctorFee}"),
                                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
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
        ):Container(),

      ],
    );
  }
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Loading"),
            )
          ],
        ));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
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
class ListItem {
  int value;
  String name;

  @override
  String toString() {
    return name;
  }

  ListItem(this.value, this.name);
}