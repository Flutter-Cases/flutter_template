import 'dart:async';

const _deFaultDurationTime = 300;
Timer _timer;
int _startTime = 0;

//防抖
debounce(Function doSomething, {durationTime = _deFaultDurationTime}) {
  _timer?.cancel();
  _timer = new Timer(Duration(milliseconds: durationTime), () {
    doSomething?.call();
    _timer = null;
  });
}

//节流
throttle(Function doSomething, {durationTime = _deFaultDurationTime}) {
  int currentTime = DateTime.now().millisecondsSinceEpoch;
  if (currentTime - _startTime > durationTime) {
    doSomething?.call();
    _startTime = DateTime.now().millisecondsSinceEpoch;
  }
}
