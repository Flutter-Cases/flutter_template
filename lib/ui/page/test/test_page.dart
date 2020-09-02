import 'package:flutter/material.dart';
import 'package:flutter_template/state/index_state.dart';
import 'package:flutter_template/ui/widget/flutter_app_bar.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends IndexState<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterAppBar(title: Text('测试')),
      body: Container(),
    );
  }

  @override
  void onResume() {
    super.onResume();
    print('onResume: TestPage');
  }

  @override
  void onPause() {
    super.onPause();
    print('onPause: TestPage');
  }

  @override
  void onDestroy() {
    super.onDestroy();
    print('onDestroy: TestPage');
  }
}
