import 'package:BlackPie/v2/pages/setupflow.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
 import 'package:BlackPie/v2/main/quickOptions.dart';
import 'package:BlackPie/v2/pages/nxfront.dart';
import 'package:BlackPie/v2/pages/ticketv2.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class HomePagePre extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagePrestate();
  }
}

class HomePagePrestate extends State<HomePagePre> {
  bool isShowing = false;
  double maxHeight;
  double containerHeight;

  var idO;

  @override
  void initState() {
    super.initState();

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
                Container(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          print("open ticket page");

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Nxfront()),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 120,
                            width: 120,
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
                        color: Colors.lightGreen,
                        offset: new Offset(2.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200)),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Text(
                                    "Setup",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Nxfront()),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(boxShadow: []),
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Colors.lightGreenAccent,
                                          blurRadius: 300,
                                          offset: new Offset(1.0, 0.2),
                                        )
                                      ]),
                                  child: CircleAvatar(
                                      radius: 40,
                                      child: Text(
                                        "NXHOME",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.lightBlueAccent),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //goes to ticket
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ActualTicket(txid: idO['ticketid'])));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Text(
                                    "Ticket",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
                Container(
                  height: MediaQuery.of(context).size.height * 0.36,
                  padding: EdgeInsets.only(left: 19, right: 19, top: 19),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60)),
                      color: Colors.white.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.90),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: QuickOptions(),
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
    child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePagePre()

        //Halifax()

        //MainLauncher()
        //HomePagePre(),
        //home:PaymentConfirmed()
        ),
  ));
}
