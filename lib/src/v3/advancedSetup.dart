import 'package:bubble_gum/src/v2/helper/NxHelp.dart';
import 'package:bubble_gum/src/v2/main/quickOptions.dart';
import 'package:bubble_gum/src/v2/pages/setupflow.dart';
import 'package:flutter/material.dart';

class AdvancedSetup extends StatefulWidget {
  @override
  _AdvancedSetupState createState() => _AdvancedSetupState();
}

class _AdvancedSetupState extends State<AdvancedSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(38, 38, 38, 1),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.50,
          padding: EdgeInsets.only(left: 19, right: 19, top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60), topLeft: Radius.circular(60)),
              color: Colors.transparent,
              boxShadow: []),
          child: FutureBuilder(
            future: NXHelp().checkIfDisclaimerHasBeenAccepted(),
            builder: (context, snapshot) {
              Future.delayed(Duration(seconds: 1), () {
                if (snapshot.data == true) {
                  //great
                } else {
                  setState(() {});
                }
              });

              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SetupFlow()));
                },
                child: IgnorePointer(
                    ignoring: snapshot.data == false ? true : false,
                    child: QuickOptions()),
              );
            },
          ),
        ));
  }
}
