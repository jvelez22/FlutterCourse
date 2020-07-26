import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _list = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final image = _list[index];
        return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'));
      },
      itemCount: _list.length,
    );
  }
}
