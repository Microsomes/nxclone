import 'package:flutter/material.dart';
import 'package:nxclone/pages/journey/ticket.dart';
import 'package:nxclone/v2/pages/ticket.dart';

import './../components/daysaveractive.dart';




class Ticketwallet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return stpage();
  }

}


class stpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _stpagestate();
  }

}




class _stpagestate extends State<stpage>{
  @override
  Widget build(BuildContext context) {

     final sizeW = MediaQuery.of(context).size.width;
    final sizeH = MediaQuery.of(context).size.height;

    List<String> ticketTypes= [
      "West Midlands",
    ];


    bool isTickets=true;


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell( onTap: (){

    Navigator.pop(context,true);

        },child: PreferredSize( preferredSize: Size.fromHeight(500),child: Image.asset("images/leftarrow.png",width:4))),
        title: Center(child: Text("Ticket wallet", style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh,color: Color.fromRGBO(127, 26, 25,1),size: 30,),
            onPressed: (){},
          )
        ],
      ),
      body: Container(

        height: double.infinity,
        color: Color.fromRGBO(123, 26, 17, 1),
        child: Column(children: <Widget>[
          SizedBox(height: 5,),
          Container(
            height: 50,
            width: sizeW,
            color: Color.fromRGBO(169, 27, 26, 1),
            child: Row(children: <Widget>[
              InkWell(
                onTap: (){
                  print("hi");
                  setState(() {
                    isTickets=true;
                  });
                },
                              child: Container(
                  child: Center(child: Text("Tickets", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),),),
                  width: sizeW/2,
                   decoration: BoxDecoration(
                    color: isTickets==true ? Color.fromRGBO(123, 26, 17, 1): Colors.transparent,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10))
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                     setState(() {
                    isTickets=false;
                    print("ticket is false");
                  });
                },

                              child: Container(
                  child: Center(child: Text("History", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),),),
                  width: sizeW/2,
                   decoration: BoxDecoration(
                      color: isTickets==false ? Color.fromRGBO(123, 26, 17, 1): Colors.transparent,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
                  ),
                ),
              )
            ],
          ),


        ),
        SizedBox(height: 10,),
        InkWell(
          onTap: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ticket()),
              );
          },
                  child: Container(
            height: 110,
            width: MediaQuery.of(context).size.width*0.90,
            child: ticketTwo(title: "K",),
          ),
        ),
        SizedBox(height: 10,),
        SingleInactiveTicket(sizeW: sizeW), 
        
        
        
        ]),
      ) 
      
      );
    
  }

}

class SingleInactiveTicket extends StatelessWidget {
  const SingleInactiveTicket({
    Key key,
    @required this.sizeW,
  }) : super(key: key);

  final double sizeW;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

          Navigator.push(context, MaterialPageRoute(builder: (context)=>Ticket2()));


          

      },
              child: Container(
                    width: sizeW * 0.9,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "West Midlands",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Single Journey",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(""),
                            ),
                            Text(
                              "INACTIVE",
                              style: TextStyle(
                                  color: Color.fromRGBO(211, 211, 211, 1),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                        Container(
                          width: sizeW * 0.7,
                          height: 2,
                          color: Color.fromRGBO(211, 211, 211, 0.6),
                        ),
                        Expanded(
                          child: Text(""),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Expires in 6 days, 7 hours",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )),
    );
  }
}