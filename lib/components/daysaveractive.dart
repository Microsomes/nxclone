import 'package:flutter/material.dart';
class ticketTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      
      child: Column(children: [
        Container(
          height: 26,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                "West Midlands",
                style: TextStyle(color: Colors.white),
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
              padding: const EdgeInsets.only(left: 15.0, top: 5),
              child: Text(
                "Daysaver",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            )),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width * 0.83,
          color: Color.fromRGBO(157, 194, 133, 1),
        ),
        Expanded(
          child: Text(""),
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 5),
          child: Row(
            children: <Widget>[
              Image.asset(
                "images/emg.png",
                width: 20,
              ),
              SizedBox(width: 6,),
              Container(
                 height: 25,
                alignment: Alignment.bottomCenter,
                child: Text("Expires in 12 hours, 59 minutes", style: TextStyle(

                  fontWeight: FontWeight.w700

                ),))
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
