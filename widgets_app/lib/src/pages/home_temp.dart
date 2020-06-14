import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets Temp')
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('ListTile Title'),
          ),
          Divider()
        ],
      ),
    );  
  }
}