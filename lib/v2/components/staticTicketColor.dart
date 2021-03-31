import 'package:flutter/material.dart';


class StaticTicketColor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("Select this one");
      },
          child: Container(
        margin: EdgeInsets.only(top:20),
        alignment: Alignment.center,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [
          
          ]
        ),
        height: 50,
        child: Center(
          child: Row(
            children: [
              Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                 color: Colors.red,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(20)
                 )

                              ),
                 height: 200,
                ),
              ),
              Expanded(
                            child: Container(
                 color: Colors.pink,
                 height: 200,
                ),
              ),
              Expanded(
                            child: Container(
                 height: 200,
                 decoration: BoxDecoration(
                 color: Colors.green,
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(20)
                 )

                 ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}