import 'package:flutter/material.dart';
import 'package:widgets_app/src/pages/alert_page.dart';
import 'package:widgets_app/src/pages/avatar_page.dart';
import 'package:widgets_app/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext contex) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage()
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext contex) => AlertPage());
      },
    );
  }
}
