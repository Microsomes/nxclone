import 'package:bubble_gum/v2/helper/NxHelp.dart';
import 'package:bubble_gum/v2/models/sharedprefkey/main.dart';
import 'package:bubble_gum/v3/advancedSetupC/dialogs/pickDefTicketDialog.dart';
import "package:flutter/material.dart";

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultTicketOption extends StatefulWidget {
  final bool isDisclaimer;
  final Function onDone;
  DefaultTicketOption({@required this.isDisclaimer, @required this.onDone});
  @override
  DefaultTicketOptionState createState() => DefaultTicketOptionState();
}

class DefaultTicketOptionState extends State<DefaultTicketOption> {
  //controls the ticket default name
  String ticketDefNameSelected;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      int tikDef = value.getInt(SettingsPrefKeys.defaultTicketKey);

      if (tikDef != null) {
        String tikDefName =
            value.getString(SettingsPrefKeys.defaultTicketNameKey);
        String tikDefState =
            value.getString(SettingsPrefKeys.defaultTicketStateKey);

        setState(() {
          ticketDefNameSelected = tikDefName + "/" + tikDefState;
        });
        widget.onDone();
        //send message to parent im done
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isDisclaimer == null || widget.isDisclaimer == false
            ? Container()
            : GestureDetector(
                onTap: () {
                  print("set default ticket");

                  NXHelp().getAllAvailableToPurchaseTickets().then((value) {
                    print(value.length);

                    showDialog(
                        context: context,
                        builder: (ctx) => PIckDefTicketDialog(
                              onDefSelected: (val) {
                                NXHelp().getTicketByID(val).then((tikInfo) {
                                  print(tikInfo);

                                  SharedPreferences.getInstance().then((value) {
                                    value.setInt("def_ticket_adv_id", val);
                                    value.setString("def_ticket_adv_name",
                                        tikInfo[0]['tickettitle']);
                                    value.setString("def_ticket_adv_state",
                                        tikInfo[0]['state']);

                                    setState(() {
                                      ticketDefNameSelected = tikInfo[0]
                                              ['tickettitle'] +
                                          "/" +
                                          tikInfo[0]['state'];
                                      widget.onDone();
                                    });
                                  });
                                });
                              },
                            ));
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Set Default Ticket",
                          style: GoogleFonts.roboto(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ticketDefNameSelected != null
                          ? Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "(" + ticketDefNameSelected + ")",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          : Container()
                    ],
                  ),
                  height: 80,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                  decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow,
                          blurRadius: 4,
                          offset: Offset(2, 2), // Shadow position
                        ),
                      ]),
                ),
              ),
      ],
    );
  }
}
