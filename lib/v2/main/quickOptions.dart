import 'package:flutter/material.dart';
import 'package:BlackPie/v2/pages/defaultTicket.dart';
import 'package:BlackPie/v2/pages/ejection.dart';
import 'package:BlackPie/v2/pages/landingPage.dart';

class QuickOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuickOptionState();
  }
}

class _QuickOptionState extends State<QuickOptions> {
  List quickOptions;
  @override
  void initState() {
    super.initState();
    quickOptions = new List();
    quickOptions.add({
      "title": "Landing Page",
      "icon": Icons.settings,
      "asset": "images/landing1.png"
    });
    quickOptions.add({
      "title": "Default Ticket Page",
      "icon": Icons.settings_applications,
      "asset": "images/ticket1.png"
    });
    quickOptions.add({
      "title": "Ejection Settings",
      "icon": Icons.settings_bluetooth,
      "asset": "images/ejection1.png"
    });
    quickOptions.add({
      "title": "Knowledge Base",
      "icon": Icons.settings_input_antenna,
      "asset": "images/knowledge1.png"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(quickOptions.length, (index) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DefaultTicket()),
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ejection()),
                    );
                  }
                },
                child: Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), boxShadow: []),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(110),
                        color: Colors.lightGreen,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Image.asset(
                                quickOptions[index]['asset'],
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                            ),
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            quickOptions[index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
