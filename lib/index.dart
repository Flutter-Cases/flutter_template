import 'dart:async';

import 'package:flutter/material.dart';

import 'common/config/index.dart';
import 'router/router.dart';
import 'state/page_state.dart';
import 'ui/widget/flutter_bottom_navigation_bar.dart';
import 'ui/widget/flutter_toast.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends PageState<Index> {
  int selectedIndex = 0;
  int last = 0;
  Timer timeInterval;

  static final _TabBar _tabBar = _getTabBar();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: doubleClickBack,
        child: Scaffold(
            bottomNavigationBar: FlutterBottomNavigationBar(
              // 底部导航
              items: _tabBar.items
                  .map((item) => BottomNavigationBarItem(
                      icon: Image.asset(
                        item.icon,
                        width: 23,
                        height: 23,
                      ),
                      activeIcon: Image.asset(
                        item.selectedIcon,
                        width: 23,
                        height: 23,
                      ),
                      title: Text(item.text)))
                  .toList(),
              currentIndex: selectedIndex,
              backgroundColor: _tabBar.backgroundColor,
              unselectedItemColor: _tabBar.color,
              selectedItemColor: _tabBar.selectedColor,
              onTap: _onItemTapped,
              elevation: 0,
              border: _tabBar.border,
              selectedFontSize: 10,
              unselectedFontSize: 10,
            ),
            body: Stack(
                children: _tabBar.items
                    .asMap()
                    .keys
                    .map((index) => Offstage(
                          offstage: selectedIndex != index,
                          child: TickerMode(
                              enabled: selectedIndex == index,
                              child: _tabBar.items[index].widget),
                        ))
                    .toList())));
  }

  @override
  void onResume() {
    super.onResume();
    Router.indexResumeEventBus.fire(
        IndexChangePageEvent(_tabBar.items[selectedIndex].widget.toString()));
  }

  @override
  void onPause() {
    super.onPause();
    Router.indexPauseEventBus.fire(
        IndexChangePageEvent(_tabBar.items[selectedIndex].widget.toString()));
  }

  void _onItemTapped(int index) {
    if (selectedIndex != index) {
      setState(() {
        Router.indexPauseEventBus.fire(IndexChangePageEvent(
            _tabBar.items[selectedIndex].widget.toString()));
        Router.indexResumeEventBus
            .fire(IndexChangePageEvent(_tabBar.items[index].widget.toString()));
        selectedIndex = index;
      });
    }
  }

  static _TabBar _getTabBar() {
    List<_Item> list = List();
    for (int i = 0; i < Router.tabBar()['list'].length; i++) {
      var item = Router.tabBar()['list'][i];
      list.add(_Item(
          url: item['url'],
          widget: item['widget'],
          icon: item['icon'],
          selectedIcon: item['selectedIcon'],
          text: item['text']));
    }
    _TabBar _tabBar = _TabBar(
        backgroundColor: Router.tabBar()['backgroundColor'],
        color: Router.tabBar()['color'],
        selectedColor: Router.tabBar()['selectedColor'],
        border: Router.tabBar()['border'],
        items: list);
    return _tabBar;
  }

  Future<bool> doubleClickBack() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last > 400) {
      debug('单击');
      last = DateTime.now().millisecondsSinceEpoch;
      timeInterval = Timer(Duration(milliseconds: 400), () {
        FlutterToast.show(msg: '双击退出');
      });
      return Future.value(false);
    } else {
      debug('双击');
      timeInterval.cancel();
      return Future.value(true);
    }
  }
}

class _TabBar {
  Color backgroundColor;
  Color color;
  Color selectedColor;
  Border border;
  List<_Item> items;

  _TabBar(
      {this.backgroundColor,
      this.color,
      this.selectedColor,
      this.border,
      this.items});
}

class _Item {
  String url;
  Widget widget;
  String icon;
  String selectedIcon;
  String text;

  _Item({this.url, this.widget, this.icon, this.selectedIcon, this.text});
}
