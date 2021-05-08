import 'dart:convert';

import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:BubbleGum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class TicketDetailIDModel extends StatefulWidget {

  final TicketWalletModel ticketWalletInfo;
  final TicketModel ticketDetail;


  TicketDetailIDModel({
    @required this.ticketWalletInfo,
    @required this.ticketDetail
  });



  @override
  _TicketDetailIDModelState createState() => _TicketDetailIDModelState();
}

class _TicketDetailIDModelState extends State<TicketDetailIDModel> {


  String generatedID;

  @override
  void initState() {
   
    setState(() {
      generatedID="AT3VYUNC57J";

  var bytes1 = utf8.encode(widget.ticketWalletInfo.id.toString());         // data being hashed
 var digest1 = sha256.convert(bytes1);         // Hashing Process
 print("Digest as bytes: ${digest1.bytes}");   // Print Bytes

    setState(() {
      generatedID="AT"+digest1.toString().substring(0,9).toUpperCase();
    });


    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "TICKET ID",
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
                    "$generatedID",
                    style: TextStyle(
                        color: Color.fromRGBO(61, 61, 61, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
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
