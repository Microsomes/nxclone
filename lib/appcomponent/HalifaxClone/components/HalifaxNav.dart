import 'package:flutter/material.dart';

import '../payandtransfer.dart';

class HalifaxNav extends StatelessWidget{

    final BuildContext context;

    HalifaxNav({@required this.context});

  void _onItemTapped(index){

    if(index==2){
      //open the pay and transfer page
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PayandTransfer()));
    }

  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            title: Text(
              'Apply',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            title: Text('Pay & transfer'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text('Support'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('More'),
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      );
  }

}