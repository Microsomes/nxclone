import 'package:BubbleGum/pages/ticketwallet/models/ticketType.dart';
import 'package:BubbleGum/v2/pages/usedTicketPage.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/pages/ticket.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleHistoryInactive extends StatelessWidget {
  final String ticketType;
  final String state;
  final int txdbid;
  final String ticketExpiryDate;
  //pre activation expiry date
  //ticket id is required

  final TicketModel ticketModel;

  final bool isUsed;

  const SingleHistoryInactive(
      {Key key,
      @required this.sizeW,
      @required this.ticketType,
      @required this.state,
      @required this.txdbid,
      @required this.ticketExpiryDate,
      @required this.isUsed,
      this.ticketModel})
      : super(key: key);

  final double sizeW;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UsedTicketPage(
                      txdbid: txdbid,
                    )));
      },
      child: Container(
          width: sizeW * 0.9,
          height: this.ticketModel != null ? 95 : 110,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "$state",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        Text(
                          "$ticketType",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.3)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(""),
                  ),
                  Container(
                    height: 40,
                    child: Text(
                      this.isUsed ? "INACTIVE" : "USED",
                      style: TextStyle(
                          color: Color.fromRGBO(211, 211, 211, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: sizeW,
                      height: 2,
                      color: Color.fromRGBO(211, 211, 211, 0.6),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Expanded(
                child: Text(""),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Used "+ticketModel.purchaseDate,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.red)),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          )),
    );
  }
}
