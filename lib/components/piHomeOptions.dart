import 'package:BubbleGum/0mymetro/pages/home.dart';
import 'package:BubbleGum/pages/Info/intro.dart';
import 'package:BubbleGum/pages/ticketwallet.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/pages/nxfront.dart';
import 'package:BubbleGum/v2/pages/setupflow.dart';
import 'package:BubbleGum/v2/pages/ticketv2.dart';
import 'package:BubbleGum/v3/newSetup.dart';
import 'package:cube_transition/cube_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PiHomeOptions extends StatefulWidget {
  final Color textColor;

  PiHomeOptions({@required this.textColor});

  @override
  _PiHomeOptionsState createState() => _PiHomeOptionsState();
}

class _PiHomeOptionsState extends State<PiHomeOptions> {
  List<Map> allOptions;

  @override
  void initState() {
    super.initState();
    allOptions = List<Map>();

    allOptions.add({
      "name": "My Metro (BETA)",
      "id": "my_metro",
      "image": "images/v5/home.png",
    });
    allOptions.add({
      "name": "Home",
      "id": "home",
      "image": "images/v5/home.png",
    });

    allOptions.add({
      "name": "GO Ticket",
      "id": "ticket",
      "image": "images/v5/tickets.png",
    });

    allOptions.add({
      "name": "Wallet",
      "id": "wallet",
      "image": "images/v5/wallet.png",
    });

    allOptions.add({
      "name": "Learn",
      "id": "info",
      "image": "images/v5/edu.png",
    });

    allOptions.add({
      "name": "Setup",
      "id": "setup",
      "image": "images/v5/settings.png",
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (var i = 0; i < allOptions.length; i++)
                      InkWell(
                        onTap: () {
                          var selectedID = allOptions[i]["id"];
                          print(selectedID);
                          switch (selectedID) {
                            case "my_metro":
                              Navigator.of(context).push(
                                CubePageRoute(
                                  enterPage: MyMetro(),
                                  exitPage: widget,
                                  duration: const Duration(milliseconds: 900),
                                ),
                              );

                              //MyMetro

                              break;
                            case "setup":
                              print("Go to advanced setup");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewSetupv3()),
                              );
                              break;
                            case "home":
                              //since disclaimer is certified lets proceed
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Nxfront()),
                                (Route<dynamic> route) => false,
                              );
                              break;
                            case "ticket":

                              //we need to request a ticket id
                              NXHelp().buyAndActivateDefaultTicket().then((id) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActualTicket(
                                            txid: id['ticketid'])));
                              });

                              break;
                            case "info":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LearnIntro()));
                              break;
                            case "wallet":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Ticketwallet()));
                              break;
                          }
                        },
                        child: AnimatedOpacity(
                          opacity: 1,
                          duration: Duration(seconds: 2),
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, bottom: 20, top: 20),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(38, 38, 38, 1)
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5)),
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: Column(
                                children: [
                                  // Expanded(
                                  //   child: Center(
                                  //     child: CircleAvatar(
                                  //       radius: 10,
                                  //       child: Image.asset(
                                  //         allOptions[i]["image"],
                                  //         color: Colors.green,
                                  //         width: 10,
                                  //       ),
                                  //       backgroundColor:
                                  //           Color.fromRGBO(249, 140, 85, 1),
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        allOptions[i]["name"],
                                        style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            color: widget.textColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8)
                                ],
                              )),
                        ),
                      ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
