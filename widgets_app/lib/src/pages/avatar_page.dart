import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.blogs.es/7ccbec/iron-man/1366_2000.jpg'),
                radius: 25.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('JV'),
                backgroundColor: Colors.brown,
              ),
            )
          ],
        ),
        body: Center(
            child: FadeInImage(
                placeholder: AssetImage('assets/original.gif'),
                image: NetworkImage(
                    'https://i.blogs.es/7ccbec/iron-man/1366_2000.jpg'))));
  }
}
