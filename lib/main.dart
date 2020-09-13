import 'package:BlackPie/v2/pages/setupflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:BlackPie/v2/main/quickOptions.dart';
import 'package:BlackPie/v2/pages/nxfront.dart';
import 'package:BlackPie/v2/pages/ticketv2.dart';
import 'dart:async';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePagePre extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagePrestate();
  }
}

class HomePagePrestate extends State<HomePagePre>
    with SingleTickerProviderStateMixin {
  bool isShowing = false;
  double maxHeight;
  double containerHeight;

  var idO;

  double skeletonOpacity = 0;

  double sizeOfBottomBar = 0;

  Timer mainTimer;

  var nxhometop2 = 200;

  @override
  void dispose() {
    super.dispose();
    mainTimer.cancel();
  }

  @override
  void initState() {
    super.initState();

    NXHelp().runInit();
    //run the init process

    mainTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        skeletonOpacity = 1;
        sizeOfBottomBar = 0.36;
        nxhometop2 = 5;
      });
      mainTimer.cancel();
    });

    NXHelp().buyAndActivateDefaultTicket().then((id) {
      setState(() {
        idO = id;
      });
    });

    NXHelp aconfig = NXHelp();

    aconfig.loadConfig("defaulthomepage", 1).then((value) {
      if (value.length == 0) {
        return;
      } else {
        //=1;
        var currentval = value[0]['val'];
        if (currentval == "home") {
          //home page

          //launch the new onboarding process grade a under a

        } else if (currentval == "nxhome") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Nxfront()),
            (Route<dynamic> route) => false,
          );
        } else if (currentval == "ticket") {
          //goes directly to the default ticket page
          NXHelp().buyAndActivateDefaultTicket().then((id) {
            setState(() {
              idO = id;
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ActualTicket(txid: id['ticketid'])));
          });
        }
      }
    });

    //maxHeight= MediaQuery.of(context).size.height;
    containerHeight = 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Column(children: [
                AnimatedOpacity(
                  opacity: skeletonOpacity,
                  duration: Duration(seconds: 10),
                  child: Container(
                    height: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Nxfront()),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "images/mrskeleton.png",
                                width: 200,
                              )),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.transparent,
                          offset: new Offset(2.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedOpacity(
                  duration: Duration(seconds: 5),
                  opacity: skeletonOpacity,
                  child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    color: Colors.transparent,
                    child: Text(
                      "NX-Black Pie",
                      style:
                          GoogleFonts.acme(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Container(
                        child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              //open up setup
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetupFlow()),
                              );
                            },
                            child: AnimatedOpacity(
                              opacity: skeletonOpacity,
                              duration: Duration(seconds: 2),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.33,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                      "Setup",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.lightGreen,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              NXHelp()
                                  .checkIfDisclaimerHasBeenAccepted()
                                  .then((disclaimer) {
                                if (disclaimer) {
                                  //since disclaimer is certified lets proceed
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Nxfront()),
                                    (Route<dynamic> route) => false,
                                  );
                                } else {
                                  //bring popup
                                  showDialog(
                                      context: context,
                                      builder: (_) => NetworkGiffyDialog(
                                            image: Image.asset(
                                                "images/v3/tenor.gif"),
                                            title: Text('HOLD UP',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            description: Text(
                                              'Please go through the setup process and legal disclaimer screen first',
                                              textAlign: TextAlign.center,
                                            ),
                                            entryAnimation:
                                                EntryAnimation.BOTTOM,
                                            onOkButtonPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SetupFlow()));
                                            },
                                          ));
                                }
                              });
                            },
                            child: AnimatedOpacity(
                              opacity: skeletonOpacity,
                              duration: Duration(seconds: 3),
                              child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [], color: Colors.transparent),
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  child: Stack(
                                    children: <Widget>[
                                      AnimatedPositioned(
                                        duration: Duration(seconds: 1),
                                        top: nxhometop2.toDouble(),
                                        left: 18,
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color:
                                                        Colors.lightGreenAccent,
                                                    blurRadius: 300,
                                                    offset:
                                                        new Offset(1.0, 0.2),
                                                  )
                                                ]),
                                            child: CircleAvatar(
                                                radius: 40,
                                                child: Text("NXHOME",
                                                    style: GoogleFonts.acme(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                backgroundColor: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //goes to ticket

                              NXHelp()
                                  .checkIfDisclaimerHasBeenAccepted()
                                  .then((disclaimer) {
                                if (disclaimer) {
                                  print(idO['ticketid']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActualTicket(
                                              txid: idO['ticketid'])));
                                } else {
                                  //open up dialog
                                  showDialog(
                                      context: context,
                                      builder: (_) => NetworkGiffyDialog(
                                            image: Image.asset(
                                                "images/v3/tenor.gif"),
                                            title: Text('HOLD UP',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 22.0,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            description: Text(
                                              'Please go through the setup process and legal disclaimer screen first',
                                              textAlign: TextAlign.center,
                                            ),
                                            entryAnimation:
                                                EntryAnimation.BOTTOM,
                                            onOkButtonPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SetupFlow()));
                                            },
                                          ));
                                }
                              });
                            },
                            child: AnimatedOpacity(
                              opacity: skeletonOpacity,
                              duration: Duration(seconds: 2),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.33,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                      "Ticket",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.lightGreen,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
                AnimatedSize(
                  vsync: this,
                  duration: Duration(seconds: 1),
                  child: Container(
                    height:
                        MediaQuery.of(context).size.height * sizeOfBottomBar,
                    padding: EdgeInsets.only(left: 19, right: 19, top: 19),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            topLeft: Radius.circular(60)),
                        color: Colors.blueGrey.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.90),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: FutureBuilder(
                      future: NXHelp().checkIfDisclaimerHasBeenAccepted(),
                      builder: (context, snapshot) {
                        Future.delayed(Duration(seconds: 1), () {
                          if (snapshot.data == true) {
                            //great
                          } else {
                            setState(() {});
                          }
                        });

                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => NetworkGiffyDialog(
                                      image: Image.asset("images/v3/tenor.gif"),
                                      title: Text('HOLD UP',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600)),
                                      description: Text(
                                        'Please go through the setup process and legal disclaimer screen first',
                                        textAlign: TextAlign.center,
                                      ),
                                      entryAnimation: EntryAnimation.BOTTOM,
                                      onOkButtonPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SetupFlow()));
                                      },
                                    ));
                          },
                          child: IgnorePointer(
                              ignoring: snapshot.data == false ? true : false,
                              child: QuickOptions()),
                        );
                      },
                    ),
                  ),
                )
              ]),
            ),
            isShowing == true
                ? Container(
                    height: containerHeight,
                    color: Colors.white,
                  )
                : Container(),
          ],
        )));
  }

 
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromRGBO(0, 0, 0, 1), // navigation bar color
    statusBarColor: Color.fromRGBO(0, 0, 0, 1), // status bar color
  ));
  return runApp(Phoenix(
    child: MaterialApp(debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,

      textTheme: GoogleFonts.robotoTextTheme(),

    ),
     home: HomePagePre()

        //Halifax()

        //MainLauncher()
        //HomePagePre(),
        //home:PaymentConfirmed()
        ),
  ));
}
