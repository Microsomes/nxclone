import 'package:flutter/material.dart';


class AddNewPaymentOption extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 110,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  Image.asset("images/v2/v2assets/plusiconprebg.png",width: 50,),
                  SizedBox(width: 10,),
                  Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Payment with new card",
                          style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                         
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left:2.0),
                            child: Text("Cards can be used for quick access",
                            style: TextStyle(fontWeight: FontWeight.w500,
                            shadows: [
                               Shadow(
                                offset: Offset(0.3, 0.2),
                                blurRadius: 30.0,
                                color: Colors.red,
                              )
                            ]
                            
                            ),),
                          )
                        ],
                      )
                    ),
                  ),
                  Container(
                    width: 40,
                    child: Icon(Icons.arrow_forward_ios,
                    color: Color.fromRGBO(180,81, 76, 1),
                     ),
                  ),
                  SizedBox(width: 10,)
                ],
              )
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 1,
            //   color: Color.fromRGBO(247, 175, 175, 1),
            // )
          ],
        )
      );
  }

}