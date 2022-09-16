import 'package:BubbleGum/appcomponent/HalifaxClone/models/AvailableMonth.dart';
import 'package:flutter/material.dart';

import 'components/HalifaxNav.dart';

//will show some details

class AccountDetails extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return AccountDetailsState();
  }
}

class AccountDetailsState extends State {
  List<AvailableMonth> availableMonths;

  @override
  void initState() {
    super.initState();
    availableMonths = [];

    availableMonths.add(AvailableMonth(label: "January", isSelected: false));

    availableMonths.add(AvailableMonth(label: "Febuary", isSelected: false));
    availableMonths.add(AvailableMonth(label: "March", isSelected: false));
    availableMonths.add(AvailableMonth(label: "April", isSelected: false));
    availableMonths.add(AvailableMonth(label: "May", isSelected: false));
    availableMonths.add(AvailableMonth(label: "June", isSelected: false));
    availableMonths.add(AvailableMonth(label: "July", isSelected: false));
    availableMonths.add(AvailableMonth(label: "August", isSelected: false));
    availableMonths.add(AvailableMonth(label: "Now", isSelected: true));
    availableMonths.add(AvailableMonth(label: "", isSelected: false));
    availableMonths = availableMonths.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Color.fromRGBO(234, 231, 234, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "T.javed- 2367",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(1, 63, 185, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ]),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "£0.62",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Balance after pending",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 24),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "£0.00",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Overdraft limit",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(4, 42, 120, 1),
            child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: availableMonths.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 110,
                    color: availableMonths[index].isSelected
                        ? Colors.white
                        : Color.fromRGBO(4, 42, 120, 1),
                    child: Center(
                      child: Text(
                        availableMonths[index].label,
                        style: TextStyle(
                            color: availableMonths[index].isSelected
                                ? Colors.blue
                                : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 4),
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(227, 224, 227, 1))),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.search,
                    size: 30,
                    color: Color.fromRGBO(23, 63, 158, 1),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(162, 159, 162, 1))),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(13),
            child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    "YOU HAVE PENDING TRANSACTIONS",
                    style: TextStyle(
                        color: Color.fromRGBO(28, 74, 117, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromRGBO(85, 162, 32, 1),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.withOpacity(0.2),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Text("Account balance:"),
              SizedBox(
                width: 3,
              ),
              Text(
                "£21.11",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.withOpacity(0.2),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        Container(
                          height: 58,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.blue.withOpacity(0.4))),
                                child: Center(
                                  child: Icon(
                                    Icons.credit_card,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("$index Aug 20"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "M JAVED $index AUGH20",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("£200.00"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "+ £200",
                                      style:
                                          TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                            ],
                          )),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: HalifaxNav(context: context,),
    );
  }
}
