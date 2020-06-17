import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "NX-CLONE",
              style: TextStyle(
                  color: Color.fromRGBO(107, 107, 107, 1), fontSize: 22),
            ),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(105, 128, 207, 1),
                      borderRadius: BorderRadius.circular(29)),
                  width: 120,
                  height: 10,
                  child: Center(
                    child: Text(
                      "By Microsomes",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(235, 235, 235, 1)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          body: SafeArea(
              child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "NXBUS CLONE",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "This app clones the original app so that you can get free travel across west midlands via all national express busses.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Firstly to use the app you must click on the daysaver on the next page and it should take you to the ticket page. Just show the ticket to the bus driver and you should be able to gain access to the bus.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "PRECAUTION",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "In order to not get caught its advised to have the legit app loaded with 1 spare daysaver just in case you see an inspector board the bus. Its highly likely the inspector may verifiy the ticket or notice details that the bus drivers do not.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Stay safe and please report any insidents you have had below. We will update the app when the real app updates. Please check this page from time to time to see if you have the latest update.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                isUpdateNeeded==false ?  "STATUS: UP TO DATE": "Danger: Outdated",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "V 1.1.0 ALPHA",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Builder(builder: (context)=>Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.lightBlue,
                    child: Text(
                      "Go to nxbus",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print("go to nxbus");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

                    },
                  )),
            ),),
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.lightBlue,
                    child: Text(
                      "Check for updates",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                       
                        checkForUpdate();
                    },
                  )),
            ),
           isUpdateNeeded==true ? Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.lightBlue,
                    child: Text(
                      "Download update NOW",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      //go to the download page
                      launch(downloadUpdateLink);
                    },
                  )),
            ): Text("no update required"),
          ])),
        ));
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromRGBO(169, 27, 26, 1), // navigation bar color
    statusBarColor: Color.fromRGBO(169, 27, 26, 1), // status bar color
  ));
  return runApp(HomePagePre());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var lins = 1;

  double heightOf = 60;

  double spaceApart = 20;

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            title: Center(
                child: Image.asset(
              "images/logo.png",
              width: 200,
            )),
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 5,
                      width: 26,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(170, 26, 26, 1),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 5,
                      width: 26,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(170, 26, 26, 1),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 5,
                      width: 26,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(170, 26, 26, 1),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
                onPressed: () {
                  print("open menu");
                  exit(1);


              //    Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuPage()));

                  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: MenuPage()));

                },
              )
            ],
          ),
        ),
        body: Container(
          height: 1000,
          width: double.infinity,
          color: Color.fromRGBO(169, 27, 26, 1),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectTicket()),
                  );
                },
                focusColor: Colors.red,
                highlightColor: Colors.pink,
                child: Container(
                  width: 380,
                  height: heightOf,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(215, 216, 218, 1),
                            offset: new Offset(0, 3))
                      ]),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "images/busicon.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Buy ticket",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Image.asset("images/rightarrow.png", width: 35),
                    SizedBox(
                      width: 4,
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: spaceApart,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Offers()),
                  );
                },
                child: Container(
                  width: 380,
                  height: heightOf,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(215, 216, 218, 1),
                            offset: new Offset(0, 3))
                      ]),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "images/offers.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Offers",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Image.asset("images/rightarrow.png", width: 35),
                    SizedBox(
                      width: 4,
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: spaceApart,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ticketwallet()),
                  );
                },
                child: Container(
                  width: 380,
                  height: heightOf,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(215, 216, 218, 1),
                            offset: new Offset(0, 3))
                      ]),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "images/wallet.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Ticket wallet",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Image.asset("images/rightarrow.png", width: 35),
                    SizedBox(
                      width: 4,
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 186,
                width: sizeW * 0.96,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(123, 26, 17, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: sizeW * 0.9,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: InkWell(
                          onTap: (){
                            print("go to ticket");

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Ticket()));

                          },
                          child: ticketTwo())
                        //ticketone(sizeW: sizeW),
                        ),
                    Expanded(
                      child: Text(""),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          alignment: Alignment.bottomRight,
                          width: sizeW,
                          height: 16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "MORE TICKETS",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "images/rightwhite.png",
                                width: 15,
                              ),
                              SizedBox(
                                width: 12,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: spaceApart,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Triptools()),
                  );
                },
                child: Container(
                  width: 380,
                  height: heightOf,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(215, 216, 218, 1),
                            offset: new Offset(0, 3))
                      ]),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "images/triptool.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Trip tools",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Image.asset("images/rightarrow.png", width: 35),
                    SizedBox(
                      width: 4,
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: spaceApart,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Help()),
                  );
                },
                child: Container(
                  width: 380,
                  height: heightOf,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(215, 216, 218, 1),
                            offset: new Offset(0, 3))
                      ]),
                  child: Row(children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "images/ottom.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Help",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Image.asset("images/rightarrow.png", width: 35),
                    SizedBox(
                      width: 4,
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: spaceApart,
              ),
            ],
          ),
        ));
  }
}

class ticketone extends StatelessWidget {
  const ticketone({
    Key key,
    @required this.sizeW,
  }) : super(key: key);

  final double sizeW;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "West Midlands",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(
                    "Single Journey",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  )
                ],
              ),
            ),
            Expanded(
              child: Text(""),
            ),
            Text(
              "INACTIVE",
              style: TextStyle(
                  color: Color.fromRGBO(211, 211, 211, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        Container(
          width: sizeW * 0.7,
          height: 2,
          color: Color.fromRGBO(211, 211, 211, 0.6),
        ),
        Expanded(
          child: Text(""),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Expires in 6 days, 7 hours",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
