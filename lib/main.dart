import 'package:flutter/material.dart';

import 'index.dart';
import 'router/route_observer_rewrite.dart';
import 'router/router.dart';
import 'ui/page/home/home_page.dart';

void main() {
  runApp(MyApp());
}

final RouteObserverRewrite<Route> routeObserver = RouteObserverRewrite();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: Router.regiter(),
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
