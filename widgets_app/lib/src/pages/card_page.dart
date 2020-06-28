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
        _cardTipo2(),
        SizedBox(
          height: 20.0,
        ),
        _cardTipo1(),
        SizedBox(
          height: 20.0,
        ),
        _cardTipo2(),
        SizedBox(
          height: 20.0,
        ),
        _cardTipo1(),
        SizedBox(
          height: 20.0,
        ),
        _cardTipo2(),
        SizedBox(
          height: 20.0,
        ),
        _cardTipo1(),
        SizedBox(
          height: 20.0,
        ),
        _cardTipo2(),
        SizedBox(
          height: 20.0,
        ),
      ]),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage(
                'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
            height: 260.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Texto de la tarjeta...'),
          )
        ],
      ),
    );

    return Container(
        child: ClipRRect(
          child: card,
          borderRadius: BorderRadius.circular(30.0),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ],
        ));
  }
}
