import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';
 import '../../helper/metroHelper.dart';

// ignore: must_be_immutable
class PurchaseFlow1 extends StatefulWidget {
  List<MetroTicketModel> allTickets;
  String catName;

  PurchaseFlow1({
    @required this.allTickets,
    @required this.catName
  });


  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchaseFlow1> {
 
  @override
  void initState() {
    setState(() {
     });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catName),
      ),
          body: SafeArea(
                      child: Column(
        children: [
            for (var i = 0; i < widget.allTickets.length; i++)
              Container(
                 width: MediaQuery.of(context).size.width,
                child: ListTile(
                   title: Text(widget.allTickets[i].type,
                   style: GoogleFonts.roboto(
                     color: Colors.black
                   ),
                   ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 3,),
                      Text(widget.allTickets[i].desc,
                      style: GoogleFonts.roboto(
                        color:Colors.black
                      ),
                      )
                    ],
                  ),
                ),
                margin: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
              )
        ],
      ),
          ),
    );
  }
}
