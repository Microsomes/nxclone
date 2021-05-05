import 'package:flutter/material.dart';
import 'package:BubbleGum/pages/settings.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile/LoginIn.dart';

class UtilitiesMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UtilitiesMenuState();
  }
}

class UtilitiesMenuState extends State<UtilitiesMenu> {
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Image.asset("images/leftarrow.png", width: 4))),
          title: Center(
            child: Text(
              "Utilities",
              style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: sizeW,
          color: Color.fromRGBO(167, 27, 26, 1),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
             Row(
               children: [
                 SizedBox(width: 20,),
                  Text("ACCOUNT",
              style: GoogleFonts.roboto(
                color: Colors.white,
                letterSpacing: 1
              ),),
               ],
             ),
             SizedBox(height: 3,),
              NavItem(
                onTap: (){
                  print("profile page");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx)=>MyProfile()
                  ));
                },
                name: "My Profile",
              ),
                            SizedBox(
                height: 10,
              ),
             Row(
               children: [
                 SizedBox(width: 20,),
                  Text("TOOLS",
              style: GoogleFonts.roboto(
                color: Colors.white,
                letterSpacing: 1
              ),),
               ],
             ),
             SizedBox(height: 3,),
              NavItem(
                name: "nxbus.co.uk",
              ),
              SizedBox(height: 13,),
              NavItem(
                name: "Social Media",
              ),
              SizedBox(height: 13,),
              NavItem(
                name: "Payzone Barcode",
              ),
               

            ],
          ),
        ));
  }
}

class NavItem extends StatelessWidget {
  final String name;
  final Function onTap;

  const NavItem({
    @required this.name,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        this.onTap();
      },
          child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: 380,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(215, 216, 218, 1),
                  offset: new Offset(0, 3))
            ]),
        child: Row(children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Text(
              "$name",
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          Image.asset("images/rightarrow.png", width: 35),
          SizedBox(
            width: 4,
          )
        ]),
      ),
    );
  }
}
