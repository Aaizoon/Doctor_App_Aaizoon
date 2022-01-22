import 'package:aazioondoctorapp/chat/constants.dart';
import 'package:flutter/material.dart';

// TODO: Continue investigating how to do scroll offset animation like this:
// https://dribbble.com/shots/2201752-Profile-Header-Interaction-Prototype

class CustomAppBar extends StatefulWidget {
  final String title;

  CustomAppBar({this.title});

  @override
  State<CustomAppBar> createState() {
    return new CustomAppBarState(title: title);
  }
}

class CustomAppBarState extends State<CustomAppBar> {
  final String title;
  final double barHeight = 66.0;

  CustomAppBarState({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final TextStyle titleStyle = const TextStyle(
      color: Color(0xff0D428E),
      shadows: <Shadow>[
        Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 3.0,
          color: Colors.black26,
        ),
      ],
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w800,
      fontSize: 26,
    );

    final ScaffoldState scaffold = Scaffold.maybeOf(context);

    final bool canPop = ModalRoute.of(context).canPop;
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;

    final List<Color> gradientColors = [
      backgroundCyanLightColor,
      backgroundCyanLightColor,
    ];

    final Widget backButton = new IconButton(
        icon: new Icon(Icons.arrow_back, size: 30.0, color: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        }
    );

    Widget _leading;
    Widget _ending;

    if (hasDrawer) {
      _leading = Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:BorderRadius.circular(40)
            ),
            child: Icon(
              Icons.edit,
              size: 10,
              color: Colors.white,
            ),
          ),
        ),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(
                  'assets/launcher/foreground.png'
              ),
              fit: BoxFit.cover
          ),
        ),
      );

    } else {
      if (canPop) {
        _leading = backButton;
      } else {
        _leading = null;
      }
    }

    if (hasEndDrawer) {
      _ending = new IconButton(
          icon: new Icon(Icons.forum, size: 30.0, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          }
      );
    } else {
      _ending = null;
    }

    return new Container(
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + barHeight,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: gradientColors,
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.9, 0.0),
                stops: [0.0, 0.9],
                tileMode: TileMode.clamp
            )
        ),
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Align(
                alignment: Alignment.centerLeft,
                child: new Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: _leading
                )
            ),
            new Center(child: new Text(title, style: titleStyle)),
            new Align(
                alignment: Alignment.centerRight,
                child: new Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: _ending
                )
            ),
          ],
        )
    );
  }
}