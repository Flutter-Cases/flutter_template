import 'package:flutter/material.dart';
import 'package:flutter_template/state/index_state.dart';
import 'package:flutter_template/ui/widget/flutter_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends IndexState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterAppBar(title: Text('首页')),
      body: Container(),
    );
  }

  @override
  void onResume() {
    super.onResume();
    print('onResume: HomePage');
  }

  @override
  void onPause() {
    super.onPause();
    print('onPause: HomePage');
  }

  @override
  void onDestroy() {
    super.onDestroy();
    print('onDestroy: HomePage');
  }
}
