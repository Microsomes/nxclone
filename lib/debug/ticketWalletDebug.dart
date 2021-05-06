import 'package:BubbleGum/v2/helper/NxHelp.dart';
import '../v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';


class TicketDebug extends StatefulWidget{
  @override
  _TicketDebugState createState() => _TicketDebugState();
}

class _TicketDebugState extends State<TicketDebug> {


  bool isAvailable=true;

  @override
  void initState() {
    print(DateTime.now().millisecondsSinceEpoch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              NXHelp().buyTicketv2(ticketID: 2, tag: "active").then((value) {
                setState(() {
                  isAvailable=!isAvailable;
                });
                Future.delayed(Duration(milliseconds: 1),(){
                  setState(() {
                    isAvailable=!isAvailable;
                  });
                });
              });
            },
          ),
            IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              NXHelp().deleteAllTicketWalletV2().then((value) {
                setState(() {
                  isAvailable=!isAvailable;
                });
                Future.delayed(Duration(milliseconds: 1),(){
                  setState(() {
                    isAvailable=!isAvailable;
                  });
                });
              });
            },
          )
        ],
        title: Text("DEBUG-Ticket Wallet"),
      ),

      body: Column(
        children: [
          RaisedButton(
            onPressed: (){
              setState(() {
                isAvailable=!isAvailable;
              });
            },
            child: Center(child: Text( isAvailable==true ?"TO ACTIVATE":"ACTIVATED"),),
            color: Colors.black,
          ),
          isAvailable==true ?Expanded(child: ShowAvailableTickets(

            onActive: (){
               setState(() {
                  isAvailable=!isAvailable;
                });
                Future.delayed(Duration(milliseconds: 1),(){
                  setState(() {
                    isAvailable=!isAvailable;
                  });
                });
            },
          )): Expanded(child: ShowActiveTickets())
        
        
        ],
      )

      
    );
  }
}



 

class ShowAvailableTickets extends StatefulWidget{
  final Function onActive;
  ShowAvailableTickets({
    @required this.onActive
  });
  @override
  _ShowAvailableTicketsState createState() => _ShowAvailableTicketsState();
}

class _ShowAvailableTicketsState extends State<ShowAvailableTickets> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: NXHelp().getAllUseableTicketsv2(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 
                  return CircularProgressIndicator();
                 } else {
                List<TicketWalletModel> all=snapshot.data;

                  return Column(
                    children: [
                      
                      Expanded(
                                              child: Container(
                          height: 400,
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                        itemCount: all.length,
                        itemBuilder: (ctx, index) {
                          return FutureBuilder(
                            future: NXHelp().getTicketByID(all[index].ticketid),
                            builder: (ctx,snapshot){
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }else{
                              
                              return ListTile(
                                onTap: (){
                                  //activate ticket

                                  NXHelp().activeTicketv2(id: all[index].id).then((value) {
                                    print(">"+value.toString());

                                    widget.onActive();
                                    
                                  });

                                },
                                leading: CircleAvatar(

                                  child: Text(all[index].id.toString()),
                                ),
                            title:  Text(snapshot.data[0]['tickettitle']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(snapshot.data[0]['state']),
                              Text("Purchase Date:\n"+ all[index].getTimeCreatedHuman()),
                              all[index].activeStatus== -1 ? Text("Not activated") : Text("Activated")
                              
                            ],),
                          );
                              }
                            },
                          );
                        },
                    ),
                  ),
                      )
                    ],
                  );
                }
              },
            );
  }
}


class ShowActiveTickets extends StatefulWidget{
  @override
  _ShowAvailableTicketsState2 createState() => _ShowAvailableTicketsState2();
}

class _ShowAvailableTicketsState2 extends State<ShowActiveTickets> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: NXHelp().getAllActiveTicketsV2(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                 
                  return CircularProgressIndicator();
                 } else {
                List<TicketWalletModel> all=snapshot.data;

                  return Column(
                    children: [
                      
                      Expanded(
                                              child: Container(
                          height: 400,
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                        itemCount: all.length,
                        itemBuilder: (ctx, index) {
                          return FutureBuilder(
                            future: NXHelp().getTicketByID(all[index].ticketid),
                            builder: (ctx,snapshot){
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return CircularProgressIndicator();
                              }else{
                              
                              return ListTile(
                                onTap: (){
                                  //activate ticket

                                  print("check time reaming");

                                  all[index].getTimeRemaining();

                                },
                                leading: CircleAvatar(

                                  child: Text(all[index].id.toString()),
                                ),
                            title:  Text(snapshot.data[0]['tickettitle']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(snapshot.data[0]['state']),
                              Text("Purchase Date:\n"+all[index].getTimeCreatedHuman()),
                              Text("Activated Date:\n"+all[index].getWhenActivateddHuman()),
                              all[index].activeStatus== -1 ? Text("Not activated") : Text("Activated")
                              
                            ],),
                          );
                              }
                            },
                          );
                        },
                    ),
                  ),
                      )
                    ],
                  );
                }
              },
            );
  }
}