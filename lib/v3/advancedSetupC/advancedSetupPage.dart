import 'dart:async';

import 'package:BubbleGum/main.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/models/sharedprefkey/main.dart';
import 'package:BubbleGum/v3/advancedSetupC/options/defaultHomePageOption.dart';
import 'package:BubbleGum/v3/advancedSetupC/options/ejectionSettingOption.dart';
import 'package:BubbleGum/v7/afterDisclaimerQuickMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'options/defaultTicketOption.dart';

class AdvancedSetupPage extends StatefulWidget {
  final bool hideDetails;

  AdvancedSetupPage({this.hideDetails = false});

  @override
  _AdvancedSetupPageState createState() => _AdvancedSetupPageState();
}

class DefHome {
  String pageName;
  int pageid;
  DefHome({@required this.pageName, @required this.pageid});
}

class _AdvancedSetupPageState extends State<AdvancedSetupPage> {
  List<DefHome> allPageOptions;
  int defaultHomeIndex = 0;
  int defaultTicketID;

  //controls the disclaimer options
  bool isDisclaimer = false;

  //controls the set ejection settings
  String defaultEjectionID;

  bool isReadySetup = false;

  bool defHome = false;
  bool defTicket = false;
  bool defEjection = false;

  Timer mainTimer;

  int fontSize = 20;
  //global font size

  @override
  void dispose() {
    if (mainTimer != null) {
      mainTimer.cancel();
    }
    super.dispose();
  }

  void checkSettingState() {
    if (defHome && defTicket && defEjection) {
      if (isDisclaimer) {
        setState(() {
          isReadySetup = true;
        });
      }
    }
  }

  @override
  void initState() {
    //load default home pref

    SharedPreferences.getInstance().then((value) {
      if (value.getString(SettingsPrefKeys.EJECTION_SETTING_KEY) != null) {
        setState(() {
          defaultEjectionID =
              value.getString(SettingsPrefKeys.EJECTION_SETTING_KEY);
        });
      }

      int def = value.getInt("default_home");
      if (def != null) {
        setState(() {
          defaultHomeIndex = def;
        });
      }

      bool isDis = value.getBool(SettingsPrefKeys.DISCLAIMER_KEY);

      if (isDis != null) {
        setState(() {
          isDisclaimer = isDis;
        });
      }
    });

    allPageOptions = [];

    allPageOptions.add(DefHome(pageName: "Home", pageid: 0));
    allPageOptions.add(DefHome(pageName: "NX Home", pageid: 1));
    allPageOptions.add(DefHome(pageName: "Ticket", pageid: 2));

    super.initState();
  }

  var isV6 = false;
  //dirty code

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: SingleChildScrollView(
        child: isV6 == true
            ? Container()
            : Column(
                children: [
                  isDisclaimer == false
                      ? Container()
                      : Text(
                          "NOTE. Emergency patch commencing. 12/6/2021 We have updated the app and only the Anytime daysaver is advisable. Click the recommended config button to continue. Or you can yolo it up to you",
                          style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                  isDisclaimer == false
                      ? Container()
                      : TextButton(
                          onPressed: () async {
                            setState(() {
                              isV6 = true;
                            });
                            var anytime = await NXHelp().getTicketsByTag("V6");
                            var anytimeid = anytime[0]['id'];

                            //set default home on behalf of user
                            SharedPreferences.getInstance().then((pref) {
                              //sets default home page
                              pref.setString("def_home_adv", "sim_ticket_view");

                              //sets default ticket
                              pref.setInt("def_ticket_adv_id", anytimeid);
                              pref.setString("def_ticket_adv_name",
                                  anytime[0]['tickettitle']);
                              pref.setString(
                                  "def_ticket_adv_state", anytime[0]['state']);

                              //set ejection settings
                              pref.setString("ejected_setting_adv", "nothing");
                            });

                            Future.delayed(Duration(seconds: 1), () {
                              setState(() {
                                isV6 = false;
                              });
                            });
                          },
                          child: Text("V6 Patch Default<- Highly Recommended"),
                        ),
                  widget.hideDetails
                      ? Container()
                      : SizedBox(
                          height: 0,
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.hideDetails
                          ? Container()
                          : SizedBox(
                              width: 30,
                            ),
                      widget.hideDetails
                          ? Container()
                          : (isDisclaimer == true)
                              ? Container()
                              : Text("",
                                  style: GoogleFonts.roboto(
                                      fontSize: 30, color: Colors.white),
                                  textAlign: TextAlign.center)
                    ],
                  ),
                  SizedBox(height: 2),
                  SizedBox(height: 5),
                  widget.hideDetails
                      ? Container()
                      : (isDisclaimer == true)
                          ? Container()
                          : Container(
                              alignment: Alignment.center,
                              child: Text(
                                "This App requires you to firstly agree with the Legal disclaimer. You will not use this App for any illegal purposes.",
                                style: GoogleFonts.roboto(
                                    fontSize: fontSize.toDouble(),
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                  SizedBox(height: 20),
                  isDisclaimer != true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                    left: 50, right: 50, top: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 2, color: Colors.yellow),
                                    boxShadow: []),
                                child: Stack(children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Please understand this clone app is for educational purposes only!",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold,
                                          fontSize: fontSize.toDouble(),
                                          color: Colors.white),
                                    ),
                                  )
                                ])),
                            SizedBox(
                              height: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.green)
                                  ),
                                  child: Text(
                                    "I Accept",
                                    style: GoogleFonts.roboto(
                                      fontSize: fontSize.toDouble(),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    SharedPreferences.getInstance()
                                        .then((value) {
                                      value.setBool("setup_disclaimer", true);
                                      //set the value
                                    });
                                    print("Accept Disclaimer");
                                    setState(() {
                                      isDisclaimer = true;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AfterDisclaimer()));
                                  },
                                ),
                                SizedBox(height:20),
                                TextButton(
                                  style:ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white)
                                  ),
                                  child: Text(
                                    "I don't accept",
                                    style: GoogleFonts.roboto(
                                      fontSize: fontSize.toDouble(),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () {
                                    print("i do not accept");
                                    SystemNavigator.pop();
                                  },
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            
                          ],
                        )
                      : Column(
                          children: [
                            Text("We"),
                            SizedBox(
                              height: 40,
                            ),
                            widget.hideDetails
                                ? Container()
                                : Text(
                                    "(Now just click on the yellow buttons to set your default home, default ticket and ejection settings.)",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                  DefaultHomePageOption(
                    onDone: () {
                      print("default home page is done");
                      setState(() {
                        defHome = true;
                        this.checkSettingState();
                      });
                    },
                    isDisclaimer: isDisclaimer,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTicketOption(
                    onDone: () {
                      setState(() {
                        defTicket = true;
                        this.checkSettingState();
                      });
                    },
                    isDisclaimer: isDisclaimer,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  EjectionSetOption(
                    isDisclaimer: isDisclaimer,
                    onDone: () {
                      setState(() {
                        defEjection = true;
                        this.checkSettingState();
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isReadySetup != true
                      ? Container()
                      : TextButton(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Continue",
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 20,
                              )
                            ],
                          ),
                          onPressed: () {
                            print("continue");

                            SharedPreferences.getInstance().then((pref) {
                              pref.setBool(
                                  SettingsPrefKeys.START_UP_SETUP, true);
                              //flag first time setup is completed
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => HomePagePre()));
                          },
                        ),
                  Text("Note: V6")
                ],
              ),
      ),
    );
  }
}
