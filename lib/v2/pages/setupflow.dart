import 'package:BlackPie/v2/pages/defaultTicket.dart';
import 'package:BlackPie/v2/pages/ejection.dart';
import 'package:BlackPie/v2/pages/landingPage.dart';
import 'package:BlackPie/v2/pages/slashScreenOption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

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

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
    pageController.addListener(() {});
  }

  void pageChanged(int currentPage) {
    setState(() {
      currentPageIndex = currentPage;
    });
    if (currentPage == 5) {
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
                child: Center(
                    child: Text(
                  "This app is intended soley for educational purposes, i am not resposible for its uses, by clicking next you agree to these terms",
                  textAlign: TextAlign.center,
                )),
              ),
              SlashScreenOptions(shallRestart: false,),
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
                      Text("Welcome from blackpie, hope you enjoy our app"),
                      SizedBox(height: 10,),
                      Icon(Icons.thumb_up,size: 50,color: Colors.lightBlue,)
                    ],
                  )
                ),
              )
            ],
          ),
        ),
        Container(
          height: 40,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 5),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (currentNextButtonLabel == "FINISH") {
                        Phoenix.rebirth(context);
                      } else {
                        pageController.nextPage(
                            duration: Duration(seconds: 1), curve: Curves.ease);
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          "$currentNextButtonLabel",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        )
                      ],
                    )),
              )
            ],
          ),
        )
      ],
    ));
  }
}
