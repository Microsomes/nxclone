import 'package:BlackPie/appcomponent/HalifaxClone/models/AvailableMonth.dart';
import 'package:flutter/material.dart';

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
    // TODO: implement initState
    super.initState();
    availableMonths = List<AvailableMonth>();

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
    availableMonths= availableMonths.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 231, 234, 1),
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
              itemBuilder: (context,index){
              return Container(
                height: 50,
                width: 110,
                color: availableMonths[index].isSelected ? Colors.white : Color.fromRGBO(4, 42, 120, 1),
                child: Center(
                  child: Text(availableMonths[index].label,
                  style: TextStyle(color: availableMonths[index].isSelected ? Colors.blue : Colors.white,fontWeight: FontWeight.bold),),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
