import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  final options =['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets Temp')
      ),
      body: ListView(
        children: _createItems()
      ),
    );  
  }

  // List<Widget> _createItems() {
  //   List<Widget> items = List<Widget>();
  //   for (String option in options) {
  //     final tempWidget = ListTile(
  //       title: Text(option)
  //     );

  //     items..add(tempWidget)
  //          ..add(Divider());
  //   }

  //   return items;
  // }

  List<Widget> _createItems() {
    return options.map((option) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(option),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}