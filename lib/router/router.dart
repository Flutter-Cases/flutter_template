import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/cache/local_storage.dart';
import 'package:flutter_template/common/util/utils.dart';
import 'package:flutter_template/ui/page/home/home_page.dart';
import 'package:flutter_template/ui/page/login/login_page.dart';
import 'package:flutter_template/ui/page/mine/mine_page.dart';
import 'package:flutter_template/ui/page/test/test_page.dart';
import 'package:flutter_template/ui/page/web_view/web_view_page.dart';

import '../app_config.dart';

enum RouterType { APP, WEB }

class Router {
  ///主页ItemTapped通知
  static final EventBus indexItemTappedEventBus = EventBus();

  ///主页onResume通知
  static final EventBus indexResumeEventBus = EventBus();

  ///主页onPause通知
  static final EventBus indexPauseEventBus = EventBus();

  ///
  /// 路由注册
  static Map<String, WidgetBuilder> register() {
    return {
      '/home': (_) => HomePage(),
      '/test': (_) => TestPage(),
      '/mine': (_) => MinePage(),
      '/login': (_) => LoginPage(),
      '/web_view': (_) => WebViewPage(),
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
      "border": Border(
          top: BorderSide(color: Color.fromARGB(255, 236, 237, 241), width: 1)),
      "list": [
        {
          "url": "/home",
          "widget": HomePage(),
          "icon": "assets/icon/home.png",
          "selectedIcon": "assets/icon/home-on.png",
          "text": "首页"
        },
        {
          "url": "/test",
          "widget": TestPage(),
          "icon": "assets/icon/test.png",
          "selectedIcon": "assets/icon/test-on.png",
          "text": "测试"
        },
        {
          "url": "/mine",
          "widget": MinePage(),
          "icon": "assets/icon/mine.png",
          "selectedIcon": "assets/icon/mine-on.png",
          "text": "我的"
        }
      ]
    };
  }

  ///
  /// 入栈
  static void push(String url,
      {Map<String, dynamic> params,
      bool isLogin = false,
      bool isDestroy = false,
      Function callBackListener}) async {
    BuildContext context = AppConfig.instance.buildContext;
    params = _getParams(url, params);

    ///登录检查
    if (isLogin && null == await LocalStorage.getJwt()) {
      params['redirectUrl'] = _getRealUrl(url);
      url = '/login';
    }

    ///网页检查
    if (RouterType.WEB == _getRouterType(url)) {
      params['url'] = _getRealUrl(url);
      url = '/web_view';
    }

    ///主页跳转
    if (_isIndex(url)) {
      Navigator.popUntil(context, (route) => route.isFirst);
      return;
    }

    ///销毁当前页面，跳转
    if (isDestroy) {
      Navigator.pushReplacementNamed(context, _getRealUrl(url),
              arguments: params)
          .then((res) {
        callBackListener?.call(res);
      });
      return;
    }

    ///跳转
    Navigator.pushNamed(context, _getRealUrl(url), arguments: params)
        .then((res) {
      callBackListener?.call(res);
    });
  }

  ///
  /// 出栈
  static void pop({Map<String, dynamic> params}) {
    BuildContext context = AppConfig.instance.buildContext;
    if (Navigator.canPop(context)) {
      Navigator.pop(context, params);
    }
  }

  static Map<String, dynamic> _getParams(
      String url, Map<String, dynamic> params) {
    return {
      ...Utils.getUrlAllParams(url),
      ...(params ?? {}),
    };
  }

  static RouterType _getRouterType(String url) {
    if (null == url) return RouterType.APP;
    if (url.startsWith('http:')) return RouterType.WEB;
    return RouterType.APP;
  }

  static String _getRealUrl(String url) {
    if (null == url) return url;
    if (url.trim().startsWith('http:')) return url;
    if (url.trim().startsWith('app://')) {
      if (url.indexOf('?') == -1) {
        return "/" + url.substring(url.indexOf('app://') + 6).trim();
      } else {
        return "/" +
            url.substring(url.indexOf('app://') + 6, url.indexOf("?")).trim();
      }
    }
    if (url.indexOf('?') != -1) {
      return url.substring(0, url.indexOf("?"));
    }
    return url;
  }

  static bool _isIndex(String url) {
    if (null == url) {
      indexItemTappedEventBus.fire(IndexChangeItemTappedEvent(0));
      return true;
    }
    for (int i = 0; i < tabBar()['list'].length; i++) {
      var item = tabBar()['list'][i];
      if (url == item['url']) {
        indexItemTappedEventBus.fire(IndexChangeItemTappedEvent(i));
        return true;
      }
    }
    if (!register().containsKey(url)) {
      indexItemTappedEventBus.fire(IndexChangeItemTappedEvent(0));
      return true;
    }
    return false;
  }
}

class IndexChangePageEvent {
  final String page;

  IndexChangePageEvent(this.page);
}

class IndexChangeItemTappedEvent {
  final int index;

  IndexChangeItemTappedEvent(this.index);
}
