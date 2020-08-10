import 'package:flutter/material.dart';
class TicketTwo extends StatelessWidget {

    final String state;
    final String tickettype;
    final int id;

   final String  whenActivated;
    TicketTwo({
     @required this.state,
     @required this.tickettype,
      @required this.id,
      this.whenActivated="Expires in 12 hours, 59 minutes"
    });

  @override
  Widget build(BuildContext context) {
    return Container(  
      child: Column(children: [
        Container(
          height: 30,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                "$state",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
              ),
              Expanded(
                child: Text(""),
              ),
              Text(
                "ACTIVE",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    fontSize: 14),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromRGBO(86, 183, 28, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Text(
                "$tickettype",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            )),
        SizedBox(
          height: 3,
        ),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width * 0.83,
          color: Color.fromRGBO(157, 194, 133, 1),
        ),
        SizedBox(height: 3,),
        Expanded(
          child: Text(""),
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 5),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:7.0),
                child: Image.asset(
                  "images/emg.png",
                  width: 20,
                ),
              ),
              SizedBox(width: 6,),
              Padding(
                padding: const EdgeInsets.only(bottom:7.0),
                child: Container(
                   height: 18,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 2
                    ),
                    child: Text("$whenActivated", style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),),
                  )),
              )
            ],
          ),
        ))
      ]),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
