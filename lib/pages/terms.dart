import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _ApplicationInfoPageState createState() => _ApplicationInfoPageState();
}

class _ApplicationInfoPageState extends State<TermsAndConditions> {
  String applicationIdentifier;
  String accountIdentifier;
  String platformName;
  String deviceModel;
  int buildNumber;


  var options = [
    {
      "label":"Definitions and descriptions",
      "val":"In these Conditions “the Company” means West Midlands Travel Ltd. (National Express West Midlands and National Express Coventry.\n\nThese terms and conditions (the ‘Terms’) will govern the purchase and use of National Express mTickets bought via the National Express West Midlands  mobile ticketing App (the ‘App’) and used on any Company bus service. When downloading and using the App you are also agreeing to be bound by the Terms.\n\nFor the purposes of these Terms:\n\n\"we/us/our\" refers to the Company\n\n\"you/your\" refers to the person purchasing tickets or downloading the App.\n\n\"mTicket\" means a paperless ticket that is downloaded onto your mobile phone accepted for travel on the Company’s services.\n\n\"mobile phone\" means a mobile phone – iPhone or android, or any other hand help device running the appropriate software allowing you to download the App and a mTicket."
    },
    
  ];

  @override
  void initState() {
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
                  child: Text("Terms and conditions",
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
                  // Divider()
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
