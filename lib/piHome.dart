import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'v2/helper/NxHelp.dart';
import 'v2/main/quickOptions.dart';
import 'v2/pages/nxfront.dart';
import 'v2/pages/setupflow.dart';
import 'v2/pages/ticketv2.dart';
import 'v3/newSetup.dart';

class PiHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PiHomeState();
  }
}

class PiHomeState extends State<PiHome> {
  var idO;
  bool isShowing = true;

  var ticketType = ["Singles", "Day", "Group", "Test"];

  var selectedTicket = "Singles";

  List<Map> filteredTickets;

  @override
  void initState() {
    super.initState();
    NXHelp().getTicketsByTag(selectedTicket).then((ticker) {
      filteredTickets = ticker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "(Version 5.0-Gorilla Edition)",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
                      child: Image.asset(
                        "images/v4/Orange_Bubblegum.png",
                        width: 100,
                        height: 100,
                      )),
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
                                    builder: (context) => NewSetupv3()),
                              );
                            },
                            child: AnimatedOpacity(
                              opacity: 1,
                              duration: Duration(seconds: 2),
                              child: Container(
                                  margin: EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(38, 38, 38, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: CircleAvatar(
                                            radius: 40,
                                            child: Image.asset(
                                              "images/v5/settings.png",
                                              color: Colors.white,
                                              width: 60,
                                            ),
                                            backgroundColor:
                                                Color.fromRGBO(249, 140, 85, 1),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "(Setup)",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 8)
                                    ],
                                  )),
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
                                  margin: EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [],
                                    color: Color.fromRGBO(38, 38, 38, 1),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                boxShadow: []),
                                            child: CircleAvatar(
                                              radius: 40,
                                              child: Image.asset(
                                                "images/v5/home.png",
                                                width: 60,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Color.fromRGBO(
                                                  249, 140, 85, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "(Home)",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
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
                                  margin: EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(38, 38, 38, 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: CircleAvatar(
                                            radius: 50,
                                            child: Image.asset(
                                              "images/v5/tickets.png",
                                              width: 60,
                                              color: Colors.white,
                                            ),
                                            backgroundColor:
                                                Color.fromRGBO(249, 140, 85, 1),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "(Default Ticket)",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
                Expanded(
                    flex: 2,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "By pass simulation (Simpler and Faster) 🚀",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              color: Colors.white.withOpacity(0.1),
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ticketType.length,
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, index) {
                                    return InkWell(
                                      onTap: () {
                                        print("$index");
                                        setState(() {
                                          selectedTicket = ticketType[index];

                                          NXHelp()
                                              .getTicketsByTag(selectedTicket)
                                              .then((ticker) {
                                            setState(() {
                                              filteredTickets = ticker;
                                            });
                                          });
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: selectedTicket ==
                                                    ticketType[index]
                                                ? Colors.orangeAccent
                                                : Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        margin: EdgeInsets.all(10),
                                        width:
                                            selectedTicket == ticketType[index]
                                                ? 100
                                                : 50,
                                        height: 50,
                                        child: Center(
                                            child: Text(
                                          ticketType[index],
                                          style: GoogleFonts.roboto(
                                              color: selectedTicket ==
                                                      ticketType[index]
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: selectedTicket ==
                                                      ticketType[index]
                                                  ? 12
                                                  : 8),
                                          textAlign: TextAlign.center,
                                        )),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            filteredTickets != null
                                ? Expanded(
                                    child: ListView.builder(
                                      itemCount: filteredTickets.length,
                                      itemBuilder: (ctx, index) {
                                        return Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Center(
                                                child: Text(
                                                    filteredTickets[index]
                                                        ["state"][0]),
                                              ),
                                            ),
                                            title: Text(
                                              filteredTickets[index]
                                                  ["tickettitle"],
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              filteredTickets[index]["state"],
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Container()
                          ],
                        ))),
                Text(
                  "Educational Purposes Only, Demonstration only. Please do not use this application to really fool the drivers. You might get in serious trouble.",
                  style: GoogleFonts.roboto(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
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
