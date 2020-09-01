import 'package:flutter/material.dart';
import '../../common/config/index.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static void show({String msg, ToastGravity gravity, Toast toastLength}) {
    gravity = gravity ?? ToastGravity.CENTER;
    toastLength = toastLength ?? Toast.LENGTH_SHORT;
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        backgroundColor: Color.fromARGB(204, 0, 0, 0),
        textColor: Color.fromARGB(255, 204, 204, 204),
        fontSize: px2dp(13));
  }
}
