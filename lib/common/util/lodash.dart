import 'dart:async';

class Lodash {
  static const _deFaultDurationTime = 300;
  static Timer _timer;
  static int _startTime = 0;

  ///
  /// 防抖
  static debounce(Function callback, {durationTime = _deFaultDurationTime}) {
    _timer?.cancel();
    _timer = new Timer(Duration(milliseconds: durationTime), () {
      callback?.call();
      _timer = null;
    });
  }

  ///
  /// 节流
  static throttle(Function callback, {durationTime = _deFaultDurationTime}) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - _startTime > durationTime) {
      callback?.call();
      _startTime = DateTime.now().millisecondsSinceEpoch;
    }
  }
}
