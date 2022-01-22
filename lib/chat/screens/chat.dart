import 'dart:async';
import 'dart:io';
import 'package:aazioondoctorapp/home/HomeScreen.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/appointmentClosingPage.dart';
import 'package:aazioondoctorapp/onlinePatientBookings/todo.dart';
import 'package:aazioondoctorapp/videochat/callPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Constant.dart';
import '../chatWidget.dart';
import '../constants.dart';

class Chat extends StatelessWidget {
  final String peerId;
  final String peerAvatar;
  final String peerName;
  final String currentUserId;
  String groupChatId;
  final ScrollController listScrollController = new ScrollController();
  static const String id = "chat";
  Chat({Key key, @required this.currentUserId, @required this.peerId, @required this.peerAvatar, @required this.peerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        title: Text(peerName),
        backgroundColor: themeColor,
      ),
      body: new _ChatScreen(
        currentUserId: currentUserId,
        peerId: peerId,
        peerAvatar: peerAvatar!=""?peerAvatar:"",
      ),
    );
  }
}

class _ChatScreen extends StatefulWidget {
  final String peerId;
  final String peerAvatar;
  final String currentUserId;

  _ChatScreen({Key key, @required this.peerId, @required this.peerAvatar, @required this.currentUserId}) : super(key: key);

  @override
  State createState() => new _ChatScreenState(peerId: peerId, peerAvatar: peerAvatar);
}

class _ChatScreenState extends State<_ChatScreen> {
  _ChatScreenState({Key key, @required this.peerId, @required this.peerAvatar});

  String peerId;
  String peerAvatar;
  String id;

  var listMessage;
  String groupChatId;

  File imageFile;
  bool isLoading;
  bool isShowSticker;
  String imageUrl;
  final PermissionHandler _permissionHandler = PermissionHandler();
  Future<void> onJoin() async {
    await _permissionHandler.requestPermissions([PermissionGroup.camera, PermissionGroup.microphone]);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(channelName: channelName),
        ));
    print(appID);
  }

  final TextEditingController textEditingController = new TextEditingController();
  final ScrollController listScrollController = new ScrollController();
  final FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);

    groupChatId = '';

    isLoading = false;
    isShowSticker = false;
    imageUrl = '';

    readLocal();
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        isShowSticker = false;
      });
    }
  }

  readLocal() async {
    id = widget.currentUserId ?? '';
    if (id.hashCode <= peerId.hashCode) {
      groupChatId = '$id-$peerId';
    } else {
      groupChatId = '$peerId-$id';
    }

    FirebaseFirestore.instance.collection('users').doc(id).update({'chattingWith': peerId});

    setState(() {});
  }

  Future getImage(int index) async {
    imageFile = index == 0 ? await ImagePicker.pickImage(source: ImageSource.gallery) : await ImagePicker.pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      setState(() {
        isLoading = true;
      });
      uploadFile();
    }
  }

  Future uploadFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);

    File compressedFile = await FlutterNativeImage.compressImage(imageFile.path, quality: 80, percentage: 90);

    StorageUploadTask uploadTask = reference.putFile(compressedFile);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
      imageUrl = downloadUrl;
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, 1);
      });
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: 'This file is not an image');
    });
  }

  void onSendMessage(String content, int type) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      textEditingController.clear();

      var documentReference = FirebaseFirestore.instance.collection('messages').doc(groupChatId).collection(groupChatId).doc(DateTime.now().millisecondsSinceEpoch.toString());

      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {'idFrom': id, 'idTo': peerId, 'timestamp': DateTime.now().millisecondsSinceEpoch.toString(), 'content': content, 'type': type},
        );
      });
      listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

  Future<bool> onBackPress() {
    Navigator.pop(context);
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // List of messages
              ChatWidget.widgetChatBuildListMessage(groupChatId, listMessage, widget.currentUserId, peerAvatar, listScrollController),

              // Input content
              buildInput(),
            ],
          ),

          // Loading
          buildLoading()
        ],
      ),
      onWillPop: onBackPress,
    );
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(themeColor)),
              ),
              color: Colors.white.withOpacity(0.8),
            )
          : Container(),
    );
  }

  Widget buildInput() {
    return Container(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              // Button send image
              Material(
                child: new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 1.0),
                  child: new IconButton(
                    icon: new Icon(Icons.image),
                    onPressed: () => getImage(0),
                    color: primaryColor,
                  ),
                ),
                color: Colors.white,
              ),
              Material(
                child: new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 1.0),
                  child: new IconButton(
                    icon: new Icon(Icons.camera_alt),
                    onPressed: () => getImage(1),
                    color: primaryColor,
                  ),
                ),
                color: Colors.white,
              ),
              Material(
                child: new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 1.0),
                  child: new IconButton(
                    icon: new Icon(Icons.video_call),
                    onPressed: () {
                      onSendMessage("You Initiated A Video Chat...", 0);
                      onJoin();
                    },
                    color: primaryColor,
                  ),
                ),
                color: Colors.white,
              ),

              // Edit text
              Flexible(
                child: Container(
                  child: TextField(
                    style: TextStyle(color: primaryColor, fontSize: 15.0),
                    controller: textEditingController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: greyColor),
                    ),
                    focusNode: focusNode,
                  ),
                ),
              ),

              // Button send message
              Material(
                child: new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 8.0),
                  child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => onSendMessage(textEditingController.text, 0),
                    color: primaryColor,
                  ),
                ),
                color: Colors.white,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              // showAlertDialog(context);
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Aaizoon"),
                      content: Text("Are You Sure?"),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10, right: 10),
                          child: InkWell(
                              onTap: () {
                                print("hiiii");
                                Navigator.pop(context);
                                onSendMessage("You Closed The Appointment...", 0);
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AppointmentClosingPage(isEnd:"0")), (Route<dynamic> route) => false);
                              },
                              child: Text("Yes")),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10, right: 10),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text("No")),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  });
            },
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: Colors.cyan),
              child: Text(
                "Leave chat and proceed to next step",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .03),
              ),
            ),
          )
        ],
      ),
      width: double.infinity,
      height: 115.0,
      decoration: new BoxDecoration(border: new Border(top: new BorderSide(color: greyColor2, width: 0.5)), color: Colors.white),
    );
  }

  static showAlertDialog(BuildContext context) {
    // set up the buttons

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Aaizoon"),
      content: Text("Are You Sure?"),
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: 10, right: 10),
          child: InkWell(
              onTap: () {
                print("hiiii");
                //
              },
              child: Text("Yes")),
        ),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, right: 10),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("No")),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
