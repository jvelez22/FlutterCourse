import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
        _cardTipo1(),
        SizedBox(
          height: 20.0,
        ),
        _cardTipo2()
      ]),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Soy el titulo de esta tarjeta'),
          subtitle: Text(
              'Esto es un subtitulo de muestra para ver como se ve dentro de la card'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(onPressed: () {}, child: Text('Cancelar')),
            FlatButton(onPressed: () {}, child: Text('Aceptar'))
          ],
        )
      ]),
    );
  }

  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage(
                'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Texto de la tarjeta...'),
          )
        ],
      ),
    );
  }
}
