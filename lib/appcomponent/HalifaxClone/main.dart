import 'package:BlackPie/appcomponent/HalifaxClone/accountDetails.dart';
import 'package:flutter/material.dart';

import 'components/HalifaxNav.dart';

class Halifax extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HalifaxState();
  }
}

class HalifaxState extends State<Halifax> {
  void _onItemTapped(index) {}

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
          InkWell(
            onTap: (){
              print("open t.javed");
              //AccountDetails
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> AccountDetails()
              ));
            },
                      child: Container(
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
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Not sure? Don't click.",
                        style: TextStyle(
                            color: Color.fromRGBO(82, 135, 184, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Never click on links you don't trust."),
                      SizedBox(
                        height: 1,
                      ),
                      Text("It could give someone access to"),
                      SizedBox(
                        height: 1,
                      ),
                      Text("your device."),
                      Expanded(
                        child: Container(),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Learn more",
                            style: TextStyle(
                                color: Color.fromRGBO(93, 127, 163, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Color.fromRGBO(100, 142, 181, 1),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  height: 150,
                  width: 100,
                  color: Colors.white,
                  child: Image.asset("images/v3/staysafe.png"),
                )
              ],
            ),
          ),
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
                                "RAINY DAY",
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
                                    "11-64-14",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "23528763",
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
                              "£3,534.61",
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
                                "AMAZON JOB NOV 2018",
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
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 18,
                            ),
                            Text(
                              "NIL",
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
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: HalifaxNav(),
    );
  }
}
