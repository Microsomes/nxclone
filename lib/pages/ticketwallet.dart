import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/ticketv2.dart';
import './../components/daysaveractive.dart';
import 'components/singleInactive.dart';
import 'ticketwallet/models/ticketType.dart';

class Ticketwallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Stpagestate();
  }
}

class Stpagestate extends State<Ticketwallet> {
  List allUnactivatdTickets;
  //will contain a list of all unactivated tickets
  List allHistoricalTickets;
  //will contain a list of historical tickets

  Stpagestate() {
    //grabbs all unused tickets
    allUnactivatdTickets = List();
    allHistoricalTickets = List();

    NXHelp().getAllHistoricalTickets().then((value) {
      allHistoricalTickets = value;

      NXHelp().getAllUseableTickets().then((value) {
      allUnactivatdTickets = value;
            setState(() {});
    });
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
        appBar: TicketWalletAppBar().build(context),
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
                                duration: Duration(milliseconds: 1),
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
                                duration: Duration(milliseconds: 1),
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
                        ListView.builder(
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
                                            builder: (context) => ActualTicket(
                                                  txid: allUnactivatdTickets[
                                                      index]['id'],
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 12),
                                    child: Container(
                                      height: 110,
                                      width: MediaQuery.of(context).size.width *
                                          0.92,
                                      child: TicketTwo(
                                        state: allUnactivatdTickets[index]
                                            ['state'],
                                        tickettype: allUnactivatdTickets[index]
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
                                  isUsed: isTickets,
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
                        HistoryWallet(allHistoricalTickets: allHistoricalTickets, isTickets: isTickets, sizeW: sizeW),
                      ],
                    ),
                  )
                ]),
              )
            : CircularProgressIndicator());
  }
}




class HistoryWallet extends StatefulWidget {
  const HistoryWallet({
    Key key,
    @required this.allHistoricalTickets,
    @required this.isTickets,
    @required this.sizeW,
  }) : super(key: key);

  final List allHistoricalTickets;
  final bool isTickets;
  final double sizeW;

  @override
  _HistoryWalletState createState() => _HistoryWalletState();
}

class _HistoryWalletState extends State<HistoryWallet> {

  /*
   * All historical tickets will stay here
   */
  List<TicketModel> historicalTickets;
  


  @override
  void initState() {
    super.initState();

    historicalTickets= List<TicketModel>();

    //populate all historical tickets in the model
    widget.allHistoricalTickets.forEach((element) {
      var id= element["id"];
      var state= element["state"];
      var ticketType= element["tickettype"];
      var expires = element["expires"];
      var isActive = element["isActive"];
      var purchaseDate = element["purchaseddate"];
      var ticketID= element["ticketid"];
      var tag= element["tag"];
    historicalTickets.add(
      TicketModel(
        id: id,
        state: state,
        tickettype: ticketType,
        expires: expires,
        isActive: isActive,
        purchaseDate: purchaseDate,
        ticketid: ticketID,
        tag: tag
      )
    );
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.allHistoricalTickets.length,
        itemBuilder: (context, index) {
          if (widget.allHistoricalTickets[index]['isActive'] ==
              -1) {
          } else {

            double paddingTop=12;

            if(index==0){
              paddingTop=12;
            }else{
              paddingTop=6;
            }

             return  Padding(
            padding:  EdgeInsets.only(
                left: 12, right: 12, top:paddingTop,bottom: 12),
            child: SingleInactiveTicket(
              isUsed: widget.isTickets,
              sizeW: widget.sizeW,
              ticketType: widget.allHistoricalTickets[index]
                  ['tickettype'],
              state: widget.allHistoricalTickets[index]['state'],
              txdbid: widget.allHistoricalTickets[index]['id'],
              ticketExpiryDate: widget.allHistoricalTickets[index]
                  ['ticketExpiry'],
            ),
          );
             
          }
           
        });
  }
}

class TicketWalletAppBar extends StatelessWidget {
  const TicketWalletAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                var tid = cur["id"];
                var state = cur["state"];
                var type = cur["tickettype"];
                print(state);
                print(type);

                if (ticketTotals[state + "-" + type] == null) {
                  ticketTotals[state + "-" + type] = 1;
                } else {
                  ticketTotals[state + "-" + type]++;
                }

                var expires = int.parse(cur['expires']) + (60 * 60 * 24);
                var curTime = DateTime.now().millisecondsSinceEpoch;
                if (curTime < expires) {
                  print("ticket has expired");
                } else {
                  print("ticket sill active");

                  //even though its active we need to check of multiples of these exist
                  if (ticketTotals[state + "-" + type] >= 1) {
                    print("to remove");
                    var a = await NXHelp().expireTicket(tid);
                    print(a);
                  }
                }
              }

              print(ticketTotals);
            });
          },
        )
      ],
    );
  }
}
