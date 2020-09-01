import 'package:flutter/material.dart';

import 'app_dev_config.dart';


/// with 混入其他配置 例如：AppDevConfig AppTestConfig AppProdConfig
class AppConfig with AppDevConfig {
  /// 实例
  static AppConfig get instance => _getInstance();

  /// navigator
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  /// design screen
  final double designScreenWidth = 414;
  final double designScreenHeight = 896;

  /// 用户协议地址
  final String agreementUrl = 'https://www.sjzmjy.cn/agreement.html';

  /// 获取BuildContext
  BuildContext get buildContext => navigatorKey.currentState.overlay.context;

  /// 获取OverlayState
  OverlayState get overlayState => navigatorKey.currentState.overlay;

  /// 初始化
  void init() {

  }

  /// 说明：工厂单例模式 使 new 和 instance都是同一对象
  factory AppConfig() => _getInstance();
  static AppConfig _instance;

  AppConfig._internal();

  static AppConfig _getInstance() {
    if (_instance == null) {
      _instance = new AppConfig._internal();
    }
    return _instance;
  }
}
