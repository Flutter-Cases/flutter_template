import 'package:flutter/material.dart';
import 'package:flutter_template/ui/page/home/home_page.dart';
import 'package:flutter_template/ui/page/mine/mine_page.dart';
import 'package:flutter_template/ui/page/test/test_page.dart';

class Router {
  ///
  /// 路由注册
  static Map<String, WidgetBuilder> regiter() {
    return {
      '/home': (_) => HomePage(),
      '/test': (_) => TestPage(),
      '/mine': (_) => MinePage(),
    };
  }

  /// 底部导航栏配置
  /// {
  ///  backgroundColor: null,   背景色
  ///  color: null,             默认字体颜色
  ///  selectedColor: null,     选择字体颜色
  ///  border: null,            边框
  ///  items: [
  ///    {
  ///      url: null,           页面路径
  ///      widget: null,        页面组件
  ///      icon: null,          默认icon
  ///      selectedIcon: null,  选中icon
  ///      text: null           标题
  ///    }
  ///  ]
  /// }
  static Map<String, dynamic> tabBar() {
    return {
      "backgroundColor": Color.fromARGB(255, 248, 248, 248),
      "color": Color.fromARGB(255, 29, 29, 29),
      "selectedColor": Color.fromARGB(255, 66, 148, 254),
      "border": Border.all(color: Color.fromARGB(255, 236, 237, 241), width: 1),
      "list": [
        {
          "url": "/home",
          "widget": HomePage(),
          "icon": "",
          "selectedIcon": "",
          "text": "首页"
        }
      ]
    };
  }
}
