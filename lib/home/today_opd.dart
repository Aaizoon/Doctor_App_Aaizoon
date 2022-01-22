import 'package:aazioondoctorapp/chat/constants.dart';
import 'package:aazioondoctorapp/util/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class   TodayOPDList extends StatefulWidget {
  TodayOPDList({Key key}) : super(key: key);

  @override
  _TodayOPDListState createState() {
    return _TodayOPDListState();
  }
}

class _TodayOPDListState extends State<TodayOPDList> {
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
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.only(left: width / 6,right: 10,bottom: 5,top: 5),
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
                              child: Text('Completed',style: approvedSmallText,),
                            )
                          ],
                        ),
                        Text('13 Dec,9 AM - 12 PM ',style: homePageNormalSmallBlackText,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Sneezing, Coughing',style: homePageNormalSmallBlackText,),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.blue)),
                              child: SvgPicture.asset(
                                "assets/vector/video_consultant.svg",
                                color: iconColor,
                                fit: BoxFit.fitWidth,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('10 AM',style: normalLightBlueText,),
                Expanded(
                  child: Divider(
                    indent: 20,endIndent: 20,
                    color: Colors.grey,
                    thickness: 0.5,
                    height: 0.5,
                  ),
                )
              ],
            ),
          );

          /*return Divider(
            color: Colors.red,
            thickness: 0.5,
            height: 0.5,
          );*/

        },
        itemCount: 15,
        shrinkWrap: true,

        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}
