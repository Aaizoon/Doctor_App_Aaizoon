import 'package:aazioondoctorapp/chat/constants.dart';
import 'package:aazioondoctorapp/home/custom_app_bar.dart';
import 'package:aazioondoctorapp/home/dashboard_screen.dart';
import 'package:aazioondoctorapp/profile/ProfilePage.dart';
import 'package:aazioondoctorapp/util/drawer_vc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() {
    return _CustomDrawerState();
  }
}

class _CustomDrawerState extends State<CustomDrawer> {
  final arrDrawerItems = [
    DrawerMenuItem(
        title: 'Clinic',
        icon: Icons.local_hospital_outlined,
        subItemWidget: null),
    DrawerMenuItem(
      title: 'Profile',
      icon: Icons.exit_to_app,
      subItemWidget: null,
    ),
  ];

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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    iconHeight = ( MediaQuery.of(context).size.height * 0.05   ) ;
    iconWidth = ( MediaQuery.of(context).size.width * 0.03 ) ;

    return Scaffold(
      drawer: DrawerVC(
        arrDrawerItems: arrDrawerItems,
        headerWidget: _buildHeaderForDrawer(context),
        isHeader: true,
        isShowIcon: true,
        textColor: Colors.grey.shade600,
        selectedTextColor: themeColor.withAlpha(250),
        didItemSelected: (int selectedIndex) {},
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(title: 'aaizoon',)
      ),
      body: Center(
        child: Consumer<DrawerNavigationProvider>(
          builder: (ctx, item, child) {
            if (item.selectedIndex == 0) {
              return DashboardScreen();
              // return ProfilePage();
            } else if (item.selectedIndex == 1) {
              return ProfilePage();
            } else {
              return null;
            }
          },
        ) ??
            const Text('No data'),
      ),
    );
  }

  Widget _buildHeaderForDrawer(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/launcher/foreground.png',
              height: 72.0,
              width: 72.0,
            ),
            const SizedBox(height: 12),
            const Text(
              'Aaizoon',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
    );
  }
}
