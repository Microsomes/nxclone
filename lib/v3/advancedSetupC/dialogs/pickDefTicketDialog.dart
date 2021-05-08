import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/models/sharedprefkey/main.dart';
import 'package:BubbleGum/v3/advancedSetupC/options/defaultHomePageOption.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PIckDefTicketDialog extends StatefulWidget {
  final Function onDefSelected;

  const PIckDefTicketDialog({
    @required this.onDefSelected,
    Key key,
  }) : super(key: key);

  @override
  _PIckDefTicketDialogState createState() => _PIckDefTicketDialogState();
}

class _PIckDefTicketDialogState extends State<PIckDefTicketDialog> {
  int defVal;

  @override
  void initState() {
    SharedPreferences.getInstance().then((pref) {
      if (pref.getInt(SettingsPrefKeys.DEFAULT_TICKET_KEY) != null) {
        setState(() {
          defVal = pref.getInt(SettingsPrefKeys.DEFAULT_TICKET_KEY);
        });
      } else {
        print("null");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      padding: EdgeInsets.all(40),
      child: Container(
        height: 400,
        child: Column(
          children: [
            Text(
              "Default Ticket Selection",
              style: GoogleFonts.roboto(fontSize: 30, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              "Pick a ticket, this will automatically be, purchased and activated on your behalf",
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(
                  height: 100,
                  child: FutureBuilder(
                    future: NXHelp().getAllAvailableToPurchaseTickets(),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      List<Map> allTickets = snapshot.data;

                      print(allTickets[0]);

                      return ListView.builder(
                        itemCount: allTickets.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                              height: 60,
                              child: Material(
                                  color: allTickets[index]['id'] == defVal
                                      ? Colors.yellowAccent
                                      : Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        defVal = allTickets[index]['id'];
                                      });

                                      Future.delayed(Duration(seconds: 1), () {
                                        widget.onDefSelected(
                                            allTickets[index]['id']);
                                        Navigator.pop(context);
                                      });
                                    },
                                    title: Text(
                                      allTickets[index]['tickettitle'],
                                      style: GoogleFonts.roboto(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      allTickets[index]['state'],
                                      style: GoogleFonts.roboto(fontSize: 15),
                                    ),
                                    // trailing:
                                    //     allTickets[index]['id'] == defVal
                                    //         ? Icon(Icons.check)
                                    //         : Icon(
                                    //             Icons.info_outline,
                                    //             color: Colors.redAccent,
                                    //           ))
                                  )));
                        },
                      );
                    },
                  )),
            ),
            Container(
              height: 50,
              child: Center(
                  child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Close",
                  style: GoogleFonts.roboto(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
