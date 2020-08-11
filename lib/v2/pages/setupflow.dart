import 'package:BlackPie/v2/pages/defaultTicket.dart';
import 'package:BlackPie/v2/pages/ejection.dart';
import 'package:BlackPie/v2/pages/landingPage.dart';
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

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
    pageController.addListener(() {});
  }

  void pageChanged(int currentPage) {
    if (currentPage == 2) {
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
            onPageChanged: pageChanged,
            controller: pageController,
            children: <Widget>[
              LandingPage(
                shallRestart: false,
              ),
              DefaultTicket(),
              Ejection()
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
