# flutter_template

## flutter版本
Flutter 1.20.2 • channel stable • https://github.com/flutter/flutter.git

## 生命周期

### PageState(页面)

* onCreate 处于创建状态，可初始化一些信息, 不可setState
* onMount 处于可见状态，可setState
* onLoad 处于可见状态，可获取参数params
* onResume 处于可见状态，或从后台进入前台触发
* onPause 处于不可见状态， 或从前台进入后台触发
* onDestroy 销毁

## IndexState(主页，专门给主页使用)

* onCreate 处于创建状态，可初始化一些信息, 不可setState
* onMount 处于可见状态，可setState
* onLoad 处于可见状态，可获取参数params
* onResume 处于可见状态，或从后台进入前台触发
* onPause 处于不可见状态， 或从前台进入后台触发
* onDestroy 销毁

## ComState(组件)

* onCreate 处于创建状态，可初始化一些信息, 不可setState
* onMount 处于可见状态，可setState
* onDestroy 销毁
