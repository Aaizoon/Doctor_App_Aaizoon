import 'package:aazioondoctorapp/city/repository/getCityRepoSitory.dart';
import 'package:aazioondoctorapp/help/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../WelcomeScreen.dart';
import 'bloc/saveCityBloc.dart';
import 'model/SaveCityResponseModel.dart';
import 'model/getCityResponseModel.dart';

class CityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

const Color textColor = Color(0xFF616161);

class _State extends State<CityPage> {
  TextEditingController cityNmeController = TextEditingController();
  TextEditingController addCityNmeController = TextEditingController();
  GetCityRepository _getCityRepository;
  Future<GetCityResponseModel> getCity;
  SaveCityBloc _saveCityBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/city _1.png"),
                    fit: BoxFit.fill)),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
                  child: Text(
                    "Please Select Your City",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                    onChanged: (text) {
                      Map body = {
                        "search_text": cityNmeController.text.toString(),
                      };
                      getCity = _getCityRepository.getCityUpdate(body);
                      setState(() {});
                    },
                    enableSuggestions: true,
                    controller: cityNmeController,
                    cursorColor: textColor,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0, color: Colors.black),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      hintText: 'Search Your City',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff000000)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 50),
                  child: FutureBuilder<GetCityResponseModel>(
                      future: getCity,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.data.data.length,
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => WelcomeScreen(snapshot.data.data.data[index].id)),
                                      );
                                      print(snapshot.data.data.data[index].name);
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          left: 20,
                                          top: 8,
                                        ),
                                        child: Text(
                                          snapshot.data.data.data[index].name ?? "",
                                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  );
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                    onTap: () {
                                      _modalBottomSheetMenu();
                                    },
                                    child: Text(
                                      "Couldn't Find Your City... \n Then Please Click Here ToAdd Your City...",
                                      style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                    )),
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("No City Found", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
              ],
            )));
  }

  @override
  void initState() {
    super.initState();
    _getCityRepository = GetCityRepository();
    _saveCityBloc = SaveCityBloc();

    Map body = {
      "search_text": cityNmeController.text.toString(),
    };
    getCity = _getCityRepository.getCityUpdate(body);
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Colors.white,
        builder: (builder) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            primary: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30.0, right: 10),
                  child: Text(
                    "Please Help Us To Expand Our Network",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: TextField(
                    // autofocus: true,
                    enableSuggestions: true,
                    controller: addCityNmeController,
                    cursorColor: textColor,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(width: 2.0, color: Colors.cyan),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      hintText: 'Add Your City',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff000000)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

                    // height: 70,
                    child: FlatButton(
                        onPressed: () async {
                          Map body = {"city_name": addCityNmeController.text.toString()};
                          _saveCityBloc.saveCity(body);
                        },
                        child: StreamBuilder<ApiResponse<SaveCityResponseModel>>(
                            stream: _saveCityBloc.getStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                switch (snapshot.data.status) {
                                  case Status.LOADING:
                                    return Container(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                                      ),
                                    );

                                    break;
                                  case Status.COMPLETED:
                                    Future.delayed(Duration.zero, () async {
                                      print("city: " + snapshot.data.data.data.name.toString());
                                      print("id: " + snapshot.data.data.data.id.toString());
                                      //SnackFunction(context);
                                      Fluttertoast.showToast(
                                          msg: "City Added Successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor: Colors.cyan,
                                          textColor: Colors.white,
                                          timeInSecForIosWeb: 5);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => WelcomeScreen(snapshot.data.data.data.id)),
                                      );
                                    });
                                    break;
                                  case Status.ERROR:
                                    Future.delayed(Duration.zero, () async {
                                      Fluttertoast.showToast(
                                          msg: snapshot.data.message,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          timeInSecForIosWeb: 2);
                                    });
                                    break;
                                }
                              }
                              return Text(
                                "Add",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                              );
                            })))
              ],
            ),
          );
        });
  }
}
