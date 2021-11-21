import 'package:bubble_gum/piHome.dart';
import 'package:flutter/material.dart';
import 'package:bubble_gum/v2/pages/nxfront.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bubble_gum/v2/helper/NxHelp.dart';

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
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "PI HOME",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlue,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => PiHome()));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
