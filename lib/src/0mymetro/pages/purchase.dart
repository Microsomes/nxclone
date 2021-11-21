import 'package:flutter/material.dart';
import '../helper/metroHelper.dart';
import 'package:google_fonts/google_fonts.dart';
import './purchaseFlow/flow1.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  List<MetroCatModel> allCategories;

  @override
  void initState() {
    setState(() {
      allCategories = MetroHelperv1().getAllTicketsCategories();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < allCategories.length; i++)
          Container(
             width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PurchaseFlow1(
                  allTickets: allCategories[i].allTickets,
                  catName: allCategories[i].title,
                )));
              },
               title: Text(allCategories[i].title,
               style: GoogleFonts.roboto(
                 color: Colors.black
               ),
               ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 3,),
                  Text(allCategories[i].desc,
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
    );
  }
}
