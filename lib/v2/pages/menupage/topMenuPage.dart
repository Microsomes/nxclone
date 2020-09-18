import 'package:flutter/material.dart';
import 'package:BubbleGum/pages/settings.dart';
import 'package:google_fonts/google_fonts.dart';

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
              NavItem(),
            ],
          ),
        ));
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          width: 380,
          height: 50,
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
                "My Profile",
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
      ),
    );
  }
}
