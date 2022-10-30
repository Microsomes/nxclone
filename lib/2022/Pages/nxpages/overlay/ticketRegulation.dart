
import 'package:BubbleGum/2022/Pages/nxpages/buyflow/phase3.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class TicketRegulatorPage extends StatelessWidget {

  final String ticketName;
  final String ticketSubtitle;
  final String ticketsubtitle2;
  final String ticketPrice;

  TicketRegulatorPage({
    @required this.ticketName,
    @required this.ticketSubtitle,
    @required this.ticketsubtitle2,
    @required this.ticketPrice
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(168, 27, 28, 1),
        body: Center(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 80,
                color: Color.fromRGBO(185, 0, 9, 1),
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                      right: -50,
                      top: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.close,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    top: 50,
                    child: Text("Ticket regulations",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )
                ])),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 20,right: 30),
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Adult West Midlands Daysaver",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                     Text(
                      "This ticket is valid on the day of first activation only.",
                      style: GoogleFonts.roboto(
                         fontSize: 16),
                    ),
                    SizedBox(height: 5,),
                     Text(
                      "Valid on all National Express West Midlands and National Express Coventry buses.",
                      style: GoogleFonts.roboto(
                         fontSize: 16),
                    ),
                    SizedBox(height: 20,),
                     Text(
                      "ATTENTION - The activation time frame of this ticket type has changed. Tickets must be used within 3 days of purchase.\nThere are now fewer days to activate your ticket to cut down on fraud. This is to make sure everyone that catches the bus using mobile tickets pays for their travel.",
                      style: GoogleFonts.roboto(
                         fontSize: 17,
                         fontWeight: FontWeight.bold,
                         wordSpacing: 1.2,
                         height: 1.2
                         ),
                    ),
                       SizedBox(height: 20,),
                     Text(
                      "You must be over 16 to purchase this type of ticket",
                      style: GoogleFonts.roboto(
                        wordSpacing: 1.1,
                         fontSize: 17),
                    ),
                    SizedBox(height: 5,),
                     Text(
                      "mTicket must be able to be displayed throughout the journey if requested by a driver or member of staff.",
                      style: GoogleFonts.roboto(
                        wordSpacing: 1.1,
                         fontSize: 17),
                    ),
                        SizedBox(height: 5,),
                     Text(
                      "No refunds can be provided",
                      style: GoogleFonts.roboto(
                        wordSpacing: 1.1,
                         fontSize: 17),
                    ),
                      SizedBox(height: 5,),
                     Text(
                      "All mTickets issues are subject to the terms and conditions of the respective operator upon which you make your journey.",
                      style: GoogleFonts.roboto(
                        wordSpacing: 1.1,
                         fontSize: 17),
                    ),
                    Divider(color: Colors.black.withOpacity(0.2),)
                  ],
                ),
              ),
            ))
          
          ,GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=> BuyFlowPhase3(
                ticketName: ticketName,
                ticketSubtitle: ticketSubtitle,
                ticketSubtitle2: ticketsubtitle2,
                ticketPrice: ticketPrice,
              )));
            },
            child: Container(
              alignment: Alignment.center,
                color: Colors.white,
                height: 62,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Container(
                      height:50,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(199, 199, 199, 1),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Color.fromRGBO(194, 154, 99, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "Accept & Continue",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                   
                  ],
                ),
              ),
          )
          
          ],
        )));
  }
}
