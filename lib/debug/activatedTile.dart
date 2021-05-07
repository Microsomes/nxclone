import 'package:flutter/material.dart';
import '../v3/models/ticketWalletModel.dart';
import 'dart:async';

class ActivatedTile extends StatefulWidget {
  final TicketWalletModel all;
  final dynamic snapshot;

  ActivatedTile({@required this.all, @required this.snapshot});

  @override
  _ActivatedTileState createState() => _ActivatedTileState();
}

class _ActivatedTileState extends State<ActivatedTile> {
  int timeRemaining;
  Timer one;

  @override
  void dispose() {
    one.cancel();
     super.dispose();
  }

  void getTimeRemaining(){
    widget.all.getTimeRemaining().then((value) {
        setState(() {
          timeRemaining = value;
          print(value.toString());
        });
      });
  }

  @override
  void initState() {
    super.initState();
    this.getTimeRemaining();
    one=Timer.periodic(Duration(minutes: 1), (timer) {
      this.getTimeRemaining();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: CircleAvatar(),
      onTap: () {
        //activate ticket
        widget.all.setInactive();
      },
      leading: CircleAvatar(
        child: Text(widget.all.id.toString()),
      ),
      title: Text(widget.snapshot.data[0]['tickettitle']),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.snapshot.data[0]['state']),
          Text("Purchase Date:\n" + widget.all.getTimeCreatedHuman()),
          Text("Activated Date:\n" + widget.all.getWhenActivateddHuman()),
          widget.all.activeStatus == -1
              ? Text("Not activated")
              : Text("Activated Left:"),
          timeRemaining != null
              ? Text(timeRemaining.toString() + " Minutes")
              : Text("")
        ],
      ),
    );
  }
}
