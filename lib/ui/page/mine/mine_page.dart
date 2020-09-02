import 'package:flutter/material.dart';
import 'package:flutter_template/state/index_state.dart';
import 'package:flutter_template/state/page_state.dart';
import 'package:flutter_template/ui/widget/flutter_app_bar.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends IndexState<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterAppBar(title: Text('我的')),
      body: Container(),
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
