import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert Page'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () => _mostrarAlerta(context),
            child: Text('Mostrar Alerta'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.keyboard_return),
            onPressed: () {
              Navigator.pop(context);
            }));
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido...'),
              FlutterLogo(
                size: 100.0,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar')),
            FlatButton(onPressed: () {}, child: Text('Aceptar'))
          ],
        );
      },
    );
  }
}
