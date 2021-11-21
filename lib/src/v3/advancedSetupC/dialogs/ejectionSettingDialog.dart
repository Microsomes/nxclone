import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'package:bubble_gum/src/v2/models/ejectionSettingModel.dart';
import 'package:bubble_gum/src/v2/models/sharedprefkey/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //controls the set ejection settings
  String defaultEjectionID;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      if (value.getString(SettingsPrefKeys.ejectionSettingKey) != null) {
        setState(() {
          defaultEjectionID =
              value.getString(SettingsPrefKeys.ejectionSettingKey);
        });
      } else {
        setState(() {
          defaultEjectionID = "nothing";
        });
      }
    });

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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: defaultEjectionID == ejectionSettings[index].id
                        ? Colors.yellowAccent
                        : Colors.transparent,
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    title: Text(ejectionSettings[index].name),
                                    content: Container(
                                      height: 150,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              ejectionSettings[index].info,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        },
                      ),
                      // trailing:defaultEjectionID== ejectionSettings[index].id? Icon( Icons.check):Icon(Icons.check,color: Colors.redAccent,),
                      onTap: () {
                        setState(() {
                          defaultEjectionID = ejectionSettings[index].id;
                        });
                        Future.delayed(Duration(milliseconds: 300), () {
                          widget.onSelectEjection(ejectionSettings[index].id);
                        });
                      },
                      title: Text(
                        ejectionSettings[index].name,
                        style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      // subtitle: Text(
                      //   ejectionSettings[index].info,
                      //   style: GoogleFonts.roboto(fontSize: 15),
                      // ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 50,
            child: Center(
                child: ElevatedButton(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20)),
              // color: Colors.white,
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
