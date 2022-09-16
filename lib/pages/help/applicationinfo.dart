import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ApplicationInfoPage extends StatefulWidget {
  @override
  _ApplicationInfoPageState createState() => _ApplicationInfoPageState();
}

class _ApplicationInfoPageState extends State<ApplicationInfoPage> {
  String applicationIdentifier;
  String accountIdentifier;
  String platformName;
  String deviceModel;
  int buildNumber;

  @override
  void initState() {
    setState(() {
      buildNumber = 1597997279;
      applicationIdentifier="AAXPEINFLH7";
    });

    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    // deviceInfo.androidInfo.then((value) {
    //   AndroidDeviceInfo dv = value;
    //   setState(() {
    //     deviceModel = dv.device;
    //     platformName=dv.version.sdkInt.toString();
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                PhysicalModel(
                    elevation: 2,
                    color: Colors.red,
                    shadowColor: Color.fromRGBO(215, 216, 218, 1),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          child: Center(
                            child: Text("Application info",
                                style: GoogleFonts.roboto(
                                    color: Color.fromRGBO(189, 156, 106, 1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16)),
                          ),
                          height: 55,
                          color: Colors.white,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                Image.asset("images/leftarrow.png", width: 35)),
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Application identifier",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$applicationIdentifier",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Application version",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "4.24.6",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Platform name",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$platformName",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Device model",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("$deviceModel",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600, fontSize: 18)),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Build Number",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$buildNumber",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            ),
          ),
        ));
  }
}
