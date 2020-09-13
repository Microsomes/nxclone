import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stpage();
  }
}

class Stpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Stpagestate();
  }
}

class Stpagestate extends State<Stpage> {
  @override
  Widget build(BuildContext context) {
    final sizeW = MediaQuery.of(context).size.width;

    List<String> ticketTypes = [
      "West Midlands",
    ];

    return Scaffold(
        backgroundColor: Colors.white,
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
              "Select ticket type",
              style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 3,
            ),
            Container(
              height: 6,
              width: sizeW,
              color: Color.fromRGBO(166, 27, 27, 1),
            ),
            Expanded(child: Container())
          ],
        ));
  }
}
