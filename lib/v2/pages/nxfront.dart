import 'package:BubbleGum/pages/ticketwalletv2.dart';
import 'package:BubbleGum/v3/models/ticketWalletModel.dart';
import 'package:BubbleGum/v7/afterDisclaimerQuickMenu.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/components/daysaveractive.dart';
import 'package:BubbleGum/pages/help.dart';
import 'package:BubbleGum/pages/offers.dart';
import 'package:BubbleGum/pages/selectticket.dart';
import 'package:BubbleGum/pages/tripTools.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/ticket.dart';
import 'package:BubbleGum/v2/pages/ticketv2.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menupage/topMenuPage.dart';

class Nxfront extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NxfrontState();
  }
}

class NxfrontState extends State<Nxfront> {
  var lins = 1;
  double heightOf = 60;
  double spaceApart = 23;
  int defaultTicketid;
  String state = "";
  String tickettype = "";
  final double _letterSpaceing = 0.8;


  bool isShowTicket=true;

  @override
  void initState() {
    super.initState();

    //call method to grab a preactivated default ticket useful
    NXHelp().buyAndActivateDefaultTicket().then((preactivatedid) {
      setState(() {
        defaultTicketid = preactivatedid['ticketid'];
        state = preactivatedid['state'];
        tickettype = preactivatedid['tickettype'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return;
      },
      child: Scaffold(
          body: Container(
              height: 1000,
              width: double.infinity,
              color: Color.fromRGBO(169, 27, 26, 1),
              child: Column(
                children: <Widget>[
                  NXFront_TopBar(),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          NXItem(
                            letterSpaceing: _letterSpaceing,
                            heightOf: heightOf,
                            title: "Singles & Daysavers",
                            icon: Image.asset("images/v7/v7ticketone.png",width: 40,),
                            child: SelectTicket(),
                          ),
                          
                          SizedBox(
                            height: spaceApart,
                          ),
                          NXItem(heightOf: heightOf, letterSpaceing: _letterSpaceing,
                          title: "NX 1 Week and 4 Week",
                          icon: Image.asset("images/v7/v7tickettwo.png",width: 40,),
                          child: Offers(),
                          ),
                          SizedBox(
                            height: spaceApart,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TicketWalletV2()),
                              );
                            },
                            child: Container(
                              width: 370,
                              height: heightOf,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(215, 216, 218, 1),
                                        offset: new Offset(0, 3))
                                  ]),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "images/wallet.png",
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Ticket wallet",
                                  style: GoogleFonts.roboto(
                                      letterSpacing: _letterSpaceing,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Expanded(
                                  child: Text(""),
                                ),
                                Image.asset("images/rightarrow.png", width: 35),
                                SizedBox(
                                  width: 4,
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                         isShowTicket==true ? FutureBuilder(
                            future: NXHelp().buyDefaultTicketAndActivatev2(),
                            builder: (ctx,snapshot){
                              print(snapshot.data);
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }else{
                              return ShowTicketOnNx(sizeW: sizeW, defaultTicketid: snapshot.data,
                                requestRefresh: (id){
                                  

                                  if(mounted){
                                  setState(() {
                                    isShowTicket=false;
                                  });
                                  }

                                  Future.delayed(Duration(seconds: 1),(){
                                   if(mounted){
                                    setState(() {
                                      isShowTicket=true;
                                    });
                                   }
                                  });

                                },
                              );
                              }
                            },
                          ):Container(),
                          SizedBox(
                            height: spaceApart,
                          ),
                          NXItem(heightOf: heightOf, letterSpaceing: _letterSpaceing, 
                          title: "Trip tools", 
                          icon: Image.asset("images/triptool.png",width: 50,), 
                          child: Triptools()),
                         
                          SizedBox(
                            height: spaceApart,
                          ),
                          NXItem(heightOf: heightOf, letterSpaceing: _letterSpaceing,
                           title: "Help", 
                           icon: Image.asset("images/ottom.png",width: 50,),
                            child: Help()),
                         
                          SizedBox(
                            height: 300,
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ))),
    );
  }
}

class NXItem extends StatefulWidget {

  final String title;
  final Image icon;
  final Widget child;

  const NXItem({
    Key key,
    @required this.heightOf,
    @required double letterSpaceing,
    @required this.title,
    @required this.icon,
    @required this.child
  }) : _letterSpaceing = letterSpaceing, super(key: key);

  final double heightOf;
  final double _letterSpaceing;

  @override
  _NXItemState createState() => _NXItemState();
}

class _NXItemState extends State<NXItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Offers()),
        );
      },
      child: Container(
        width: 380,
        height: widget.heightOf,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(215, 216, 218, 1),
                  offset: new Offset(0, 3))
            ]),
        child: Row(children: <Widget>[
          SizedBox(
            width: 10,
          ),
          
          widget.icon,
          SizedBox(
            width: 6,
          ),
          Text(
            widget.title,
            style: GoogleFonts.roboto(
                letterSpacing: widget._letterSpaceing,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Expanded(
            child: Text(""),
          ),
          Image.asset("images/rightarrow.png", width: 35),
          SizedBox(
            width: 4,
          )
        ]),
      ),
    );
  }
}

class ShowTicketOnNx extends StatefulWidget {
  final Function requestRefresh;
  const ShowTicketOnNx({
    @required this.requestRefresh,
    Key key,
    @required this.sizeW,
    @required this.defaultTicketid,
  }) : super(key: key);

  final double sizeW;
  final int defaultTicketid;

  @override
  _ShowTicketOnNxState createState() => _ShowTicketOnNxState();
}

class _ShowTicketOnNxState extends State<ShowTicketOnNx> {



  bool isOn=true;



  @override
  void initState() {

    NXHelp().getTicketWalletInfoByID(id: widget.defaultTicketid).then((value) {
      List<TicketWalletModel> tw= value;
      print(">"+tw[0].activeStatus.toString());
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 189,
      width: widget.sizeW * 0.96,
      decoration: BoxDecoration(
          color: Color.fromRGBO(123, 26, 17, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 14,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Ticket2(
                              txdbid: 0,
                            )));
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ActualTicket(
                                  txid:
                                      widget.defaultTicketid)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 3),
                  child: Container(
                    height: 123,
                    width: MediaQuery.of(context)
                            .size
                            .width *
                        0.92,
                    child: TicketTwo(
                      onExpire: (id){
                        print("THIS TICKET HAS EXPIRED YO");
                        widget.requestRefresh(id);
                      },

                      id: widget.defaultTicketid,

                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 17),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TicketWalletV2()));
                //Ticketwallet
              },
              child: Container(
                  alignment: Alignment.bottomRight,
                  width: widget.sizeW,
                  height: 17,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "MORE TICKETS",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "images/rightwhite.png",
                        width: 15,
                      ),
                      SizedBox(
                        width: 12,
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class NXFront_TopBar extends StatefulWidget {
  const NXFront_TopBar({
    Key key,
  }) : super(key: key);

  @override
  _NXFront_TopBarState createState() => _NXFront_TopBarState();
}

class _NXFront_TopBarState extends State<NXFront_TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                 width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Image.asset(
                    "images/v4/header.png",
                    width: 300,
                  ),
                ),
              ),
              GestureDetector(
                onLongPress: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AfterDisclaimer()));
                },
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UtilitiesMenu()));
                },
                child: Image.asset(
                  "images/v3/menu_icon.png",
                  width: 50,
                  height: 25,
                ),
              )
            ],
          )),
    );
  }
}
