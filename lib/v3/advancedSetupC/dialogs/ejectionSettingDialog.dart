import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/models/ejectionSettingModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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