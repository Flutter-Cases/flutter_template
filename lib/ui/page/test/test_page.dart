import 'package:flutter/material.dart';
import 'package:flutter_template/state/page_state.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends PageState<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试')),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/mine');
          },
          child: Text('跳转到我的页面'),
        ),
      ),
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
