import 'package:aazioondoctorapp/chat/constants.dart';
import 'package:aazioondoctorapp/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerElement extends StatelessWidget {
  final String text;
  final String svgIconPath;
  final Function callBack;
  DrawerElement(this.text,this.svgIconPath,this.callBack);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callBack.call(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: backgroundCyanLightColor,
                  border: Border.all(color: iconColor)),
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(
                svgIconPath,
                height: iconHeight,
                color: iconColor,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              text,
              style: normalBlackText,
            )
          ],
        ));

    /*ListTile(
      minLeadingWidth: 30,
      title: Text(text, style: drawerElementText),
      leading: SvgPicture.asset(icon,fit: BoxFit.fitWidth,color: primaryColor,),
    );*/
  }
}
