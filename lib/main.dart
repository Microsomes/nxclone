import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nxclone/v2/bezier/bezier.dart';
import 'package:nxclone/v2/main/bar.dart';
import 'package:nxclone/v2/main/quickOptions.dart';

import 'pages/selectticket.dart';
import 'pages/offers.dart';
import 'pages/ticketwallet.dart';

import 'package:nxclone/pages/journey/ticket.dart';

import 'package:page_transition/page_transition.dart';

import 'pages/tripTools.dart';
import 'pages/help.dart';

import './components/daysaveractive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fluttertoast/fluttertoast.dart';

  import 'pages/menuPage.dart';

class HomePagePre extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePagePre_state();
  }
}
class HomePagePre_state extends State<HomePagePre> {


    bool isUpdateNeeded=false;
    //if true a button will appear for user to download update
    String downloadUpdateLink;

 void checkForUpdateListen() {
    print("check for updates");
    PackageInfo.fromPlatform().then((packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;

      Firestore.instance.collection("updates").document("current").snapshots().listen((onValue){
         var data = onValue.data;
        var serverVersion = data['version'];
        downloadUpdateLink= data['downloadPage'];

        if (serverVersion == version) {
          //up to date
          print("up to date");

          Fluttertoast.showToast(
              msg: "Currently up to date",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.lightBlue,
              textColor: Colors.white,
              fontSize: 16.0);
              isUpdateNeeded=false;
              setState(() {
                isUpdateNeeded=false;
              });
        } else {
          //if its not up to date
          //we will redirect to download apk
          isUpdateNeeded=true;
          setState(() {
            isUpdateNeeded=true;
          });
           Fluttertoast.showToast(
              msg: "Danger. Outdated. Please click download update NOW to download the latest apk",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.lightBlue,
              textColor: Colors.white,
              fontSize: 16.0);

        }
      });

     
    });
  }

  void checkForUpdate() {
    print("check for updates");
    PackageInfo.fromPlatform().then((packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      

      Firestore.instance
          .collection("updates")
          .document("current")
          .get()
          .then((onValue) {
        var data = onValue.data;
        var serverVersion = data['version'];
        downloadUpdateLink= data['downloadPage'];

        if (serverVersion == version) {
          //up to date
          print("up to date");

          Fluttertoast.showToast(
              msg: "Currently up to date",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.lightBlue,
              textColor: Colors.white,
              fontSize: 16.0);
              isUpdateNeeded=false;
              setState(() {
                isUpdateNeeded=false;
              });
        } else {
          //if its not up to date
          //we will redirect to download apk
          isUpdateNeeded=true;
          setState(() {
            isUpdateNeeded=true;
          });
           Fluttertoast.showToast(
              msg: "Danger. Outdated. Please click download update NOW to download the latest apk",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.lightBlue,
              textColor: Colors.white,
              fontSize: 16.0);

        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hi");
    checkForUpdate();

    //check for updates here
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
            child: BarV2(),
            preferredSize: const Size.fromHeight(45)
          ),
          body: SafeArea(
              child: 
              Stack(
                children: <Widget>[
                  Expanded(
                    child: Column( 
                children: [
            Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                     Center(
                    child: Text(
                      "Pie=mx+c",
                      style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10
                    ),
                    height: 120,
                    width: 120,
                    child: Image.asset("images/mrskeleton.png",width: 200,)
                  )
                ],
              ),
              decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                 new BoxShadow(
              color: Colors.lightGreen,
              offset: new Offset(2.0, 2.0),
            )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200)
              ),

              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              child: QuickOptions(),
            )  
          ]),
                  )
                ],
              )
          
          ),
        ));
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromRGBO(0, 0, 0, 1), // navigation bar color
    statusBarColor: Color.fromRGBO(0, 0, 0, 1), // status bar color
  ));
  return runApp(HomePagePre());
}

