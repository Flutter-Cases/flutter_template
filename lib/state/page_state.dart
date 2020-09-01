import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';

///
/// 页面生命周期
abstract class PageState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver, RouteAware {
  String tag = T.toString();

  T get widget => super.widget;

  bool _isMount = false;

  Timer _timer;

  @override
  @mustCallSuper
  void initState() {
    onCreate();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (!_isMount) {
        _isMount = true;
        onMount();
        onLoad(ModalRoute.of(context).settings.arguments);
        onResume();
      }
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context));
    super.didChangeDependencies();
  }

  @override
  @mustCallSuper
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        onPause();
        break;
      case AppLifecycleState.resumed:
        onResume();
        break;
      default:
        break;
    }
  }

  @override
  @mustCallSuper
  void dispose() {
    if (null != _timer) {
      _timer.cancel();
      _timer = null;
    }
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  @mustCallSuper
  void didPop() {
    onPause();
    onDestroy();
  }

  @override
  @mustCallSuper
  void didPopNext() {
    if (null != _timer) {
      _timer.cancel();
      _timer = null;
    }
    _timer = Timer(Duration(milliseconds: 100), () {
      onResume();
    });
  }

  @override
  @mustCallSuper
  void didPushNext() {
    onPause();
  }

  /// 应用处于创建状态，可初始化一些信息，例如：接口调用
  @mustCallSuper
  void onCreate() {}

  /// 应用处于build渲染完毕状态
  @mustCallSuper
  void onMount() {}

  void onLoad(params) {}

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
