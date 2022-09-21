import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerServicePage extends StatefulWidget {
  @override
  _ApplicationInfoPageState createState() => _ApplicationInfoPageState();
}

class _ApplicationInfoPageState extends State<CustomerServicePage> {
  String applicationIdentifier;
  String accountIdentifier;
  String platformName;
  String deviceModel;
  int buildNumber;

  var options = [
    {
     "type": "default",
      "label": "Phone", "val": "0121 254 7272"},
    {
      "type": "default",
      "label": "Website", "val": "www.nxbus.co.uk/"},
    {
      "type": "custom",
      "label": "",
      "val":
          "Contact us if any issues arises. Please include your application ID in all requests. This information can be found within the application under Help > App Info."
    }
  ];

  @override
  void initState() {
    setState(() {
      buildNumber = 1597997279;
      applicationIdentifier = "AAXPEINFLH7";
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
                  top: 60,
                  child: Text("Customer service",
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
          )),
           Container(
            child: Center(
              child: Text(
                "Call",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            height: 55,
            decoration: BoxDecoration(
                color: Color.fromRGBO(194, 154, 99, 1),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(199, 199, 199, 1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(left: 18, right: 18, bottom: 7),
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
          SizedBox(
            height: 10,
          ),
          for (var i = 0; i < options.length; i++)
            Builder(builder: (ctx) {

              var type = options[i]['type'];

              if(type == "custom"){
                return Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(options[i]['val'],
                  style: GoogleFonts.roboto(
                    fontSize: 17
                  ),
                  
                  ),
                );
              }




              return Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      options[i]['label'],
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                    Text(
                      options[i]['val'],
                      style: GoogleFonts.roboto(fontSize: 15),
                    ),
                    Divider()
                  ],
                ),
              );
            }),
          Expanded(
            child: Container(),
          ),
         
        ],
      ),
    );
  }
}
