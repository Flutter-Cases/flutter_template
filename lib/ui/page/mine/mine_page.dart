import 'package:flutter/material.dart';
import 'package:flutter_template/state/page_state.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends PageState<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的')),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Text('回到首页'),
        ),
      ),
    );
  }
  @override
  void onResume() {
    super.onResume();
    print('onResume: MinePage');
  }

  @override
  void onPause() {
    super.onPause();
    print('onPause: MinePage');
  }

  @override
  void onDestroy() {
    super.onDestroy();
    print('onDestroy: MinePage');
  }
}
