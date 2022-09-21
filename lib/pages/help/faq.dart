import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class FaqPage extends StatefulWidget {
  @override
  _ApplicationInfoPageState createState() => _ApplicationInfoPageState();
}

class _ApplicationInfoPageState extends State<FaqPage> {
  String applicationIdentifier;
  String accountIdentifier;
  String platformName;
  String deviceModel;
  int buildNumber;


  var options = [
     {
            "label": "What tickets are available as mTickets?",
            "val": "Singles, Day Savers, Ticket bundles, 1 week & 4 week tickets are available for adults and 4 week tickets are available for students."
        },
        {
            "label": "Do I need to create an account in the app?",
            "val": "You can buy single tickets and Day Savers without creating an account. Ticket bundles, 1 week and 4 week tickets will require you to have an account."
        },
        {
            "label": "How do I create an account on the app?",
            "val": "It is quick and easy to create and account in the app. Click on the 3 lines on the top right of the screen of the homepage, go to My Profile and then New Account.\nYou will only need to enter and email and password to create an account."
        },
        {
            "label": "Where can I use my mTicket?",
            "val": "Selected mTickets can be used on National Express buses, the West Midlands Metro tram and across the nBus network. \n\nPlease check the information on your ticket to ensure it is valid for your journey."
        },
        {
            "label": "How do I activate my ticket?",
            "val": "First find the ticket you want to use in your Ticket Wallet, if it is the first time using the ticket click on it and press Activate Ticket. Once the ticket is activated the date and time move across the top of the screen against a colourful background. \n\nPlease activate your ticket just before boarding the bus and show the active ticket to the driver."
        },
        {
            "label": "What do I need to do when I board a bus?",
            "val": "Activate your ticket just before you board the bus and show your activated ticket to the driver. The ticket will show the date and time moving across the top of the screen against a colourful background."
        },
        {
            "label": "When do I activate my ticket?",
            "val": "For single tickets please activate just before boarding the bus as your ticket can only be activated once. For Day Savers you will only need to activate your ticket once and it will remain active until the end of service (02:59am). \n\nFor 1 week & 4 week tickets you will only need to active your ticket once and it will remain active until the expiry date."
        },
        {
            "label": "Which mobile phones can I use?",
            "val": "You can use iPhone and Android devices. For iPhone's your operating system needs to be iOS 9.0 or higher and for Android, 4.4 or higher."
        },
        {
            "label": "Do I need to use my mobile phone data?",
            "val": "You will only need to use your data to buy a ticket, after this the ticket will go into the ticket wallet and can be accessed anytime without using your mobile data."
        },
        {
            "label": "I have bought a ticket but cannot see it in the app?",
            "val": "If you cannot see your mTicket please make sure you are logged in to your account. It will show if you are logged in or not at the bottom of the screen when you open the Ticket Wallet."
        },
        {
            "label": "How do I get my mTicket?",
            "val": "Once bought you will find your ticket in the Ticket Wallet."
        },
        {
            "label": "How do I pay for my mTicket?",
            "val": "If you buy your ticket within the app or through our website payment will be taken by debit or credit card. If you want to pay by cash you can buy your ticket at a Payzone agent."
        },
        {
            "label": "Will you store my card details?",
            "val": "This is not required, you can choose to save your details during the order process if you wish. Any details saved are secure."
        },
        {
            "label": "Can I buy tickets in advance?",
            "val": "Single and Day Saver tickets must be used within 3 days of being bought. 5 day Ticket bundles must be used within 14 days of being bought. 10 day Ticket bundles must be used within 28 days of being bought. 1 week & 4 week tickets start immediately. \n\nmTickets bought online or at a Payzone agent can be bought in advance."
        },
        {
            "label": "What if I do not activate or use my mTicket?",
            "val": "We don't refund for unused mTickets, please make sure you use your tickets before they expire. The expiry date is shown on any tickets in your Ticket Wallet."
        },
        {
            "label": "What if I buy the wrong mTicket?",
            "val": "Please get in touch and a member of our team will contact you. Please visit nxbus.co.uk/west-midlands/help-information"
        },
        {
            "label": "What if my phone battery runs out?",
            "val": "It's your responsibility to make sure you have enough battery on your phone during your journeys. If your battery dies you will have to pay for your travel another way and the tickets are non-refundable."
        },
        {
            "label": "Can I share my mTicket?",
            "val": "mTickets cannot be shared, please ensure a ticket is bought for everyone requiring travel."
        },
        {
            "label": "Am I able to access my ticket on more than 1 device?",
            "val": "No, you can only be logged into one device at any one time."
        },
        {
            "label": "Am I able to transfer my ticket to another device?",
            "val": "Yes, however this can only be done 3 times within 6 months. Once you login on your new device any valid tickets will show in the Ticket Wallet. "
        },
        {
            "label": "What happens if I lose or change my phone?",
            "val": "Please download this app onto your new device and log in. Any valid tickets will appear in your Ticket wallet. You are only able to change device's 3 times within 6 months.  "
        },
        {
            "label": "My saved credit/debit card details have changed, how do I update this?",
            "val": "You cannot update the details of your saved card(s), please delete the card and add it again with your new details."
        },
        {
            "label": "What time is the end of service?",
            "val": "The end of service for our buses is 02:59am."
        },
        {
            "label": "What is Payzone?",
            "val": "Payzone agents are local ticket agents that can issue mTickets directly to the app. For more information and to see how this works please visit nxbus.co.uk/west-midlands/help-information/frequently-asked-questions/payzone-help-faqs"
        },
        {
            "label": "I still need some help?",
            "val": "Please get in touch and a member of our team will contact you. Please visit nxbus.co.uk/west-midlands/help-information"
        },
        {
            "label": "How many times can I activate my mTicket?",
            "val": "You may activate your mTicket as many times as necessary during the validity period. Single tickets may only be activated once."
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
                  child: Text("FAQ",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
             Expanded(
              child: SingleChildScrollView(
                child:  AppInfo(
                      options: options,
                    ),
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
                bottom: 5,
                right: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(options[i]['label'],
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w800,
                    fontSize: 16
                  ),
                  ),
                  SizedBox(height: 5,),
                    Text(options[i]['val'],
                  style: GoogleFonts.roboto(
                    fontSize: 16
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
