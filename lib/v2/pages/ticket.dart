import 'package:flutter/material.dart';
import 'package:nxclone/v2/components/nxsig.dart';
import 'package:nxclone/v2/main/bar.dart';
import 'package:nxclone/v2/pages/ticketv2.dart';

class Ticket2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return Ticket2State();
  }
}

class Ticket2State extends State<Ticket2>{



   void displayActivationDialog(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.65,
            child: Center(
              child:Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Text("ADULT WEST MIDLANDS SINGLE JOURNEY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(62, 68, 91, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:30.0,top:10),
                      child: Text(
                        "Ticket Activation",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        top: 30
                      ),
                      child: Text(
                        "Please activate your ticket before just before boarding. A ticket remains active for only 30 minutes.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5
                        ),
                        ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        top: 20
                      ),
                      child: Text(
                        "You may only activate your mTicket\nonce so please do not continue unless\nyou are travelling.",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5
                        ),
                        ),
                    ),
                  ),
                  Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                            top: 60
                          ),
                          child: InkWell(
                            onTap: (){
                             //displayActivationDialog(context);
                             print("show ticket and activate");
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ActualTicket()),
                            );
                            },
                              child: Container(
                              color: Color.fromRGBO(46, 150,32, 1),
                              height: 60,
                              child: Center(
                                child: Text(
                                  "Activate Ticket",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 0.3
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                         Container(
                           width: MediaQuery.of(context).size.width,
                          child: Padding(
                              padding: const EdgeInsets.only(left:10,top:30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: const EdgeInsets.all(0.0),
                                      width: 30,
                                    child: IconButton(
                                      icon: Icon(Icons.close,color: Color.fromRGBO(81, 108, 137, 1),size: 20,),
                                      onPressed: (){},
                                    ),
                                  ),
                                  Text("Close",
                                  style: TextStyle(
                                    color: Color.fromRGBO(103, 119, 138, 1),
                                    fontWeight: FontWeight.w500
                                  ),)
                                ],
                              ),
                            )
                        
                        )
                ],
              )
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      

      body: SafeArea(
              child: Column(

          children: <Widget>[
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      top:10
                    ),
                    child: Text("Close",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                                color: Color.fromRGBO(117, 28, 21, 1),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)
                                )
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(
                                left: 10,
                                child: Text("WEST MIDLANDS SINGLE JOURNEY",
                                style: TextStyle(
                                  letterSpacing: 0.3,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text(
                            "ANY BUS ACROSS OUR NETWORK",
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(124, 126, 136, 1,
                              )
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top:10
                            ),
                            child: Nxsig(isRounded: true,)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width/1.7,
                          child: Text(
                            "ACTIVATE JUST BEFORE BOARDING",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(124, 126, 136, 1,
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 12,
                            left: 12,
                            top: 6
                          ),
                          child: InkWell(
                            onTap: (){
                             displayActivationDialog(context);
                            },
                              child: Container(
                              color: Color.fromRGBO(46, 150,32, 1),
                              height: 60,
                              child: Center(
                                child: Text(
                                  "Activate Ticket",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 0.3
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                       Padding(
                          padding: const EdgeInsets.only(
                            right: 12,
                            left: 12,
                            top:10
                           ),
                          child: Container(
                            color: Color.fromRGBO(26, 108,151, 1),
                            height: 60,
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 15,),
                                  Icon(Icons.launch,color: Colors.white,size: 16,),
                                  SizedBox(width: 15,),
                                  Text(
                                "NX Rewards Cashback",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                  letterSpacing: 0.3
                                ),
                              ),
                                ],
                              )
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text("")
                        ),
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.more_horiz),
                                  onPressed: (){},
                                ),
                                Text("Actions",
                                style: TextStyle(
                                  color: Color.fromRGBO(103, 119, 138, 1),
                                  fontWeight: FontWeight.w500
                                ),)
                              ],
                            ),
                            Expanded(child: Container(),),
                            Padding(
                              padding: const EdgeInsets.only(right:17.0),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.format_list_bulleted),
                                    onPressed: (){},
                                  ),
                                  Text("Details",
                                  style: TextStyle(
                                    color: Color.fromRGBO(103, 119, 138, 1),
                                    fontWeight: FontWeight.w500
                                  ),)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )

          ],


        ),
      ),
    );
  }
  

}