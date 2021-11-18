import 'package:BubbleGum/v2/pages/overlays/animationOverlaySettings.dart';
import 'package:flutter/material.dart';
import 'package:BubbleGum/v2/pages/defaultTicket.dart';
import 'package:BubbleGum/v2/pages/ejection.dart';
import 'package:BubbleGum/v2/pages/landingPage.dart';
import 'package:google_fonts/google_fonts.dart';

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
    quickOptions = [];
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
      "title": "NX-Animations",
      "icon": Icons.lightbulb_outline,
      "asset": "images/knowledge1.png",
      "useIcon": true
    });
    //quickOptions= quickOptions.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        child: ListView.builder(
            itemCount: quickOptions.length,
            itemBuilder: (context, index) {
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

                  if (index == 3) {
                    AnimationOverlay().display(context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: Text(
                        quickOptions[index]['title'][0],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    title: Text(quickOptions[index]['title'],
                        style: GoogleFonts.acme(
                            fontSize: 20, color: Colors.white)),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
