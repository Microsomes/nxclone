import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TermsConditionsState();
  }
}

class TermsConditionsState extends State<TermsConditions> {
  bool currentTicket = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: currentTicket != null
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, top: 10),
                            child: Text(
                              "Close",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: ListView(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "TERMS",
                                      style: TextStyle(
                                          color: Color.fromRGBO(110, 110, 110, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),

                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("You must be over 16 to purchase this type of ticket",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18
                                  ),),
                                  SizedBox(height:25),
                                  Text("Valid for a single journey on all National Express West Midlands and National Express Conventry busses.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18
                                  ),),
                                  SizedBox(height:25),
                                  Text("Tickets must be used within 7 days of purchase.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18
                                  ),),
                                  SizedBox(height:25),
                                  Text("MTickets must be able to be displayed throughout the journey if requeste",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18
                                  ),),
                                  SizedBox(height:25),
                                  Text("Full mTicket terms and Conditions can be found at nxbus.co.uk/mticket and also subject to our Conditions of Carriage",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18
                                  ),),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            color:
                                                Color.fromRGBO(77, 84, 137, 1),
                                            size: 18,
                                          ),
                                          onPressed: () {},
                                        ),
                                        Text(
                                          "Back",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  58, 63, 103, 1),
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
