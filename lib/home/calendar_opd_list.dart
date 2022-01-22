import 'package:aazioondoctorapp/chat/constants.dart';
import 'package:aazioondoctorapp/util/text_style.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class CalendarOPDList extends StatefulWidget {
  CalendarOPDList({Key key}) : super(key: key);

  @override
  _CalendarOPDListState createState() {
    return _CalendarOPDListState();
  }
}

class _CalendarOPDListState extends State<CalendarOPDList> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.white,
          child: CalendarTimeline(
            initialDate: _selectedDate,
            firstDate: DateTime.utc(DateTime.now().year,0),
            lastDate: DateTime.utc(DateTime.now().year,12),
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
            leftMargin: (width / 3),
            monthColor: Colors.blue,
            dayColor: Colors.black54,
            dayNameColor: Color(0xFF333A47),
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.redAccent[100],
            dotsColor: Colors.redAccent[100],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'assets/launcher/foreground.png',
                          height: 72.0,
                          width: 72.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('Sagar Modha',style: normalBlackBoldText,),
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        color: Colors.green.shade200,
                                        border: Border.all(color: Colors.green.shade200)),
                                    child: Text('Completed',style: greenNormalText,),
                                  )
                                ],
                              ),
                              Text('Sneezing, Fever',style: homePageNormalSmallBlackText,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
            ),
          ),
        )
      ],
    );
  }
}