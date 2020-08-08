import 'package:flutter/material.dart';

class HalifaxNav extends StatelessWidget{
  void _onItemTapped(index){
    
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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