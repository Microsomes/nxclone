import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'v2/helper/NxHelp.dart';
import 'v2/main/quickOptions.dart';
import 'v2/pages/nxfront.dart';
import 'v2/pages/setupflow.dart';
import 'v2/pages/ticketv2.dart';

class PiHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PiHomeState();
  }
}

class PiHomeState extends State<PiHome> {
  var idO;
  bool isShowing = true;

  @override
  void initState() {
    super.initState();
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
                SizedBox(
                  height: 20,
                ),
                AnimatedOpacity(
                  duration: Duration(seconds: 5),
                  opacity: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    color: Colors.transparent,
                    child: Text(
                      "NX-Black Pie (Educational only-Demo)",
                      style:
                          GoogleFonts.acme(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                              opacity: 1,
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

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SetupFlow()));

                                  return;
                                }
                              });
                            },
                            child: AnimatedOpacity(
                              opacity: 1,
                              duration: Duration(seconds: 3),
                              child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [], color: Colors.transparent),
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                new BoxShadow(
                                                  color:
                                                      Colors.lightGreenAccent,
                                                  blurRadius: 300,
                                                  offset: new Offset(1.0, 0.2),
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
                                  //we need to request a ticket id
                                  NXHelp()
                                      .buyAndActivateDefaultTicket()
                                      .then((id) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ActualTicket(
                                                txid: id['ticketid'])));
                                  });
                                } else {
                                  //open up dialog

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SetupFlow()));
                                }
                              });
                            },
                            child: AnimatedOpacity(
                              opacity: 1,
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  padding: EdgeInsets.only(left: 19, right: 19, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60)),
                      color: Colors.transparent,
                      boxShadow: []),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetupFlow()));
                        },
                        child: IgnorePointer(
                            ignoring: snapshot.data == false ? true : false,
                            child: QuickOptions()),
                      );
                    },
                  ),
                )
              ]),
            ),
            isShowing == true
                ? Container(
                    height: 10,
                    color: Colors.black,
                  )
                : Container(),
          ],
        )));
  }
}
