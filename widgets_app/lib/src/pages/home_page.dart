import 'package:flutter/material.dart';
import 'package:widgets_app/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Componentes')), body: _lista());
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _itemsList(snapshot.data),
        );
      },
    );
  }

  List<Widget> _itemsList(List<dynamic> data) {
    List<Widget> items = [];
    data.forEach((item) {
      final widget = ListTile(
        title: Text(item['texto']),
        leading: Icon(Icons.account_circle, color: Colors.blue),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {},
      );
      items..add(widget)
           ..add(Divider());
     });

     return items;
  }
}
