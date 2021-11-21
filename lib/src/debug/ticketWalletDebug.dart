import 'package:bubble_gum/v2/helper/NxHelp.dart';
import '../v3/models/ticketWalletModel.dart';
import './activatedTile.dart';
import 'package:flutter/material.dart';

class TicketDebug extends StatefulWidget {
  @override
  _TicketDebugState createState() => _TicketDebugState();
}

class _TicketDebugState extends State<TicketDebug> {
  bool isAvailable = true;

  @override
  void initState() {
    print(DateTime.now().millisecondsSinceEpoch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => ShowAvailableTicketsToPurchaseDebug(
                          onTicketPicked: (int id) {
                            NXHelp()
                                .buyTicketv2(ticketID: id, tag: "active")
                                .then((value) {
                              setState(() {
                                isAvailable = !isAvailable;
                              });
                              Future.delayed(Duration(milliseconds: 1), () {
                                setState(() {
                                  isAvailable = !isAvailable;
                                });
                              });

                              Navigator.pop(context);
                            });
                          },
                        ));
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                NXHelp().deleteAllTicketWalletV2().then((value) {
                  setState(() {
                    isAvailable = !isAvailable;
                  });
                  Future.delayed(Duration(milliseconds: 1), () {
                    setState(() {
                      isAvailable = !isAvailable;
                    });
                  });
                });
              },
            )
          ],
          title: Text("DEBUG-Ticket Wallet"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAvailable = !isAvailable;
                });
              },
              child: Center(
                child: Text(isAvailable == true ? "TO ACTIVATE" : "ACTIVATED"),
              ),
              // color: Colors.black,
            ),
            isAvailable == true
                ? Expanded(child: ShowAvailableTickets(
                    onActive: () {
                      setState(() {
                        isAvailable = !isAvailable;
                      });
                      Future.delayed(Duration(milliseconds: 1), () {
                        setState(() {
                          isAvailable = !isAvailable;
                        });
                      });
                    },
                  ))
                : Expanded(child: ShowActiveTickets())
          ],
        ));
  }
}

class ShowAvailableTickets extends StatefulWidget {
  final Function onActive;
  ShowAvailableTickets({@required this.onActive});
  @override
  _ShowAvailableTicketsState createState() => _ShowAvailableTicketsState();
}

class _ShowAvailableTicketsState extends State<ShowAvailableTickets> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NXHelp().getAllUseableTicketsv2(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          List<TicketWalletModel> all = snapshot.data;

          return Column(
            children: [
              Expanded(
                child: Container(
                  height: 400,
                  padding: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: all.length,
                    itemBuilder: (ctx, index) {
                      return FutureBuilder(
                        future: NXHelp().getTicketByID(all[index].ticketid),
                        builder: (ctx, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else {
                            return ListTile(
                              onTap: () {
                                //activate ticket

                                all[index].setActive().then((value) {
                                  print(value);
                                  widget.onActive();
                                });
                              },
                              trailing: GestureDetector(
                                onTap: () {
                                  print("expire the ticket");
                                  all[index].setExpireTicket();
                                },
                                child: CircleAvatar(
                                  child: Center(
                                    child: Icon(Icons.close),
                                  ),
                                ),
                              ),
                              leading: CircleAvatar(
                                child: Text(all[index].id.toString()),
                              ),
                              title: Text(snapshot.data[0]['tickettitle']),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data[0]['state']),
                                  Text("Purchase Date:\n" +
                                      all[index].getTimeCreatedHuman()),
                                  all[index].activeStatus == -1
                                      ? Text("Not activated")
                                      : Text("Activated"),
                                  FutureBuilder(
                                    future: all[index].getTimeRemainingIdle(),
                                    builder: (ctx, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text("no data");
                                      }

                                      return Text(
                                          snapshot.data.toString() + " Days");
                                    },
                                  )
                                ],
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}

class ShowActiveTickets extends StatefulWidget {
  @override
  _ShowAvailableTicketsState2 createState() => _ShowAvailableTicketsState2();
}

class _ShowAvailableTicketsState2 extends State<ShowActiveTickets> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NXHelp().getAllActiveTicketsV2(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          List<TicketWalletModel> all = snapshot.data;

          return Column(
            children: [
              Expanded(
                child: Container(
                  height: 400,
                  padding: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: all.length,
                    itemBuilder: (ctx, index) {
                      return FutureBuilder(
                        future: NXHelp().getTicketByID(all[index].ticketid),
                        builder: (ctx, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else {
                            return ActivatedTile(
                              all: all[index],
                              snapshot: snapshot,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}

class ShowAvailableTicketsToPurchaseDebug extends StatefulWidget {
  final Function onTicketPicked;

  ShowAvailableTicketsToPurchaseDebug({@required this.onTicketPicked});

  @override
  _ShowAvailableTicketsToPurchaseDebugState createState() =>
      _ShowAvailableTicketsToPurchaseDebugState();
}

class _ShowAvailableTicketsToPurchaseDebugState
    extends State<ShowAvailableTicketsToPurchaseDebug> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      title: Text("Debug pick ticket"),
      content: FutureBuilder(
        future: NXHelp().getAllAvailableToPurchaseTickets(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Hero(
              tag: "oc",
              child: Container(height: 400, child: CircularProgressIndicator()),
            );
          }

          return Hero(
            tag: "oc",
            child: Container(
                height: 399,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var i = 0; i < snapshot.data.length; i++)
                          Column(
                            children: [
                              Text(
                                snapshot.data[i]['id'].toString() +
                                    "\n" +
                                    snapshot.data[i]['tickettitle'].toString() +
                                    "\n" +
                                    snapshot.data[i]['state'].toString(),
                                textAlign: TextAlign.center,
                              ),
                              ElevatedButton(
                                child: Text("Pick"),
                                // color: Colors.green,
                                onPressed: () {
                                  widget.onTicketPicked(snapshot.data[i]['id']);
                                },
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
