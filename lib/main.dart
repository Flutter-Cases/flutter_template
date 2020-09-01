import 'package:flutter/material.dart';

import 'app_config.dart';
import 'index.dart';
import 'router/route_observer_rewrite.dart';
import 'router/router.dart';

void main() {
  runApp(MyApp());
}

final RouteObserverRewrite<Route> routeObserver = RouteObserverRewrite();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppConfig.instance.navigatorKey,
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: Router.register(),
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Index(),
    );
  }
}
