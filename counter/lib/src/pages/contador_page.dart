import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _newTextStyle = TextStyle(fontSize: 25.0);
  int _count = 0;

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
            style: _newTextStyle,
          ),
          Text(
            '$_count',
            style: _newTextStyle,
          )
        ],
      )),
      floatingActionButton: _createButtons(),
    );
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, 
      children: <Widget>[
        SizedBox(width: 30.0,),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _resetCounter),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _restCounter),
        SizedBox(width: 10.0,),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _addCounter),
    ]);
  }

  void _addCounter() => setState(() => _count++);
  void _restCounter() => setState(() => _count--);
  void _resetCounter() => setState(() => _count = 0);
}
