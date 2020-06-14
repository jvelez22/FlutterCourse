import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final TextStyle newTextStyle = TextStyle( fontSize: 25.0 );
  int count = 0;
  
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
              '$count',
              style: newTextStyle,
              )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { count += 1; },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}