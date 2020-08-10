import 'package:flutter/material.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:BlackPie/v2/pages/ticketv2.dart';
import './../components/daysaveractive.dart';
import 'components/singleInactive.dart';

class Ticketwallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Stpagestate();
  }
}

class Stpagestate extends State<Ticketwallet> {
  List allUnactivatdTickets;

  Stpagestate() {
    //grabbs all unused tickets
    allUnactivatdTickets = List();

    NXHelp().getAllUseableTickets().then((value) {
      print(value);
      var totalT = value.length;
      print("total tickets: $totalT");
      allUnactivatdTickets = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

  

    bool isTickets = true;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Image.asset("images/leftarrow.png", width: 4))),
          title: Center(
            child: Text(
              "Ticket wallet",
              style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Color.fromRGBO(127, 26, 25, 1),
                size: 30,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: allUnactivatdTickets != null
            ? Container(
                height: double.infinity,
                color: Color.fromRGBO(123, 26, 17, 1),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: sizeW,
                    color: Color.fromRGBO(169, 27, 26, 1),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            print("hi");
                            setState(() {
                              isTickets = true;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "Tickets",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                            ),
                            width: sizeW / 2,
                            decoration: BoxDecoration(
                                color: isTickets == true
                                    ? Color.fromRGBO(123, 26, 17, 1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isTickets = false;
                              print("ticket is false");
                            });
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "History",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                              ),
                            ),
                            width: sizeW / 2,
                            decoration: BoxDecoration(
                                color: isTickets == false
                                    ? Color.fromRGBO(123, 26, 17, 1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10))),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => Ticket()),
                  //     );
                  //   },
                  //   child: Container(
                  //     height: 110,
                  //     width: MediaQuery.of(context).size.width * 0.92,
                  //     child: ticketTwo(
                  //       title: "K",
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 1,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: allUnactivatdTickets.length,
                        itemBuilder: (context, index) {
                          if (allUnactivatdTickets[index]['isActive'] == -1) {
                          } else {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActualTicket(
                                              txid: allUnactivatdTickets[index]
                                                  ['id'],
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                child: Container(
                                  height: 110,
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  child: TicketTwo(
                                    state: allUnactivatdTickets[index]['state'],
                                    tickettype: allUnactivatdTickets[index]
                                        ['tickettype'],
                                    id: allUnactivatdTickets[index]['id'],
                                    whenActivated: allUnactivatdTickets[index]
                                        ['activationExpiry'],
                                  ),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 12),
                            child: SingleInactiveTicket(
                              sizeW: sizeW,
                              ticketType: allUnactivatdTickets[index]
                                  ['tickettype'],
                              state: allUnactivatdTickets[index]['state'],
                              txdbid: allUnactivatdTickets[index]['id'],
                              ticketExpiryDate: allUnactivatdTickets[index]
                                  ['ticketExpiry'],
                            ),
                          );
                        }),
                  ),
                ]),
              )
            : CircularProgressIndicator());
  }
}
