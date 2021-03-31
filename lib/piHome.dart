import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/piHomeOptions.dart';
import 'v2/helper/NxHelp.dart';
import 'v2/main/quickOptions.dart';
import 'v2/pages/nxfront.dart';
import 'v2/pages/setupflow.dart';
import 'v2/pages/ticket.dart';
import 'v2/pages/ticketv2.dart';
import 'v3/newSetup.dart';

class PiHome extends StatefulWidget {
  final bool isHide;

  PiHome({this.isHide});

  @override
  State<StatefulWidget> createState() {
    return PiHomeState();
  }
}

class PiHomeState extends State<PiHome> {
  var idO;
  bool isShowing = true;
  var ticketType = [
    "Singles",
    "Day",
    "Last Used",
    "Group",
    "Metro",
    "Experimental"
  ]; 

  List<Map> ticketTypes;
  



  var selectedTicket = "Singles";
  
  var selectedTicketIndex=0;


  List<Map> filteredTickets;
  @override
  void initState() {
    super.initState();
    
    ticketTypes= List<Map>();

    ticketTypes.add({
      "Name":"Singles",
      "Icon":Icons.track_changes
    });

    ticketTypes.add({
      "Name":"Day",
      "Icon":Icons.dynamic_feed
    });

    ticketTypes.add({
      "Name":"Last Used",
      "Icon":Icons.history
    });

    ticketTypes.add({
      "Name":"Group",
      "Icon":Icons.group
    });

     ticketTypes.add({
      "Name":"Metro",
      "Icon":Icons.train
    });

    ticketTypes.add({
      "Name":"Test",
      "Icon":Icons.track_changes
    });




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
    
                widget.isHide==true ?Container(): PiHomeOptions(),
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
                                          selectedTicketIndex=index;
                                        });
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
                                          ticketTypes[index]["Name"],
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  this.selectedTicket,
                                  style:
                                      GoogleFonts.roboto(color: Colors.white,
                                      fontSize: 20
                                      ),
                                ),
                              ],
                            ),
                            filteredTickets != null
                                ? Expanded(
                                    child: ListView.builder(
                                      itemCount: filteredTickets.length,
                                      itemBuilder: (ctx, index) {
                                        return Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: ListTile(
                                            onTap: () {
                                              print("Go to the ticket page");
                                              var ticketType =
                                                  filteredTickets[index]
                                                      ['tickettitle'];
                                              var ticketState =
                                                  filteredTickets[index]
                                                      ['state'];

                                              print(ticketType);
                                              print(ticketState);

                                              NXHelp()
                                                  .buyTicket(
                                                      tickettype: ticketType,
                                                      state: ticketState,
                                                      price: "0.00")
                                                  .then((value) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Ticket2(
                                                              txdbid: value,
                                                            )));
                                              });
                                            },
                                            leading: Container(
                                              width: 50,
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
                                                color: Colors.orangeAccent,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  this.ticketTypes[this.selectedTicketIndex]["Icon"],
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
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
