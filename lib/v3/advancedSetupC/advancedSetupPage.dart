import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/models/defaultHomePageModel.dart';
import 'package:BubbleGum/v2/models/ejectionSettingModel.dart';
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

  int defaultTicketID;

  String ticketDefNameSelected;


  String defaultEjectionID;


  @override
  void initState() {
    //load default home pref

    SharedPreferences.getInstance().then((value) {

    if(value.getString("ejected_setting_adv")!=null){
      setState(() {
        defaultEjectionID= value.getString("ejected_setting_adv");
      });
    }



      int tikDef = value.getInt("def_ticket_adv_id");

      if (tikDef != null) {
        String tikDefName = value.getString("def_ticket_adv_name");
        String tikDefState = value.getString("def_ticket_adv_state");

        setState(() {
          ticketDefNameSelected = tikDefName + "/" + tikDefState;
        });
      }

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
        isDisclaimer == null || isDisclaimer == false
            ? Container()
            : GestureDetector(
                onTap: () {

                  showDialog(
                    context: context,
                    builder: (ctx)=>DefHomePageDialog()
                  );

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
                          "(" +
                              allPageOptions[defaultHomeIndex].pageName +
                              ")",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
              ),
        SizedBox(
          height: 10,
        ),
        isDisclaimer == null || isDisclaimer == false
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
        isDisclaimer == null || isDisclaimer == false
            ? Container()
            : GestureDetector(
                onTap: () {
                  print("set default ticket");

                  NXHelp().getAllAvailableToPurchaseTickets().then((value) {
                    print(value.length);

                    showDialog(
                        context: context,
                        builder: (ctx) => SetEjectionSettings(
                              onSelectEjection: (eectionid) {
                              EjectionSettingModel ej=  NXHelp().getEjectionSettingByID(eectionid);
                                SharedPreferences.getInstance().then((sharePref) {
                                  sharePref.setString("ejected_setting_adv", ej.id);
                                  setState(() {
                                    defaultEjectionID=ej.id;
                                  });
                                  Navigator.pop(context);
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
                          "Ejection Settings",
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
                                "(" + defaultEjectionID + ")",
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

class DefHomePageDialog extends StatefulWidget {
  const DefHomePageDialog({
    Key key,
  }) : super(key: key);

  @override
  _DefHomePageDialogState createState() => _DefHomePageDialogState();
}

class _DefHomePageDialogState extends State<DefHomePageDialog> {

  List<DefHomePageModel> allHomePageSettings;

  @override
  void initState() {
  
    allHomePageSettings= new List();

    allHomePageSettings.add(DefHomePageModel(
      name: "Non Simulated (Home)",
      id: "non_sim_home",
      info: "In this view, you will see all the ticket types sectioned off and you can click on the ticket you want to activate. You also have extra butotns, its basically the quickest most efficent method of using the app but its not emersive."
    ));


     allHomePageSettings.add(DefHomePageModel(
      name: "Simulated (Home)",
      id: "sim_home",
      info: "In this view, You will see the simulated home, aka the Clone real App."
    ));

    allHomePageSettings.add(DefHomePageModel(
      name: "Ticket View",
      id: "sim_ticket_view",
      info: "In this view, The app will launch in ticket view. So as soon as you open the app it will go to the ticket view. Going back will follow the ejection rules."
    ));

    allHomePageSettings.add(DefHomePageModel(
      name: "Demo Mode",
      id: "demo_mode",
      info: "In this view, You will access demo mode, here you can create your own tickets and have fun with the app."
    ));

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.redAccent,
      child: Column(
        children: [
           Text(
            "Set Default Home",
            style: GoogleFonts.roboto(fontSize: 30, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            "Pick a default home setting. When you first launch the app what would you like to see.",
            style: GoogleFonts.roboto(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: allHomePageSettings.length,
                itemBuilder: (ctx,index){
                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(allHomePageSettings[index].name,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      ),
                      subtitle: Text(allHomePageSettings[index].info,
                      style: GoogleFonts.roboto(
                        fontSize: 15
                      ),
                      ),
                      
                    ),
                  );
                },
              ),
            ),
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
    );
  }
}



class SetEjectionSettings extends StatefulWidget {
  final Function onSelectEjection;

  const SetEjectionSettings({
    @required this.onSelectEjection,
    Key key,
  }) : super(key: key);

  @override
  _SetEjectionSettingsState createState() => _SetEjectionSettingsState();
}

class _SetEjectionSettingsState extends State<SetEjectionSettings> {
  List<EjectionSettingModel> ejectionSettings;

  @override
  void initState() {
    ejectionSettings = NXHelp().getAllEjectionSettings();
   

    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.redAccent,
      child: Column(
        children: [
          Text(
            "Ejection Selection",
            style: GoogleFonts.roboto(fontSize: 30, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            "When pushing the back button on the actual ticket page, what should happen?",
            style: GoogleFonts.roboto(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30),
              child: ListView.builder(
                itemCount: ejectionSettings.length,
                itemBuilder: (ctx, index) {
                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                      onTap: () {
                        widget.onSelectEjection(ejectionSettings[index].id);
                      },
                      title: Text(
                        ejectionSettings[index].name,
                        style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        ejectionSettings[index].info,
                        style: GoogleFonts.roboto(fontSize: 15),
                      ),
                    ),
                  );
                },
              ),
            ),
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

                      List<Map> allTickets = snapshot.data;

                      print(allTickets[0]);

                      return ListView.builder(
                        itemCount: allTickets.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                              height: 50,
                              child: Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    onTap: () {
                                      widget.onDefSelected(
                                          allTickets[index]['id']);
                                      Navigator.pop(context);
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
                                    trailing: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Icon(
                                          Icons.arrow_right,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
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
