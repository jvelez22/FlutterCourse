import 'package:flutter/material.dart';
import 'package:widgets_app/src/pages/alert_page.dart';
import 'package:widgets_app/src/pages/animated_container.dart';
import 'package:widgets_app/src/pages/avatar_page.dart';
import 'package:widgets_app/src/pages/card_page.dart';
import 'package:widgets_app/src/pages/home_page.dart';
import 'package:widgets_app/src/pages/input_page.dart';
import 'package:widgets_app/src/pages/listview_page.dart';
import 'package:widgets_app/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() => {
      '/': (BuildContext contex) => HomePage(),
      'alert': (BuildContext context) => AlertPage(),
      'avatar': (BuildContext context) => AvatarPage(),
      'card': (BuildContext context) => CardPage(),
      'animated_container': (BuildContext context) => AnimatedContainerPage(),
      'inputs': (BuildContext context) => InputPage(),
      'slider': (BuildContext context) => SliderPage(),
      'list': (BuildContext context) => ListPage()
    };
