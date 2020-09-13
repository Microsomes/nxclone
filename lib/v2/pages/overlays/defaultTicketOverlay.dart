import 'package:flutter/material.dart';
import 'package:BlackPie/v2/helper/NxHelp.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTicketOverlay {
  void showDefaultOverlay(BuildContext btx,Function onChange) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: btx,
        builder: (ctx) {
          return Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              height: MediaQuery.of(btx).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  Text(
                    "Select a Default Ticket",
                    style: GoogleFonts.acme(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: FutureBuilder(
                    future: NXHelp().getAllAvailableToPurchaseTickets(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  onTap: () {
                                    NXHelp()
                                        .saveConfig(
                                            "deficketv2",
                                            snapshot.data[index]['state'] +
                                                ":" +
                                                snapshot.data[index]
                                                    ['tickettitle'])
                                        .then((value) {
                                          onChange();
                                          Navigator.pop(context);
                                     });
                                  },
                                  title: Text(snapshot.data[index]['state'],
                                  style: GoogleFonts.acme(),
                                  ),
                                  subtitle: Text(
                                    snapshot.data[index]['tickettitle'],
                                    style: GoogleFonts.acme(),
                                  ));
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ))
                ],
              ));
        });
  }
}
