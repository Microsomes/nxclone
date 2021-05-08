import 'package:flutter/material.dart';

class TicketDetailIDModel extends StatefulWidget {
  @override
  _TicketDetailIDModelState createState() => _TicketDetailIDModelState();
}

class _TicketDetailIDModelState extends State<TicketDetailIDModel> {
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
                    "AT id",
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
