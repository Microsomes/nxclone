import 'package:flutter/material.dart';

class TicketDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TicketDetailState();
  }
}

class TicketDetailState extends State<TicketDetail> {
  bool currentTicket = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                                Container(
                                    padding: EdgeInsets.all(12),
                                    alignment: Alignment.centerLeft,
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "VALID UNTIL",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  110, 110, 110, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "16 Oct 2020 23:59 ",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      61, 61, 61, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Container(
                                              height: 20,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      90, 90, 90, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(1))),
                                              child: Center(
                                                child: Text(
                                                  "99 DAYS LEFT",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          color:
                                              Color.fromRGBO(231, 231, 231, 1),
                                        ),
                                      ],
                                    )),
                                Container(
                                    padding: EdgeInsets.all(12),
                                    alignment: Alignment.centerLeft,
                                    height: 140,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "TRIP",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  110, 110, 110, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                "West Midlands Daysaver",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        61, 61, 61, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                "£4.00",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        61, 61, 61, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 17,
                                        ),
                                        Container(
                                          height: 1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          color:
                                              Color.fromRGBO(231, 231, 231, 1),
                                        ),
                                      ],
                                    )),
                                Container(
                                    padding: EdgeInsets.all(12),
                                    alignment: Alignment.centerLeft,
                                    height: 140,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "PURCHASE",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  110, 110, 110, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "20 JUL 2020 12:32  ",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          61, 61, 61, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Card ending in ****8690 ",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          61, 61, 61, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(),
                                            ),
                                            // Container(
                                            //   alignment:Alignment.center,
                                            //   height: 50,
                                            //   width: 90,
                                            //   decoration: BoxDecoration(

                                            //       borderRadius:
                                            //           BorderRadius.all(
                                            //               Radius.circular(1))),
                                            //   child: Padding(

                                            //     padding: EdgeInsets.only(top:20),

                                            //   child: Image.asset("images/v2/v2assets/visa.png",width: 90,)),
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          color:
                                              Color.fromRGBO(231, 231, 231, 1),
                                        ),
                                      ],
                                    )),
                                Container(
                                    padding: EdgeInsets.all(12),
                                    alignment: Alignment.centerLeft,
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "TICKET ID",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  110, 110, 110, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                "AT547215684",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        61, 61, 61, 1),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8,
                                          color:
                                              Color.fromRGBO(231, 231, 231, 1),
                                        ),
                                      ],
                                    )),
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
                                          color: Color.fromRGBO(77, 84, 137, 1),
                                          size: 18,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Back",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(58, 63, 103, 1),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 17.0),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.sort,
                                          color: Color.fromRGBO(74, 81, 133, 1),
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        "Terms",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(86, 94, 155, 1),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
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
    );
  }
}
