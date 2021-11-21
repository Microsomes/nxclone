import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'package:bubble_gum/src/v2/models/ejectionSettingModel.dart';
import 'package:bubble_gum/src/v2/pages/nxfront.dart';
import 'package:bubble_gum/src/v3/fakeerror/main.dart';
import 'package:app_launcher/app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EjectionOverlay {
  void display(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return EjectionSetWidget();
        });
  }
}

class EjectionSetWidget extends StatefulWidget {
  const EjectionSetWidget({
    Key key,
  }) : super(key: key);

  @override
  _EjectionSetWidgetState createState() => _EjectionSetWidgetState();
}

class _EjectionSetWidgetState extends State<EjectionSetWidget> {
  List<EjectionSettingModel> allOptions;

  @override
  void initState() {
    setState(() {
      allOptions = NXHelp().getAllEjectionSettings2();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      height: MediaQuery.of(context).size.height * 0.37,
      child: Center(
          child: Column(
        children: <Widget>[
          Text(
            "Quick Ejection",
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: allOptions.length,
            itemBuilder: (ctx, index) {
              EjectionSettingModel mo = allOptions[index];
              return ListTile(
                onTap: () {
                  print(mo.id);
                  if (mo.id == "nothing") {
                    Navigator.pop(context);
                  } else if (mo.id == "simulated_real") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => Nxfront()));
                  } else if (mo.id == "launch_real") {
                    AppLauncher.openApp(
                      androidApplicationId: "com.justride.nxwm",
                    ).then((value) {});
                  } else if (mo.id == "fake_error") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => ErrorPage()));
                  }
                },
                title: Text(
                  mo.name,
                  style: GoogleFonts.roboto(color: Colors.white),
                ),
                subtitle: Text(
                  mo.infoSmall,
                  style: GoogleFonts.roboto(color: Colors.white),
                ),
                trailing: CircleAvatar(
                  child: Center(
                      child: Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 20,
                  )),
                ),
              );
            },
          ))
        ],
      )),
    );
  }
}
