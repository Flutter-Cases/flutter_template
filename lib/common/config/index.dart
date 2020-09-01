import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/common/util/log_utils.dart';

/// 屏幕宽
double screenWidth() {
  return ScreenUtil.screenWidth;
}

///屏幕高
double screenHeight() {
  return ScreenUtil.screenHeight;
}

///状态栏高度
double statusBarHeight() {
  return ScreenUtil.statusBarHeight;
}

///appBar高度
double appBarHeight(){
  return kMinInteractiveDimension;
}

/// px转dp
double px2dp(double px) {
  return ScreenUtil().setWidth(px);
}

///日志
/// debug info warning error
void debug(msg) {
  return LogUtils.debug(msg);
}

void info(msg) {
  return LogUtils.info(msg);
}

void warning(msg) {
  return LogUtils.warning(msg);
}

void error(msg) {
  return LogUtils.error(msg);
}

///颜色
Color color(String colorString, {double alpha = 1.0}) {
  String colorStr = colorString;
  // colorString未带0xff前缀并且长度为6
  if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
    colorStr = '0xff' + colorStr;
  }
  // colorString为8位，如0x000000
  if (colorStr.startsWith('0x') && colorStr.length == 8) {
    colorStr = colorStr.replaceRange(0, 2, '0xff');
  }
  // colorString为7位，如#000000
  if (colorStr.startsWith('#') && colorStr.length == 7) {
    colorStr = colorStr.replaceRange(0, 1, '0xff');
  }
  // 先分别获取色值的RGB通道
  Color color = Color(int.parse(colorStr));
  int red = color.red;
  int green = color.green;
  int blue = color.blue;
  // 通过fromRGBO返回带透明度和RGB值的颜色
  return Color.fromARGB(
    (alpha * 255).toInt(),
    red,
    green,
    blue,
  );
}
