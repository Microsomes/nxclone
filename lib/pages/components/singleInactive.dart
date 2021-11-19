import 'package:bubble_gum/v2/helper/NxHelp.dart';
import 'package:bubble_gum/v3/models/ticketModel.dart';
import 'package:bubble_gum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';
import 'package:bubble_gum/v2/pages/ticket.dart';

class SingleInactiveTicket extends StatefulWidget {
  final int id;

  final bool isUsed;

  const SingleInactiveTicket({
    Key key,
    @required this.id,
    @required this.isUsed,
  }) : super(key: key);

  @override
  _SingleInactiveTicketState createState() => _SingleInactiveTicketState();
}

class _SingleInactiveTicketState extends State<SingleInactiveTicket> {
  String state = "nkjnkj";
  String ticketType = "kjbjhb";
  String ticketExpiryDate = "nkj";

  @override
  void initState() {
    NXHelp().getTicketWalletInfoByID(id: widget.id).then((value) {
      List<TicketWalletModel> alT = value;
      alT[0].getTicketData().then((value) {
        TicketModel tikData = value;
        setState(() {
          state = tikData.state;
          ticketType = tikData.tickettitle;
          alT[0].getTimeRemainingHuman().then((value) {
            setState(() {
              ticketExpiryDate = value;
            });
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Ticket2(
                      txdbid: widget.id,
                    )));
      },
      child: Container(
          width: sizeW * 0.9,
          height: widget.isUsed ? 90 : 110,
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
                          ),
                        ),
                        Text(
                          "$ticketType",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
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
                      this.widget.isUsed != true ? "INACTIVE" : "USED",
                      style: TextStyle(
                          color: Color.fromRGBO(211, 211, 211, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              Container(
                width: sizeW * 0.8,
                height: 2,
                color: Color.fromRGBO(211, 211, 211, 0.6),
              ),
              Expanded(
                child: Text(""),
              ),
              widget.isUsed == true
                  ? Container()
                  : Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Expires $ticketExpiryDate",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
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
