import 'package:flutter/material.dart';

class TicketOption extends StatelessWidget{ 


    final String title;
    final String subtitle;
    final String price;

    TicketOption({
      @required this.title,
      @required this.subtitle,
      @required this.price
    });
  


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Material(
                    child: InkWell(
                      focusColor: Colors.red,
                      onTap: () {
                        

                        //show buy overflow
                      },
                      child: Container(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          height: 100,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.info_outline,
                                  color: Color.fromRGBO(164, 58, 62, 0.7),
                                  ),
                                  SizedBox(width: 12,),
                                  Container(
                                      alignment: Alignment.center,
                                      height: 98,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("$title",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
                                          ),
                                          SizedBox(height: 6,),
                                          Text("$subtitle",
                                          style: TextStyle(
                                            color: Color.fromRGBO(166, 166, 166, 1)
                                          ),
                                          )
                                        ],
                                      )
                                      
                                      ),
                                  Expanded(
                                    child: Text(""),
                                  ), 
                                  Row(
                                    children: <Widget>[
                                      Text("$price",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17
                                      ),
                                      ),
                                      SizedBox(width: 15,),
                                   Image.asset("images/rightred.png", width: 25),

                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              Container(
                                height: 2,
                                color: Color.fromRGBO(230, 230, 230, 1),
                              )
                            ],
                          )),
                    ),
                  )
    );
  }

}