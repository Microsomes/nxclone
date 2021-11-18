import 'dart:io';

import 'package:BubbleGum/setupMain.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/defaultTicket.dart';
import 'package:BubbleGum/v2/pages/ejection.dart';
import 'package:BubbleGum/v2/pages/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/termsOfUseNotice.dart';

class SetupFlow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SetupFlowState();
  }
}

class SetupFlowState extends State<SetupFlow> {
  PageController pageController;

  String currentNextButtonLabel = "NEXT";

  int currentPageIndex = 0;

  bool showNextButton = true;
  //flag to decide if the next button should show

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
    pageController.addListener(() {});

    if (currentPageIndex == 0) {
      setState(() {
        currentNextButtonLabel = "I ACCEPT AND AGREE";
        showNextButton = false;
        //hide the next button since we will let the flow
        //get handled by the widgets own button
      });
    }
  }

  void pageChanged(int currentPage) {
    setState(() {
      currentPageIndex = currentPage;
    });
    if (currentPage == 4) {
      setState(() {
        currentNextButtonLabel = "FINISH";
      });
    } else {
      setState(() {
        currentNextButtonLabel = "NEXT";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            physics: new NeverScrollableScrollPhysics(),
            onPageChanged: pageChanged,
            controller: pageController,
            children: <Widget>[
              Container(
                  child: TermesOfUseP(
                onaccept: () {
                  //since its accepted lets register that
                  Map details = Map();
                  details['value'] = "accepted";
                  details['dateaccepted'] =
                      DateTime.now().millisecondsSinceEpoch;
                  NXHelp()
                      .saveConfig("disclaimer_accepted", details.toString())
                      .then((value) {
                    //since its accepted lets move to the next panel
                    pageController.nextPage(
                        duration: Duration(seconds: 1), curve: Curves.ease);
                    setState(() {
                      showNextButton = true;
                    });
                  });
                },
                ondisconnect: () {
                  exit(0);
                },
              )),
              LandingPage(
                shallRestart: false,
              ),
              DefaultTicket(),
              Ejection(),
              Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Welcome from BubbleGum, hope you enjoy our app",
                      style:
                          GoogleFonts.acme(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.thumb_up,
                      size: 50,
                      color: Colors.white,
                    )
                  ],
                )),
              )
            ],
          ),
        ),
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              showNextButton == true
                  ? Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 5),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            color: Colors.white,
                            onPressed: () {
                              if (currentPageIndex == 0) {
                                //since its accepted lets register that
                                Map details = Map();
                                details['value'] = "accepted";
                                details['dateaccepted'] =
                                    DateTime.now().millisecondsSinceEpoch;

                                NXHelp()
                                    .saveConfig("disclaimer_accepted",
                                        details.toString())
                                    .then((value) {
                                  //since its accepted lets move to the next panel
                                  pageController.nextPage(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.ease);
                                });
                              }
                              if (currentNextButtonLabel == "FINISH") {
                                //Phoenix.rebirth(context);
                                //lets just simulate going to nxfront first
                                print("finished");

                                SharedPreferences.getInstance()
                                    .then((prefInstance) {
                                  prefInstance.setInt(
                                      SharedPrefKeys.setupKey, 1);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StartScreenSetup()));
                                });
                              } else {
                                pageController.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.ease);
                              }
                            },
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "$currentNextButtonLabel",
                                  style: GoogleFonts.acme(color: Colors.black),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                )
                              ],
                            )),
                      ),
                    )
                  : Container()
            ],
          ),
        )
      ],
    ));
  }
}
