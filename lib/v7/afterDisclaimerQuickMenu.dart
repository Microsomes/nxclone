import 'package:BubbleGum/pages/journey/ticket.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/nxfront.dart';
import 'package:BubbleGum/v2/pages/ticket.dart';
import 'package:BubbleGum/v2/pages/ticketv2.dart';
import 'package:BubbleGum/v7/newAdvanced.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'settingSaver.dart';

class AfterDisclaimerModel {
  Image image;
  String title;
  String type;
  String subtitle;
  bool isSetting;
  AfterDisclaimerModel(
      {@required this.image,
      @required this.title,
      @required this.subtitle,
      @required this.isSetting,
      @required this.type});
}

class AfterDisclaimer extends StatefulWidget {
  @override
  _AfterDisclaimerState createState() => _AfterDisclaimerState();
}

class _AfterDisclaimerState extends State<AfterDisclaimer> {
  List<AfterDisclaimerModel> allOptions = new List();

  @override
  void initState() {
    super.initState();

    allOptions.add(new AfterDisclaimerModel(
        title: "Day Saver",
        isSetting: true,
        type: "dual",
        subtitle:
            "...",
        image: Image.asset(
          "images/v7/v7ticket.png",
        )));

    // allOptions.add(new AfterDisclaimerModel(
    //     title: "Group Day Saver",
    //             type: "normal",
    //     isSetting: true,
    //     subtitle:
    //         "A group of 5 people can use the bus (had it been real the app) with this app",
    //     image: Image.asset("images/v7/nog.png")));

    allOptions.add(new AfterDisclaimerModel(
        title: "Advanced Option",
        type: "normal",
        isSetting: false,
        subtitle: "Want a custom solution, requires more brains",
        image: Image.asset("images/v7/drill.png")));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
        //images/v7/supply-chain.png
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        print("legacy");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Ticket()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "OG NX Bus -> ",
                            style: GoogleFonts.roboto(color: Colors.white),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "images/v7/eggs.png",
                              width: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  Row(
                    children: [
                      TopImage(),
                      Expanded(
                        child: new Container(
                            child: Row(
                          children: <Widget>[
                            Flexible(
                                child: new Text("Welcome to BubbleGum 2022",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16))),
                          ],
                        )),
                      )
                    ],
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                     child: Text("Single Ticket", style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                     ),),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                     child: Text("Day Saver",style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                     ),),
                                  ),
                                )
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                            Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                     child: Text("View All Tickets", style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                     ),),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                     child: Text("Check Updates",style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                     ),),
                                  ),
                                )
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            color: Colors.black,
                          ),
                          Container(
                            color: Colors.black,
                          )
                        ]),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                            //first paramerter of offset is left-right
                            //second parameter is top to down
                          ),
                        ],
                        //you can set more BoxShadow() here

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ))
                ],
              )),
        ),
      ),
    );
  }
}

class TopImage extends StatefulWidget {
  const TopImage({
    Key key,
  }) : super(key: key);

  @override
  _TopImageState createState() => _TopImageState();
}

class _TopImageState extends State<TopImage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        new AnimationController(duration: Duration(seconds: 10), vsync: this);

    _animationController.forward(from: 0.0); // it starts the animation
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) => Nxfront()));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
          child: Image.asset(
            "images/v7/supply-chain.png",
            width: 100,
          ),
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String title;
  final Image image;
  final String subtitle;
  final Function onClick;
  final bool isSetting;

  const OptionWidget(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.image,
      @required this.onClick,
      @required this.isSetting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: image,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  this.onClick();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "$title",
                                style: GoogleFonts.roboto(fontSize: 30),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            subtitle != null ? Container(
                              alignment: Alignment.center,
                              child: Text(
                                "$subtitle",
                                style: GoogleFonts.roboto(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ):Container(),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            isSetting == false
                ? Container()
                : GestureDetector(
                    onTap: () {
                      print("settings...");

                      showDialog(
                          context: context,
                          builder: (ctx) => SettingSaver(
                                title: title,
                              ));
                    },
                    child: Container(
                        alignment: Alignment.topRight,
                        height: 100,
                        child: Icon(
                          Icons.settings,
                          color: Colors.grey,
                        )),
                  )
          ],
        ));
  }
}
