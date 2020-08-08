import 'package:flutter/material.dart';

class Halifax extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HalifaxState();
  }
}

class HalifaxState extends State<Halifax> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(1, 63, 185, 1),
      ),
      backgroundColor: Color.fromRGBO(234, 231, 234, 1),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(0),
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "images/v3/halifax.png",
                            width: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "T.JAVED",
                                style: TextStyle(
                                    color: Color.fromRGBO(137, 40, 113, 1),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "11-10-72",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "10702367",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 30,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 58,
                            ),
                            Text(
                              "£11,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                    alignment: Alignment.topCenter,
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Color.fromRGBO(38, 73, 157, 1),
                        ),
                        onPressed: () {},
                      ),
                    ))
              ],
            ),
          ),

          
        ],
      ),
    );
  }
}
