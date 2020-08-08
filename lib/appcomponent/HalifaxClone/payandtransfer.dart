import 'package:BlackPie/appcomponent/HalifaxClone/selectAccounts.dart';
import 'package:flutter/material.dart';

class PayandTransfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PayandTrasnferState();
  }
}

class PayandTrasnferState extends State<PayandTransfer> {
  void onchange(isk) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: null,
        title: Text(
          "Pay and transfer",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectAccount()));
            },
            child: Container(
              height: 85,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.23,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13, top: 16.0),
                      child: Text("From:"),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.folder_shared,
                              color: Color.fromRGBO(150, 3, 100, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "T.JAVED",
                              style: TextStyle(
                                  color: Color.fromRGBO(137, 40, 113, 1),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "11-10-72",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 1,
                              height: 10,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "10702367",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "£11,000",
                              style: TextStyle(
                                  color: Color.fromRGBO(30, 63, 132, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Icon(
                        Icons.chevron_right,
                        color: Color.fromRGBO(85, 117, 108, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.withOpacity(0.2),
          ),
          Container(
            height: 85,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13, top: 16.0),
                    child: Text("To:"),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.folder_shared,
                            color: Color.fromRGBO(150, 3, 100, 1),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "RAINY DAY",
                            style: TextStyle(
                                color: Color.fromRGBO(137, 40, 113, 1),
                                fontWeight: FontWeight.w900,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "11-64-14",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 1,
                            height: 10,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "23528763",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "£3,534.61",
                            style: TextStyle(
                                color: Color.fromRGBO(30, 63, 132, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Icon(
                      Icons.chevron_right,
                      color: Color.fromRGBO(85, 117, 108, 1),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.withOpacity(0.2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 18),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(227, 224, 227, 1))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "Amount:",
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(162, 159, 162, 1))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.withOpacity(0.2),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                "Make a standing order",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Container(),
              ),
              Switch(
                  value: false,
                  onChanged: onchange,
                  inactiveThumbColor: Color.fromRGBO(199, 204, 214, 1))
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 14),
            child: MaterialButton(
                height: 50,
                disabledColor: Color.fromRGBO(174, 147, 166, 1),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: null),
          )
        ],
      ),
    );
  }
}
