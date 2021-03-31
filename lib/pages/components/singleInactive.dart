import 'package:BubbleGum/pages/ticketwallet/models/ticketType.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/pages/ticket.dart';

class SingleInactiveTicket extends StatelessWidget {
  final String ticketType;
  final String state;
  final int txdbid;
  final String ticketExpiryDate;
  //pre activation expiry date
  //ticket id is required

  final TicketModel ticketModel;

  final bool isUsed;

  const SingleInactiveTicket(
      {Key key,
      @required this.sizeW,
      @required this.ticketType,
      @required this.state,
      @required this.txdbid,
      @required this.ticketExpiryDate,
      @required this.isUsed,
      this.ticketModel
      })
      : super(key: key);

  final double sizeW;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ticket2(
              txdbid: txdbid,
            )));
      },
      child: Container(
          width: sizeW * 0.9,
          height: this.ticketModel!=null ? 95: 110,
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
                              fontWeight: FontWeight.bold, fontSize: 15,
                              color: Colors.black.withOpacity(0.2)
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
                      this.isUsed?"INACTIVE":"USED",
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
              Container(
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
