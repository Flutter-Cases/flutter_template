import 'package:flutter/material.dart';

///
/// 组件生命周期
abstract class ComState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  String tag = T.toString();

  T get widget => super.widget;

  bool _isMount = false;

  @override
  @mustCallSuper
  void initState() {
    onCreate();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (!_isMount) {
        _isMount = true;
        onMount();
        onResume();
      }
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  @mustCallSuper
  void dispose() {
    onDestroy();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// 应用处于创建状态，可初始化一些信息，例如：接口调用
  @mustCallSuper
  void onCreate() {}

  /// 应用处于build渲染完毕状态
  @mustCallSuper
  void onMount() {}

  /// 应用处于不可见变为可见时的状态
  @mustCallSuper
  void onResume() {}

  /// 应用处于不可见且不能响应用户的输入，但在后台继续活动中
  @mustCallSuper
  void onPause() {}

  /// 应用处于销毁状态
  @mustCallSuper
  void onDestroy() {}
}
