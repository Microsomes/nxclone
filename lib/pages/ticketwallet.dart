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

  List allHistoricalTickets;

  Stpagestate() {
    //grabbs all unused tickets
    allUnactivatdTickets = List();
    allHistoricalTickets=List();

    NXHelp().getAllAvailableToPurchaseTickets().then((value){
       allHistoricalTickets = value;
      setState(() {});
    });

    NXHelp().getAllUseableTickets().then((value) {
       allUnactivatdTickets = value;
      setState(() {});
    });
  }
  bool isTickets = true;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

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
              onPressed: () async {
                NXHelp().runScan().then((value) async {
                  var total = value.length;

                  Map<String, int> ticketTotals = new Map<String, int>();

                  //run a fuking loop
                  for (var i = 0; i < total; i++) {
                    var cur = value[i];
                    var tid=cur["id"];
                    var state = cur["state"];
                    var type = cur["tickettype"];
                    print(state);
                    print(type);

                    if (ticketTotals[state + "-" + type] == null) {
                      ticketTotals[state + "-" + type] = 1;
                    }else{
                      ticketTotals[state+"-"+type]++;
                    }

                    var expires = int.parse(cur['expires']) + (60 * 60 * 24);
                    var curTime = DateTime.now().millisecondsSinceEpoch;
                    if (curTime < expires) {
                      print("ticket has expired");
                    } else {
                      print("ticket sill active");

                      //even though its active we need to check of multiples of these exist
                      if(ticketTotals[state+"-"+type]>=1){
                        print("to remove");
                        var a= await NXHelp().expireTicket(tid);
                        print(a);
                      }

                    }
                  }

                  print(ticketTotals);
                });
              },
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
                            _pageController.animateToPage(0,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn);
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
                            _pageController.animateToPage(1,
                                duration: Duration(seconds: 1),
                                curve: Curves.bounceIn);
                            setState(() {
                              isTickets = false;
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
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (i) {
                        if (i == 0) {
                          setState(() {
                            isTickets = true;
                          });
                        } else {
                          setState(() {
                            isTickets = false;
                          });
                        }
                      },
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: allUnactivatdTickets.length,
                              itemBuilder: (context, index) {
                                if (allUnactivatdTickets[index]['isActive'] ==
                                    -1) {
                                } else {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ActualTicket(
                                                    txid: allUnactivatdTickets[
                                                        index]['id'],
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12, top: 12),
                                      child: Container(
                                        height: 110,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.92,
                                        child: TicketTwo(
                                          state: allUnactivatdTickets[index]
                                              ['state'],
                                          tickettype:
                                              allUnactivatdTickets[index]
                                                  ['tickettype'],
                                          id: allUnactivatdTickets[index]['id'],
                                          whenActivated:
                                              allUnactivatdTickets[index]
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
                                    ticketExpiryDate:
                                        allUnactivatdTickets[index]
                                            ['ticketExpiry'],
                                  ),
                                );
                              }),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: allHistoricalTickets.length,
                              itemBuilder: (context, index) {
                                if (allHistoricalTickets[index]['isActive'] ==
                                    -1) {
                                } else {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ActualTicket(
                                                    txid: allHistoricalTickets[
                                                        index]['id'],
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12, top: 12),
                                      child: Container(
                                        height: 110,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.92,
                                        child: TicketTwo(
                                          state: allHistoricalTickets[index]
                                              ['state'],
                                          tickettype:
                                              allHistoricalTickets[index]
                                                  ['tickettype'],
                                          id: allHistoricalTickets[index]['id'],
                                          whenActivated:
                                              allHistoricalTickets[index]
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
                                    ticketType: allHistoricalTickets[index]
                                        ['tickettype'],
                                    state: allHistoricalTickets[index]['state'],
                                    txdbid: allHistoricalTickets[index]['id'],
                                    ticketExpiryDate:
                                        allHistoricalTickets[index]
                                            ['ticketExpiry'],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ]),
              )
            : CircularProgressIndicator());
  }
}
