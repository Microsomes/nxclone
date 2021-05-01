import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdvancedSetupPage extends StatefulWidget {
  @override
  _AdvancedSetupPageState createState() => _AdvancedSetupPageState();
}

class DefHome {
  String pageName;
  int pageid;
  DefHome({@required this.pageName, @required this.pageid});
}

class _AdvancedSetupPageState extends State<AdvancedSetupPage> {
  bool isDisclaimer = false;

  List<DefHome> allPageOptions;

  int defaultHomeIndex = 0;

  @override
  void initState() {
    //load default home pref

    SharedPreferences.getInstance().then((value) {
      int def = value.getInt("default_home");
      if (def != null) {
        setState(() {
          defaultHomeIndex = def;
        });
      }

      bool isDis = value.getBool("setup_disclaimer");

      if (isDis != null) {
        setState(() {
          isDisclaimer = isDis;
        });
      }
    });

    allPageOptions = new List();

    allPageOptions.add(DefHome(pageName: "Home", pageid: 0));
    allPageOptions.add(DefHome(pageName: "NX Home", pageid: 1));
    allPageOptions.add(DefHome(pageName: "Ticket", pageid: 2));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              "Advanced Setup",
              style: GoogleFonts.roboto(fontSize: 30, color: Colors.white),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 30),
          alignment: Alignment.topLeft,
          child: Text(
            "Setup with a brand new intuitive layout, set the default ticket, ejection mode and much more.",
            style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
          ),
        ),
        Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.yellowAccent,
            ),
            height: 80,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              child: Text(
                        "Please understand this clone app is for educational purposes only!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))),
                      Switch(
                        inactiveTrackColor: Colors.redAccent,
                        value: isDisclaimer,
                        onChanged: (val) {
                          SharedPreferences.getInstance().then((value) {
                            value.setBool("setup_disclaimer", val);
                            //set the value
                          });

                          setState(() {
                            isDisclaimer = val;
                          });
                        },
                        inactiveThumbColor: Colors.white,
                        activeColor: Colors.redAccent,
                      )
                    ],
                  ),
                ),
              ],
            )),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            child: PopupMenuButton(
              color: Colors.yellowAccent,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Set Default Home Page",
                      style: GoogleFonts.roboto(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "(" + allPageOptions[defaultHomeIndex].pageName + ")",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
              initialValue: defaultHomeIndex,
              onSelected: (selected) {
                setState(() {
                  defaultHomeIndex = selected;
                });
                SharedPreferences.getInstance().then((value) {
                  value.setInt("default_home", selected);
                });
              },
              onCanceled: () {
                print("9");
              },
              itemBuilder: (context) {
                return List.generate(allPageOptions.length, (index) {
                  return PopupMenuItem(
                      value: allPageOptions[index].pageid,
                      child: Text(
                        allPageOptions[index].pageName,
                        style: GoogleFonts.roboto(),
                      ));
                });
              },
            ),
            height: 80,
            margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow,
                    blurRadius: 4,
                    offset: Offset(2, 2), // Shadow position
                  ),
                ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            print("set default ticket");

            NXHelp().getAllAvailableToPurchaseTickets().then((value) {
              print(value.length);

              showDialog(
                  context: context, builder: (ctx) => PIckDefTicketDialog(
                    onDefSelected: (val){
                      SharedPreferences.getInstance().then((value) {
                        value.setInt("def_ticket_adv", val);
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
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "(" + allPageOptions[defaultHomeIndex].pageName + ")",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )
              ],
            ),
            height: 80,
            margin: EdgeInsets.only(left: 20, right: 20, top: 0),
            decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow,
                    blurRadius: 4,
                    offset: Offset(2, 2), // Shadow position
                  ),
                ]),
          ),
        )
      ],
    );
  }
}

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

                      List<Map> allTickets= snapshot.data;

                      print(allTickets[0]);

                      return ListView.builder(
                        itemCount: allTickets.length,
                        itemBuilder: (ctx, index) {

                          return Container(
                            height: 50,
                            child: Material(
                              color: Colors.transparent,
                              child: ListTile(
                                onTap: (){
                                  widget.onDefSelected(allTickets[index]['id']);
                                  Navigator.pop(context);
                                },
                                title: Text(allTickets[index]['tickettitle']),
                                subtitle: Text(allTickets[index]['state']),
                              ))
                            
                          );
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
