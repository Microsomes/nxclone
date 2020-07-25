import 'package:flutter/material.dart';
import 'package:nxclone/v2/helper/NxHelp.dart';



class DefaultTicketOverlay{

    void showDefaultOverlay(BuildContext btx) {

       showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: btx,
        builder: (ctx) {
          return Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              height: MediaQuery.of(btx).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  Text(
                    "Select a Default Ticket",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 30,),
                  Expanded(
                    child: FutureBuilder(
                      future: NXHelp().getAllAvailableToPurchaseTickets(),
                      builder: (context,snapshot){
                        if(snapshot.connectionState==ConnectionState.done){
                          

                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context,index){
                              return ListTile(
                                onTap: (){
                                  print("save ticket");
                                  print(snapshot.data[index]['state']);
                                  print(snapshot.data[index]['tickettitle']);

                                  NXHelp().saveConfig("deficketv2",snapshot.data[index]['state']+":"+snapshot.data[index]['tickettitle']).then((value){
                                    print("inserted $value");
                                  });

                                },
                                title: Text(snapshot.data[index]['state']),
                                subtitle: Text(snapshot.data[index]['tickettitle'],)
                              );
                          });
                        }else{
                          return CircularProgressIndicator();
                        }
                      },
                    )
                  )
                ],
              ));
        });
    }


}