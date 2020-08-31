import 'package:flutter/material.dart';
import 'package:flutter_template/state/page_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends PageState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/test');
          },
          child: Text('跳转测试页面'),
        ),
      ),
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
