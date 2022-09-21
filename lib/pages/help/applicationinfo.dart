import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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


  var options = [
    {
      "label":"Application identitfier",
      "val":"XXXXXXXXXXX"
    },
    {
      "label":"Application version",
      "val":"7.8.8"
    },
    {
      "label":"SDK version",
      "val":"11.1.3"
    },
    {
      "label":"Platform name",
      "val":"iOS 16.0"
    },
    {
      "label":"Device model",
      "val":"iPhone 14.5"
    },
    {
      "label":"Build Number",
      "val":"1661854636"
    }
  ];

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
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
              width: double.infinity,
              height: 90,
              color: Color.fromRGBO(168, 28, 25, 1),
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    left: 0,
                    top: 60,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        child: Positioned(
                          top: 4,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                "images/front/back.svg",
                                width: 21,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Back",
                                style: GoogleFonts.roboto(
                                    fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top:60,
                  child: Text("Application info",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
             Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: AppInfo(
                      options: options,
                    ),
                  )
                ],
              )
             )
            ],
          ),
        ));
  }
}

class AppInfo extends StatelessWidget {
  const AppInfo({
    Key key,
    @required this.options,
  }) : super(key: key);

  final List<Map<String, String>> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 10,),
          for(var i=0;i< options.length;i++)
          Builder(builder: (ctx){
            return Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 30,
                top: 5,
                bottom: 5
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(options[i]['label'],
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w800,
                    fontSize: 15
                  ),
                  ),
                    Text(options[i]['val'],
                  style: GoogleFonts.roboto(
                    fontSize: 15
                  ),
                  ),
                  Divider()
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
