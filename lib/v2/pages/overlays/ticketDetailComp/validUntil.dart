import 'package:bubble_gum/v3/models/ticketModel.dart';
import 'package:bubble_gum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';

class ValidUntilComp extends StatefulWidget {
  final TicketWalletModel ticketWalletInfo;
  final TicketModel ticketDetail;

  final bool isDaysLeft = true;

  ValidUntilComp(
      {@required this.ticketWalletInfo, @required this.ticketDetail});

  @override
  _ValidUntilCompState createState() => _ValidUntilCompState();
}

class _ValidUntilCompState extends State<ValidUntilComp> {
  String validUntil = "...";
  String expireON = "";
  int expiredDayLeft = 0;

  @override
  void initState() {
    if (widget.ticketWalletInfo.activeStatus == 1) {
      setState(() {
        validUntil = "VALID UNTIL";
        widget.ticketWalletInfo.validUntilHuman().then((value) {
          setState(() {
            expireON = value;
          });
        });
      });
    } else if (widget.ticketWalletInfo.activeStatus == -1) {
      print(widget.ticketWalletInfo.activeStatus);
      setState(() {
        widget.ticketWalletInfo.getTimeRemainingIdle().then((value) {
          print(value);
          setState(() {
            expiredDayLeft = value;
          });
        });

        validUntil = "VALID UNTIL";
        widget.ticketWalletInfo.getTimeRemainingIdleHuman2().then((value) {
          setState(() {
            expireON = value;
          });
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$validUntil",
              style: TextStyle(
                  color: Color.fromRGBO(110, 110, 110, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$expireON",
                  style: TextStyle(
                      color: Color.fromRGBO(61, 61, 61, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(height: 10),
                expiredDayLeft == 0
                    ? Container()
                    : Container(
                        height: 20,
                        width: 90,
                        decoration: BoxDecoration(
                            color: widget.isDaysLeft == true
                                ? Colors.blue
                                : Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(1))),
                        child: widget.isDaysLeft == true
                            ? Center(
                                child: Text(
                                  "$expiredDayLeft DAYS LEFT",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(),
                      ),
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
