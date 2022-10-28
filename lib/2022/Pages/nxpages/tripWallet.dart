import 'package:BubbleGum/2022/Pages/nxpages/buyflow/operatorChoice.dart';
import 'package:BubbleGum/2022/Pages/nxpages/myprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../v2/pages/nxfront.dart';
import '../../2022helper.dart';
import 'front.dart';

class TripWallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UtilitiesMenuState();
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class UtilitiesMenuState extends State<TripWallet> {
  var sections = [
    {
      "section": "Departure Information",
      "links": [
        {
          "type": "link",
          "label": "Timetables",
          "icon": "images/front/clock.svg",
        }
      ]
    },
    {
      "section": "Service changes",
      "links": [
        {
          "type": "link",
          "label": "Service changes",
          "icon": "images/front/customer-alerts.svg",
          "action": () {}
        }
      ]
    }
  ];

  bool isBuyButtonOn = true;

  bool isHistoryActive = false;

  bool isOnlyHistoryBuy = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    NXAllTicketsAvailable().then((List value) {
      if(value.length>=1){
        setState(() {
          isBuyButtonOn = false;
        });
      }else{
        setState(() {
          isBuyButtonOn = true;
        });
      }

      if(isBuyButtonOn== false){
        isOnlyHistoryBuy = true;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Nxfront()),
        );
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 80,
                  color: Color.fromRGBO(168, 28, 25, 1),
                  child: Stack(alignment: Alignment.center, children: [
                    Positioned(
                        left: 0,
                        top: 50,
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NxPagesFront()),
                            );
                          },
                          child: Container(
                            width: 100,
                            child: Positioned(
                              top: 4,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "images/front/back.svg",
                                    width: 21,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "Back",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      top: 50,
                      child: Text("Ticket wallet",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    )
                  ])),
              Expanded(
                  child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                      child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                color: Color.fromRGBO(168, 28, 25, 1),
                                height: 50,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isHistoryActive = false;

                                            if(isOnlyHistoryBuy){
                                              isBuyButtonOn = false;
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: isHistoryActive == false ? Colors.white : Color.fromRGBO(139, 0, 7, 1),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5))),
                                          child: Center(
                                              child: Text(
                                            "Tickets",
                                            style: GoogleFonts.roboto(
                                              color: isHistoryActive == false ? Colors.black : Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isHistoryActive = true;
                                            isBuyButtonOn = true;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: isHistoryActive == true ? Colors.white : Color.fromRGBO(139, 0, 7, 1),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5))),
                                          child: Center(
                                              child: Text(
                                            "History",
                                            style: GoogleFonts.roboto(
                                                color: isHistoryActive == true ? Colors.black : Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              isHistoryActive == false ? Expanded(
                                child: SingleChildScrollView(
                                  child: FutureBuilder(
                                    future: NXAllTicketsAvailable(),
                                
                                    builder: (context, snapshot) {
                                
                                      if(snapshot.connectionState == ConnectionState.done){
                                        print("check");
                                        List<Map> tickets = [];

                                        List<Map> inactiveTickets = snapshot.data[0];
                                        List<Map> activeTickets = snapshot.data[1];


                                        activeTickets.forEach((element) {
                                            tickets.add(element);
                                        });

                                        inactiveTickets.forEach((element) {
                                            tickets.add(element);
                                        });
                                
                                        if(tickets.length>=1){
                                          return Column(
                                            children: [
                                              for(var i=0;i<tickets.length;i++)
                                              Builder(builder: (ctx){
                                                return TicketComp(
                                                  ticketStatus: tickets[i]['isActive'],
                                                  marginBias: 20,
                                                  ticketId: tickets[i]['id'],
                                                );
                                              })
                                            ],
                                          );
                                        }
                                      }
                                
                                      return Container(
                                      child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 120,
                                        ),
                                        SvgPicture.asset(
                                          "images/front/tickets.svg",
                                          color: Color.fromRGBO(168, 26, 25, 1),
                                          width: 100,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Can't see your tickets?",
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MyProfile()));
                                          },
                                          child: Text(
                                            "Log in or create an account below",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    109, 109, 109, 1)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                                    },
                                  ),
                                )
                              ): Expanded(
                                child:SingleChildScrollView(
                                  child: FutureBuilder(
                                    future: NXAllUsedTickets(),
                                
                                    builder: (context, snapshot) {
                                
                                      if(snapshot.connectionState == ConnectionState.done){
                                        print("check");
                                        List<Map> tickets = snapshot.data;
                                
                                        if(tickets.length>=1){
                                          return Column(
                                            children: [
                                              for(var i=0;i<tickets.length;i++)
                                              Builder(builder: (ctx){

                                                
                                
                                                return TicketComp(
                                                  ticketStatus: tickets[i]['isActive'],
                                                  marginBias: 20,
                                                  ticketId: tickets[i]['id'],
                                                );
                                              })
                                            ],
                                          );
                                        }
                                      }
                                
                                      return Container(
                                      child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 120,
                                        ),
                                        SvgPicture.asset(
                                          "images/front/tickets.svg",
                                          color: Color.fromRGBO(168, 26, 25, 1),
                                          width: 100,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Can't see your tickets?",
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MyProfile()));
                                          },
                                          child: Text(
                                            "Log in or create an account below",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    109, 109, 109, 1)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                                    },
                                  ),
                                )
                              )
                            ],
                          )))
                ],
              )),
              GestureDetector(
                onTap: (){
                  print("buy tickets");
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=> OperatorChoice()));
                },
                child: Container(
                  color: Colors.transparent,
                  height: 93,
                  width: double.infinity,
                  child: Column(
                    children: [
                   isBuyButtonOn == true?   Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(199, 199, 199, 1),
                                spreadRadius: 0,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Color.fromRGBO(194, 154, 99, 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            "Buy tickets",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ):Container(),
                      SizedBox(
                        height:  isBuyButtonOn== true ? 5: 60,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MyProfile()));
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "Log in to view tickets",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ))),
    );
  }
}
