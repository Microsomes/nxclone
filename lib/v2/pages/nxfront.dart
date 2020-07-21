import 'package:flutter/material.dart';
import 'package:nxclone/components/daysaveractive.dart';
import 'package:nxclone/pages/help.dart';
import 'package:nxclone/pages/journey/ticket.dart';
import 'package:nxclone/pages/offers.dart';
import 'package:nxclone/pages/ticketwallet.dart';
import 'package:nxclone/pages/tripTools.dart';
import 'package:nxclone/v2/main/bar.dart';
import 'package:nxclone/v2/pages/ticket.dart';

class Nxfront extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return NxfrontState();
  }
}

class NxfrontState extends State<Nxfront>{
   var lins = 1;
   double heightOf = 60;
   double spaceApart = 20;
   
  @override
  Widget build(BuildContext context) {
        final sizeW = MediaQuery.of(context).size.width;
        final sizeH = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child:  AppBar(
            elevation: 0.0,
            title: Text(
              "",
              style: TextStyle(
                  color: Color.fromRGBO(107, 107, 107, 1), fontSize: 22),
            ),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Container(
                  decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(29)),
                  width: 120,
                  height: 10,
                  child: Center(
                    child: Text("")
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
          height: 1000,
          width: double.infinity,
          color: Color.fromRGBO(169, 27, 26, 1),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SelectTicket()),
                  // );
                },
                focusColor: Colors.red,
                highlightColor: Colors.pink,
                child: Container(
                  width: 380,
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
                      "images/busicon.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Buy ticket",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
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
                height: spaceApart,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Offers()),
                  );
                },
                child: Container(
                  width: 380,
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
                      "images/offers.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Offers",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
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
                height: spaceApart,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ticketwallet()),
                  );
                },
                child: Container(
                  width: 380,
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
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Ticket wallet",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
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
              Container(
                height: 186,
                width: sizeW * 0.96,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(123, 26, 17, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Ticket2()));

                      },
                                          child: Container(
                          width: sizeW * 0.9,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: SingleInactiveTicket(sizeW: sizeW)
                           ),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: (){
                          print("ticket page");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Ticketwallet()));
                          //Ticketwallet
                        },
                                              child: Container(
                            alignment: Alignment.bottomRight,
                            width: sizeW,
                            height: 16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "MORE TICKETS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
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
              ),
              SizedBox(
                height: spaceApart,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Triptools()),
                  );
                },
                child: Container(
                  width: 380,
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
                      "images/triptool.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Trip tools",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
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
                height: spaceApart,
              ),
               InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Help()),
                  );
                },
                child: Container(
                  width: 380,
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
                      "images/ottom.png",
                      width: 50,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Help",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
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

            ],
          )
      )
    );
  }
}