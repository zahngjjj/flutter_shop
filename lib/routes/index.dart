import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/Main/index.dart';
import 'package:flutter_shop/pages/Login/index.dart';

Widget getRootWidget() {
  return MaterialApp(initialRoute: '/', routes: getRoutes());
}

Map<String, Widget Function(BuildContext)> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => HomePage(),
    '/login': (context) => LoginPage(),
  };
}
