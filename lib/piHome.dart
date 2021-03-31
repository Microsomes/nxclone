import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/piHomeOptions.dart';
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
  var ticketType = ["Singles", "Day", "Group", "Metro", "Experimental"];
  var selectedTicket = "Singles";
  List<Map> filteredTickets;
  @override
  void initState() {
    super.initState();
    NXHelp().getTicketsByTag(selectedTicket).then((ticker) {
      setState(() {
        filteredTickets = ticker;        
      });
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
                // SizedBox(
                //   height: 20,
                // ),
                // AnimatedOpacity(
                //   duration: Duration(seconds: 5),
                //   opacity: 1,
                //   child: Container(
                //       alignment: Alignment.center,
                //       height: 80,
                //       color: Colors.transparent,
                //       child: Image.asset(
                //         "images/v4/Orange_Bubblegum.png",
                //         width: 100,
                //         height: 100,
                //       )),
                // ),
                PiHomeOptions(),
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
                                            onTap: (){
                                              print("Go to the ticket page");
                                              var ticketType=filteredTickets[index]['tickettitle'];
                                              var ticketState=filteredTickets[index]['state'];
                                              
                                              print(ticketType);
                                              print(ticketState);

                                              NXHelp().buyTicket(tickettype: ticketType, state: ticketState, price: "0.00").then((value) {
                                                print(value);
                                              });
                                            },
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