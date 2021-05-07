import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class MultipleIndicator extends StatefulWidget{

    final int ticketid;
    final String ticketPrice;

    final Function onTotal;

    MultipleIndicator({
      @required this.ticketid,
      @required this.ticketPrice,
      @required this.onTotal
    });

  @override
  _MultipleIndicatorState createState() => _MultipleIndicatorState();
}

class _MultipleIndicatorState extends State<MultipleIndicator> {


    int counter=0;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(230, 230, 230, 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              if(counter<=0){

              }else{
              setState(() {
                counter--;
              });
               widget.onTotal(counter,widget.ticketPrice,widget.ticketid);
              }
            },
                      child: Container(
              child: Center(
                child: Icon(Icons.remove,color: Colors.white,),
              ),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromRGBO(169, 27, 26, 1)
              ),
            ),
          ),
          Text("$counter",style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 17
          ),),
           GestureDetector(
             onTap: (){
               if(counter>=9){

               }else{
               setState(() {
                 counter++;

               });

               widget.onTotal(counter,widget.ticketPrice,widget.ticketid);
               }
             },
                        child: Container(
                child: Center(
                child: Icon(Icons.add,color: Colors.white,),
              ),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromRGBO(169, 27, 26, 1)
              ),
          ),
           )
        ],
      ),
    );
  }
}