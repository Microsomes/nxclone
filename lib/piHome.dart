import 'dart:math';

import 'package:BubbleGum/v3/models/ticketModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'components/piHomeOptions.dart';
import 'v2/helper/NxHelp.dart';
import 'v2/main/quickOptions.dart';
import 'v2/pages/nxfront.dart';
import 'v2/pages/setupflow.dart';
import 'v2/pages/ticket.dart';
import 'v2/pages/ticketv2.dart';
import 'v3/newSetup.dart';
import 'package:random_color/random_color.dart';

class PiHome extends StatefulWidget {
  final bool isHide;

  PiHome({this.isHide});

  @override
  State<StatefulWidget> createState() {
    return PiHomeState();
  }
}

class PiHomeState extends State<PiHome> {
  var idO;
  bool isShowing = true;
  var ticketType = [
    "West Midlands",
    "Singles",
    "Day",
    "Last Used",
    "Group",
    "Metro",
    "Test"
  ];

  List<Map> ticketTypes;

  var selectedTicket = "West Midlands";

  var selectedTicketIndex = 0;

  Color scaffCol = Colors.black;
  Color textCol = Colors.white;

  bool showDisclaimer = true;

  List<Map> filteredTickets;
  @override
  void initState() {
    //load the prefs

    SharedPreferences.getInstance().then((value) {
      String homeCol = value.getString("home_col");

      bool hideDisclaimer = value.getBool("hide_disclaimer");

      if (hideDisclaimer != null) {
        if (hideDisclaimer) {
          setState(() {
            showDisclaimer = false;
          });
        } else {
          setState(() {
            showDisclaimer = true;
          });
        }
      }

      if (homeCol != null) {
        print(homeCol);
        Color newColor = Color(int.parse(homeCol));
        setState(() {
          setState(() {
            scaffCol = newColor;
            textCol = scaffCol.computeLuminance() >= 0.5
                ? Colors.black
                : Colors.white;
          });
        });
      }
    });

    super.initState();

    ticketTypes = List<Map>();

    ticketTypes.add({"Name": "West Midlands", "Icon": Icons.track_changes});
 
    ticketTypes.add({"Name": "Singles", "Icon": Icons.track_changes});

    ticketTypes.add({"Name": "Day", "Icon": Icons.dynamic_feed});

    ticketTypes.add({"Name": "Last Used", "Icon": Icons.history});

    ticketTypes.add({"Name": "Group", "Icon": Icons.group});

    ticketTypes.add({"Name": "Metro", "Icon": Icons.train});

    ticketTypes.add({"Name": "Test", "Icon": Icons.track_changes});

    NXHelp().getTicketByState("West Midlands").then((westMidlands) {
      setState(() {
        filteredTickets = westMidlands;
      });
    });

    // NXHelp().getTicketsByTag(selectedTicket).then((ticker) {
    //   setState(() {
    //     filteredTickets = ticker;
    //   });
    // });
  }

  void showHideDisclaimerDialog() {
    showDialog(
        context: context,
        builder: (ctx) => HideDisclaimerDialog(
              onval: (val) {
                if (val) {
                      Fluttertoast.showToast(
            msg: "Click the title to change the value",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: scaffCol,
            textColor: textCol,
            fontSize: 16.0
        );

        Navigator.pop(context);
                  setState(() {
                    showDisclaimer = false;
                  });
                } else {
                  setState(() {
                    showDisclaimer = true;
                  });
                }
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //well were not going back so block that request
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: GestureDetector(
              onTap: () {
                print("Show Disclaimer");
                showHideDisclaimerDialog();
              },
              child: Text(
                "Bubble Gum Clone App",
                style: GoogleFonts.roboto(
                    color: textCol, fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: scaffCol,
            leading: Container(),
            actions: [
              GestureDetector(
                onTap: () {
                  print("Show color selector");

                  showDialog(
                      context: context,
                      builder: (ctx) => ColorSelectorDIalog(
                            picColor: (Color col) {
                              SharedPreferences.getInstance().then((value) {
                                value.setString(
                                    "home_col", col.value.toString());
                              });
                              setState(() {
                                scaffCol = col;
                                textCol = scaffCol.computeLuminance() >= 0.5
                                    ? Colors.black
                                    : Colors.white;
                              });
                              print(col);
                            },
                          ));
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 0),
                    child: CircleAvatar(
                        radius: 13, backgroundColor: scaffCol.withGreen(20)),
                  ),
                ),
              )
                ,
                
                widget.isHide ?Container(): IconButton(
                icon: Icon(Icons.settings,color:Colors.white),
                onPressed: (){
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewSetupv3(
                                      hideDetails: true,
                                    )),
                              );
                },
              ),
            ],
          ),
          backgroundColor: scaffCol,
          body: SafeArea(
              child: Column(
            children: <Widget>[
              Expanded(
                child: Column(children: [
                  widget.isHide == true
                      ? Container()
                      : PiHomeOptions(
                          textColor: textCol,
                        ),
                  Expanded(
                      flex: 2,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                color: Colors.white.withOpacity(0.1),
                                child: Center(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: ticketType.length,
                                    shrinkWrap: true,
                                    itemBuilder: (ctx, index) {
                                      return InkWell(
                                        onTap: () {
                                          print("$index");
                                          setState(() {
                                            selectedTicketIndex = index;
                                          });
                                          setState(() {
                                            selectedTicket = ticketType[index];

                                            if (selectedTicket ==
                                                "West Midlands") {
                                              NXHelp()
                                                  .getTicketByState(
                                                      "West Midlands")
                                                  .then((westMidlands) {
                                                setState(() {
                                                  filteredTickets =
                                                      westMidlands;
                                                });
                                              });
                                            } else {
                                              NXHelp()
                                                  .getTicketsByTag(
                                                      selectedTicket)
                                                  .then((ticker) {
                                                setState(() {
                                                  filteredTickets = ticker;
                                                });
                                              });
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: selectedTicket ==
                                                      ticketType[index]
                                                  ? Colors.orangeAccent
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          margin: EdgeInsets.all(10),
                                          width: selectedTicket ==
                                                  ticketType[index]
                                              ? 100
                                              : 50,
                                          height: 50,
                                          child: Center(
                                              child: Text(
                                            ticketTypes[index]["Name"],
                                            style: GoogleFonts.roboto(
                                                color: selectedTicket ==
                                                        ticketType[index]
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: selectedTicket ==
                                                        ticketType[index]
                                                    ? 12
                                                    : 8),
                                            textAlign: TextAlign.center,
                                          )),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    this.selectedTicket,
                                    style: GoogleFonts.roboto(
                                        color: textCol,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              filteredTickets != null
                                  ? Expanded(
                                      child: ListView.builder(
                                        itemCount: filteredTickets.length,
                                        itemBuilder: (ctx, index) {
                                          return Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: ListTile(
                                              onTap: () {
                                                // print("Go to the ticket page");
                                                // var ticketType =
                                                //     filteredTickets[index]
                                                //         ['tickettitle'];
                                                // var ticketState =
                                                //     filteredTickets[index]
                                                //         ['state'];
                                                int id= filteredTickets[index]['id'];
                                                NXHelp().buyTicketv2(ticketID: id, tag: "non_sim").then((valid) {
                                                  
                                                  NXHelp().activeTicketv2(id: valid).then((value) {
                                                       Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ActualTicket(
                                                                  txid:
                                                                      valid)));
                                                  });
                                                  
                                                });


                                              
                                              },
                                              leading: Container(
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  color: Colors.orangeAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    this.ticketTypes[this
                                                            .selectedTicketIndex]
                                                        ["Icon"],
                                                    color: textCol,
                                                    size: 40,
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                filteredTickets[index]
                                                    ["tickettitle"],
                                                style: GoogleFonts.roboto(
                                                    color: textCol,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                filteredTickets[index]["state"],
                                                style: GoogleFonts.roboto(
                                                    color: textCol,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Container()
                            ],
                          ))),
                  showDisclaimer == true
                      ? GestureDetector(
                          onTap: () {
                            print("remove disclaimer");
                           showHideDisclaimerDialog();
                          },
                          child: Text(
                            "Educational Purposes Only, Demonstration only. Please do not use this application to really fool the drivers. You might get in serious trouble.",
                            style: GoogleFonts.roboto(
                                color: textCol, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container()
                ]),
              ),
              isShowing == true
                  ? Container(
                      height: 10,
                      color: Colors.black,
                    )
                  : Container(),
            ],
          ))),
    );
  }
}

class HideDisclaimerDialog extends StatefulWidget {
  final Function onval;

  const HideDisclaimerDialog({
    @required this.onval,
    Key key,
  }) : super(key: key);

  @override
  _HideDisclaimerDialogState createState() => _HideDisclaimerDialogState();
}

class _HideDisclaimerDialogState extends State<HideDisclaimerDialog> {
  bool isHideDialog = false;


  @override
  void initState() {
   
    SharedPreferences.getInstance().then((value) {
      if(value.getBool("hide_disclaimer")!=null){
        setState(() {
          isHideDialog=value.getBool("hide_disclaimer");
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Hide Disclaimer",
        style: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: Container(
        height: 300,
        child: Column(
          children: [
            Text(
              "You are about to hide the educational disclaimer",
              style: GoogleFonts.roboto(color: Colors.white),
            ),
            Switch(
              onChanged: (val) {
                widget.onval(val);
                SharedPreferences.getInstance().then((value) {
                  value.setBool("hide_disclaimer", val);
                });

                setState(() {
                  isHideDialog = val;
                });
              },
              value: isHideDialog,
            )
          ],
        ),
      ),
    );
  }
}

class ColorSelectorDIalog extends StatefulWidget {
  final Function picColor;

  const ColorSelectorDIalog({
    @required this.picColor,
    Key key,
  }) : super(key: key);

  @override
  _ColorSelectorDIalogState createState() => _ColorSelectorDIalogState();
}

class _ColorSelectorDIalogState extends State<ColorSelectorDIalog> {
  RandomColor _randomColor = RandomColor();

  List<Color> randomCols;

  @override
  void initState() {
    randomCols = new List();

    for (var i = 0; i < 100; i++) {
      Color _color = _randomColor.randomColor();
      randomCols.add(_color);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: Colors.black,
      title: Center(
        child: Text(
          "Select Color",
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      content: Container(
        height: 300,
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              for (var i = 0; i < 100; i++)
                GestureDetector(
                  onTap: () {
                    print("Select color");

                    widget.picColor(randomCols[i]);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: randomCols[i],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
