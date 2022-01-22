import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerVC extends StatelessWidget {
  Color selectedTextColor;
  Color textColor;
  int selectedIndex;
  bool isHeader = true;
  bool isShowIcon = true;
  Widget headerWidget;
  List<DrawerMenuItem> arrDrawerItems;
  Function(int) didItemSelected;

  // ignore: sort_constructors_first
  DrawerVC({
    this.arrDrawerItems,
    this.isHeader,
    this.headerWidget,
    this.isShowIcon,
    this.textColor,
    this.selectedTextColor,
    this.didItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final DrawerNavigationProvider navigationProvider =
    Provider.of<DrawerNavigationProvider>(context, listen: false);

    return Drawer(
      child: ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: arrDrawerItems.length + 1,
        itemBuilder: (ctx, index) {
          final int idx = index - 1;
          return index == 0
              ? isHeader
              ? headerWidget ??
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              )
              : SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          )
              : GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  if (isShowIcon)
                    Container(
                        margin: const EdgeInsets.only(
                            left: 0, top: 0, right: 10, bottom: 0),
                        child: Icon(arrDrawerItems[idx].icon,
                            color: idx == selectedIndex
                                ? selectedTextColor
                                : textColor))
                  else
                    Container(),
                  Expanded(
                    child: Text(
                      arrDrawerItems[idx].title,
                      style: TextStyle(
                          color: idx == selectedIndex
                              ? selectedTextColor
                              : textColor),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          left: 10, top: 0, right: 0, bottom: 0),
                      child: arrDrawerItems[idx].subItemWidget ??
                          Container()),
                ],
              ),
            ),
            onTap: () {
              didItemSelected(idx);
              selectedIndex = idx;
              navigationProvider.setDraweNavigation(idx);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}

class DrawerMenuItem {
  String title;
  IconData icon;
  Widget subItemWidget;

  // ignore: sort_constructors_first
  DrawerMenuItem({this.title, this.icon, this.subItemWidget});
}

class DrawerNavigationProvider with ChangeNotifier {
  int selectedIndex = 0;

  void setDraweNavigation(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}