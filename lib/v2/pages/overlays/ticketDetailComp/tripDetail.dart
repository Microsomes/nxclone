import 'package:flutter/material.dart';


class TripDetailModel extends StatefulWidget{
  @override
  _TripDetailModelState createState() => _TripDetailModelState();
}

class _TripDetailModelState extends State<TripDetailModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
                                            padding: EdgeInsets.all(12),
                                            alignment: Alignment.centerLeft,
                                            height: 140,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "TRIP",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          110, 110, 110, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        "tickettype",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    61,
                                                                    61,
                                                                    61,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                        "price",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    61,
                                                                    61,
                                                                    61,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                  color: Color.fromRGBO(
                                                      231, 231, 231, 1),
                                                ),
                                              ],
                                            ));
  }
}