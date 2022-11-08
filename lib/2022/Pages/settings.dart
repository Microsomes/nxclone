import "package:flutter/material.dart";
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';


class SettingsPage extends StatefulWidget{
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final Box = GetStorage();

  var currentOption = null;

  var offlineSettings;

  var resetSettings;

  
  @override
  void initState() {
    super.initState();
      if (Box.read("ResetSettings") == null) {
      //donotreset
      Box.write("ResetSettings", "donotreset");
      setState(() {
        resetSettings = "donotreset";
      });
    } else {
      setState(() {
        resetSettings = Box.read("ResetSettings");
      });
    }

    if (Box.read("OfflineSettings") == null) {
      Box.write("OfflineSettings", "Offline");
      setState(() {
        offlineSettings = "Offline";
      });
    } else {
      setState(() {
        offlineSettings = Box.read("OfflineSettings");
      });
    }

    if (Box.read("BubbleGumSettings") == null) {
      Box.write("BubbleGumSettings", "bubblegumhome");
      setState(() {
        currentOption = "bubblegumhome";
      });
    } else {
      setState(() {
        currentOption = Box.read("BubbleGumSettings");
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(167, 27, 26, 1),
        title: Text("Settings"),
      ),
      body:CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                  Container(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Home page:",
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Spacer(),
                                          DropdownButton(
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                            onChanged: (e) {
                                              Box.write("BubbleGumSettings", e);
                                              setState(() {
                                                currentOption = e;
                                              });

                                              //restart app
                                              Phoenix.rebirth(context);
                                            },
                                            value: currentOption,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("Bubble Gum Home"),
                                                value: "bubblegumhome",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("NX Home"),
                                                value: "nxhome",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("Day Saver"),
                                                value: "DaySaver",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("Group DaySaver"),
                                                value: "Group DaySaver",
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "TIP: Changing this setting will restart the app, and will take you to a new home page you selected",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Reset On Launch:",
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Spacer(),
                                          DropdownButton(
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                            onChanged: (e) {
                                              Box.write("ResetSettings", e);
                                              setState(() {
                                                resetSettings = e;
                                              });

                                              //restart app
                                            },
                                            value: resetSettings,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("Do not reset"),
                                                value: "donotreset",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("Reset on launch"),
                                                value: "resetonlaunch",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "TIP: Activating this will delete all tickets and reset the app whenever you launch it",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Always online:",
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Spacer(),
                                          DropdownButton(
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                            onChanged: (e) {
                                              Box.write("OfflineSettings", e);
                                              setState(() {
                                                offlineSettings = e;
                                              });
                                            },
                                            value: offlineSettings,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("Offline"),
                                                value: "Offline",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("Always Online"),
                                                value: "Always Online",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "TIP: Always Online will result in more accuracy but requires internet connection, If you lose connection, the clone will switch to offline mode",
                                      style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "TIP: Long press on the menu button on the nx home page to come back to this page",
                                      style: GoogleFonts.roboto(
                                          fontSize: 13,
                                          color: Colors.black.withOpacity(0.7)),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text("V2022-23-The Bubble Update"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
              ],
            ),
          )
        ],
      )
    );
  }
}