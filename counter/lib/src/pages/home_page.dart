import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final TextStyle newTextStyle = TextStyle( fontSize: 25.0 );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello AppBar"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Número de clicks:",
              style: newTextStyle,
              ),
            Text(
              "0",
              style: newTextStyle,
              )
          ],
        )
      ),
    );
  }
}