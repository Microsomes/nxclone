import 'package:BubbleGum/pages/journey/ticket.dart';
import 'package:BubbleGum/v2/pages/nxfront.dart';
import 'package:BubbleGum/v2/pages/ticketv2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../2022/2022helper.dart';
import '../2022/Pages/changeLogs.dart';
import '../2022/Pages/nxpages/front.dart';
import '../2022/Pages/viewAllTickets.dart';
import 'settingSaver.dart';

class AfterDisclaimerModel {
  Image image;
  String title;
  String type;
  String subtitle;
  bool isSetting;
  AfterDisclaimerModel(
      {@required this.image,
      @required this.title,
      @required this.subtitle,
      @required this.isSetting,
      @required this.type});
}

class AfterDisclaimer extends StatefulWidget {
  @override
  _AfterDisclaimerState createState() => _AfterDisclaimerState();
}

class _AfterDisclaimerState extends State<AfterDisclaimer> {
  List<AfterDisclaimerModel> allOptions = [];

  final Box = GetStorage();

  var currentOption = null;

  @override
  void initState() {
    super.initState();

    if(Box.read("BubbleGumSettings") == null ){
      Box.write("BubbleGumSettings", "bubblegumhome");
      setState(() {
        currentOption = "bubblegumhome";
      });
    }else{
      setState(() {
        currentOption = Box.read("BubbleGumSettings");
      });
    }



    allOptions.add(new AfterDisclaimerModel(
        title: "Day Saver",
        isSetting: true,
        type: "dual",
        subtitle: "...",
        image: Image.asset(
          "images/v7/v7ticket.png",
        )));

    // allOptions.add(new AfterDisclaimerModel(
    //     title: "Group Day Saver",
    //             type: "normal",
    //     isSetting: true,
    //     subtitle:
    //         "A group of 5 people can use the bus (had it been real the app) with this app",
    //     image: Image.asset("images/v7/nog.png")));

    allOptions.add(new AfterDisclaimerModel(
        title: "Advanced Option",
        type: "normal",
        isSetting: false,
        subtitle: "Want a custom solution, requires more brains",
        image: Image.asset("images/v7/drill.png")));
  }

  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return null;
        //images/v7/supply-chain.png
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        print("legacy");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Ticket()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "OG NX Bus -> ",
                            style: GoogleFonts.roboto(color: Colors.white),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "images/v7/eggs.png",
                              width: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),

                    SizedBox(height: 10,),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                        children: [
                         
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  height: 20,
                                  child: Center(
                                    child: Text("Quick Ticket Selection",
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 12
                                    ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      NXBuyDaysaverTicket().then((value) {
                                        //actualTicket
                                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => ActualTicket(
                                            txid: value,
                                          )));
                                      });
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child: Text(
                                        "Day Saver",
                                        style: GoogleFonts.aBeeZee(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                       NXBuyGroupSaver().then((value) {
                                        //actualTicket
                                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => ActualTicket(
                                            txid: value,
                                          )));
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20))),
                                      child: Text(
                                        "Group Day Saver",
                                        style: GoogleFonts.aBeeZee(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                 Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NxPagesFront()));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green),
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Text(
                                        "NX Home",
                                        style: GoogleFonts.aBeeZee(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewAllTickets()));
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child: Text(
                                        "View All Tickets",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      //dialog to ask are you sure
                                      //if yes, then go to emergency mode
                                      //if no, then do nothing

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Are you sure?"),
                                              content: Text(
                                                  "This will delete all tickets and data"),
                                              actions: [
                                                TextButton(
                                                  child: Text("Yes"),
                                                  onPressed: () {
                                                    NXDeleteAllTickets();
                                                    //show toast
                                                    Navigator.pop(context);

                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "All tickets deleted",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text("No"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child: Text(
                                        "Reset App",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChangeLogs()));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child: Text(
                                        "Change Logs",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          ),

                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.settings,
                                    color: Colors.black,
                                    size: 20,),
                                  ),
                                  Text("Quick Settings",
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.black
                                  ),
                                  ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text("Home page:",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20
                                        ),),
                                        Spacer(),
                                        DropdownButton(
                                          style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500
                                          ),
                                          onChanged: (e) {
                                            Box.write("BubbleGumSettings", e);
                                            setState(() {
                                              currentOption = e;
                                            });
                                          },
                                          value: currentOption,
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("Bubble Gum Home"),
                                              value: "bubblegumhome",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("NX Home"),
                                              value: "nxhome",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Day Saver"),
                                              value: "DaySaver",
                                            ),
                                              DropdownMenuItem(
                                              child: Text("Group DaySaver"),
                                              value: "Group DaySaver",
                                            ),
                                          ],
                                          
                                       
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text("TIP: Long press on the menu button on the nx home page to come back to this page",
                                  style: GoogleFonts.roboto(
                                    fontSize: 15
                                  ),
                                  )

                                ],
                              ),
                            ),
                          )
                        
                        ]),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.white.withOpacity(0.9), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                            //first paramerter of offset is left-right
                            //second parameter is top to down
                          ),
                        ],
                        //you can set more BoxShadow() here

                        borderRadius: BorderRadius.circular(3)),
                  ))
                ],
              )),
        ),
      ),
    );
  }
}

class TopImage extends StatefulWidget {
  const TopImage({
    Key key,
  }) : super(key: key);

  @override
  _TopImageState createState() => _TopImageState();
}

class _TopImageState extends State<TopImage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        new AnimationController(duration: Duration(seconds: 10), vsync: this);

    _animationController.forward(from: 0.0); // it starts the animation
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => NxPagesFront()));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
          child: Image.asset(
            "images/v7/supply-chain.png",
            width: 100,
          ),
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String title;
  final Image image;
  final String subtitle;
  final Function onClick;
  final bool isSetting;

  const OptionWidget(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.image,
      @required this.onClick,
      @required this.isSetting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: image,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  this.onClick();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "$title",
                                style: GoogleFonts.roboto(fontSize: 30),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            subtitle != null
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "$subtitle",
                                      style: GoogleFonts.roboto(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : Container(),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            isSetting == false
                ? Container()
                : GestureDetector(
                    onTap: () {
                      print("settings...");

                      showDialog(
                          context: context,
                          builder: (ctx) => SettingSaver(
                                title: title,
                              ));
                    },
                    child: Container(
                        alignment: Alignment.topRight,
                        height: 100,
                        child: Icon(
                          Icons.settings,
                          color: Colors.grey,
                        )),
                  )
          ],
        ));
  }
}
