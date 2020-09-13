import 'package:flutter/material.dart';
import 'package:BlackPie/v2/pages/nxfront.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}

class SettingsState extends State<Settings> {
  String defaultHomePage = "";

  Future getDefaultPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("defaultPage");
  }

  Future setHomePage(String homePage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("defaultPage", homePage);
  }

  NXHelp helpNx;

  @override
  void initState() {
    super.initState();

    helpNx = NXHelp();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Nxfront()),
        );
        return;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text("Settings"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Choose which page to load by default",
                  style: GoogleFonts.acme(
                    color: Colors.white,
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future: getDefaultPage(),
                      builder: (context, snapshot) {

                        if (snapshot.connectionState == ConnectionState.done) {
                        }
                        return Text("Current " + snapshot.data.toString(),
                        style: GoogleFonts.acme(
                          color: Colors.white,
                          fontSize: 20
                        ),
                        );
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    dropdownColor: Colors.white,
                      items: <String>['precaution', 'home page', 'ticket page']
                          .map((String value) {
                        return new DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (a) {

                        //map to v2
                        if (a == "precaution") {
                          helpNx.saveConfig("defaulthomepage", "home");
                        } else if (a == "ticket page") {
                          helpNx.saveConfig("defaulthomepage", "ticket");
                        } else {
                          //default to home page
                          helpNx.saveConfig("defaulthomepage", "home");
                        }

                        setHomePage(a).then((onValue) {
                          Phoenix.rebirth(context);
                        });

                        setState(() {
                          defaultHomePage = a;
                        });
                      }),
                  MaterialButton(
                    child: Text(
                      "Delete all Tickets",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlue,
                    onPressed: () {
                      NXHelp().deleteAllTickets();
                      Phoenix.rebirth(context);
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
