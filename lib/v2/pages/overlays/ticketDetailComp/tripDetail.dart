import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:BubbleGum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripDetailModel extends StatefulWidget {
  final TicketWalletModel ticketWalletInfo;
  final TicketModel ticketDetail;

  TripDetailModel(
      {@required this.ticketWalletInfo, @required this.ticketDetail});

  @override
  _TripDetailModelState createState() => _TripDetailModelState();
}

class _TripDetailModelState extends State<TripDetailModel> {
  String ticketTitle = "fs";

  String price = "fds";

  @override
  void initState() {
    setState(() {
      ticketTitle =
          widget.ticketDetail.state + " " + widget.ticketDetail.tickettitle;
      price = widget.ticketDetail.price;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left:12,right:12),
        alignment: Alignment.centerLeft,
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "TRIP",
              style: TextStyle(
                  color: Color.fromRGBO(110, 110, 110, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "$ticketTitle",
                    style: GoogleFonts.roboto(
                        color: Color.fromRGBO(61, 61, 61, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                    )
                  ),
                  
                ),
                Text(
                    "£$price",
                    style: GoogleFonts.roboto(
                      color: Color.fromRGBO(61, 61, 61, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                    )
                  ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            
            SizedBox(
              height: 17,
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.height * 0.8,
              color: Color.fromRGBO(231, 231, 231, 1),
            ),
          ],
        ));
  }
}
