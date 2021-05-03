import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v2/models/defaultHomePageModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DefHomePageDialog extends StatefulWidget {
  final Function onSelectDefHome;

  const DefHomePageDialog({
    @required this.onSelectDefHome,
    Key key,
  }) : super(key: key);

  @override
  _DefHomePageDialogState createState() => _DefHomePageDialogState();
}

class _DefHomePageDialogState extends State<DefHomePageDialog> {
  List<DefHomePageModel> allHomePageSettings;

  String curKey;

  @override
  void initState() {
    SharedPreferences.getInstance().then((pref) {
      if (pref.getString("def_home_adv") != null) {
        setState(() {
          curKey = pref.getString("def_home_adv");
        });
      }
    });

    allHomePageSettings = NXHelp().getAllDefHomeOptions();

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
                itemBuilder: (ctx, index) {
                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                      trailing: allHomePageSettings[index].id == curKey
                          ? Icon(Icons.check)
                          : Icon(Icons.info, color: Colors.redAccent),
                      onTap: () {
                        setState(() {
                          curKey = allHomePageSettings[index].id;
                        });
                        Future.delayed(Duration(milliseconds: 300), () {
                          widget.onSelectDefHome(allHomePageSettings[index].id);
                        });
                      },
                      title: Text(
                        allHomePageSettings[index].name,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Text(
                        allHomePageSettings[index].info,
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