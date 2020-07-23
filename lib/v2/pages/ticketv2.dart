import 'package:flutter/material.dart';
import 'package:nxclone/v2/components/nxsig.dart';
import 'package:nxclone/v2/components/ticketColor.dart';
import 'package:qr_flutter/qr_flutter.dart';


class ActualTicket extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ActualTicketState();
  }
}
class ActualTicketState extends State<ActualTicket>{
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
                          alignment: Alignment.center,
                          height: 180,
                           child: QrImage(
                            data: "1234567lkmklklmklmklmklm8901234567lkmklklmklmklmklm8901234567lkmklklmklmklmklm8901234567lkmklklmklmklmklm8901234567lkmklklmklmklmklm8901234567lkmklklmklmklmklm890",
                            version: QrVersions.auto,
                            size: 180,
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
                          height: 240,
                         child: Stack(
                         children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Padding(
                          padding: const EdgeInsets.only(
                              left:20,
                              right:20,
                              top:3
                          ),
                          child: TicketColor(ctx: context,),
                        ),
                            ),
                        Positioned(
                          top: 60,
                          left: 2,
                                child: Padding(
                            padding: const EdgeInsets.only(
                              left:18,
                              right: 0
                            ),
                            child: Container(
                             child: Column(
                               children: <Widget>[
                                 Nxsig(isRounded: false,state: "",),
                                 Container(
                                   height: 30,
                                   width: MediaQuery.of(context).size.width*0.785,
                                   decoration: BoxDecoration(
                                        color: Color.fromRGBO(156, 19, 26, 1),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)
                                        ),
                                   ),
                                   child: Center(
                                     child: Text("Activated 13:32",
                                     style: TextStyle(
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 17,
                                       letterSpacing: 0.8
                                     ),
                                     ),
                                   ),
                                 ),
                               ],
                             )
                             ),
                          ),
                        ),
                         ],
                       ),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
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