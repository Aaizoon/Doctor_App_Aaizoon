import 'package:aazioondoctorapp/chat/constants.dart';
import 'package:aazioondoctorapp/comman_widget/drawer_element.dart';
import 'package:aazioondoctorapp/home/calendar_opd_list.dart';
import 'package:aazioondoctorapp/home/post_opd_list.dart';
import 'package:aazioondoctorapp/home/today_opd.dart';
import 'package:aazioondoctorapp/home/upcoming_opd_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  // bool _onlineSwitch = false;
  ValueNotifier<bool> onlineNotifier = ValueNotifier(false);
  ValueNotifier<bool> videoConsultantNotifier = ValueNotifier(false);
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundCyanLightColor,
      body: NestedScrollView(
        physics: ClampingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              collapsedHeight: 150.0,
              pinned: false,
              floating: false,
              snap: false,
              backgroundColor: backgroundCyanLightColor,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.transparent)),
                      child: DrawerElement(
                          "Lab Reports", "assets/vector/lab_report.svg", () {}),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.transparent)),
                      child: DrawerElement("Lab Reports",
                          "assets/vector/earning_dollar.svg", () {}),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.transparent)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: backgroundCyanLightColor,
                                    border: Border.all(color: iconColor)),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: SvgPicture.asset(
                                  "assets/vector/online_available.svg",
                                  color: colorAccentSecondary,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              ValueListenableBuilder<bool>(
                                builder: (BuildContext context, value,Widget child) {
                                  return CupertinoSwitch(
                                    value: value,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      onlineNotifier.value  = value;
                                    },
                                  );
                                },
                              child: CupertinoSwitch(
                                value: onlineNotifier.value,
                                activeColor: Colors.green,
                                onChanged: (value) {
                                  onlineNotifier.value  = value;
                                },
                              ),
                                valueListenable: onlineNotifier,

                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: backgroundCyanLightColor,
                                    border: Border.all(color: iconColor)),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: SvgPicture.asset(
                                  "assets/vector/video_consultant.svg",
                                  color: colorAccent,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: videoConsultantNotifier,
                                builder: (BuildContext context, value,
                                    Widget child) {
                                  return CupertinoSwitch(
                                    value: value,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      videoConsultantNotifier.value  = value;
                                    },
                                  );
                                },
                                child: CupertinoSwitch(
                                  value: videoConsultantNotifier.value,
                                  activeColor: Colors.green,
                                  onChanged: (value) {
                                    videoConsultantNotifier.value  = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: false,
              floating: false,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  isScrollable: true,
                  onTap: (value) {
                    // print(">>>> ${value}");
                  },
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: iconColor),
                  labelColor: Colors.white,
                  controller: this._tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: iconColor, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Today"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: iconColor, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Post OPD"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: iconColor, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Upcoming OPD"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: iconColor, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Calender"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: /*TodayOPDList()*/
        TabBarView(
          children: [
            TodayOPDList(),
            PostOPDList(),
            UpcomingOPDList(),
            CalendarOPDList(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
          border: Border.all(color: Colors.white)),
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
