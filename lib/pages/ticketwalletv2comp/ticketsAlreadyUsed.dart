import 'package:BubbleGum/pages/components/singleInactive.dart';
import 'package:BubbleGum/v2/helper/NxHelp.dart';
import 'package:BubbleGum/v3/models/ticketWalletModel.dart';
import 'package:flutter/material.dart';


class TicketAlreadyUsed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NXHelp().getAllUsedTicketsv2(),
       builder: (BuildContext context, AsyncSnapshot snapshot) {


        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }

        List<TicketWalletModel> data= snapshot.data;




        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx,index){
              return InkWell(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 12),
                  child: Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width *
                        0.92,
                    child: SingleInactiveTicket(
                      id: data[index].id,
                      isUsed: true
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

}