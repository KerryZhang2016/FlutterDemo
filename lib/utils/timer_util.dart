import 'dart:async';

typedef void OnTimerTickCallback(int millisUntilFinished);

/// 计时器
class TimerUtil {
  TimerUtil({this.interval = Duration.millisecondsPerSecond, this.totalTime});

  Timer _timer;
  bool _isActive = false;

  /// Timer interval (unit millisecond，def: 1000 millisecond).
  int interval;
  /// countdown totalTime.
  int totalTime; //单位毫秒

  OnTimerTickCallback _onTimerTickCallback;

  void setInterval(int interval) {
    if (interval <= 0) interval = Duration.millisecondsPerSecond;
    this.interval = interval;
  }

  void setTotalTime(int totalTime) {
    if (totalTime <= 0) return;
    this.totalTime = totalTime;
  }

  void startTimer() {
    if (_isActive || interval <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: interval);
    _doCallback(0);
    _timer = Timer.periodic(duration, (Timer timer) {
      _doCallback(timer.tick);
    });
  }

  void startCountDown() {
    if (_isActive || interval <= 0 || totalTime <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: interval);
    _doCallback(totalTime);
    _timer = Timer.periodic(duration, (Timer timer) {
      int time = totalTime - interval;
      totalTime = time;
      if (time >= interval) {
        _doCallback(time);
      } else if (time == 0) {
        _doCallback(time);
        cancel();
      } else {
        timer.cancel();
        Future.delayed(Duration(milliseconds: time), () {
          totalTime = 0;
          _doCallback(0);
          cancel();
        });
      }
    });
  }

  void _doCallback(int time) {
    if (_onTimerTickCallback != null) {
      _onTimerTickCallback(time);
    }
  }

  /// 重设倒计时总时间.
  void updateTotalTime(int totalTime) {
    cancel();
    this.totalTime = totalTime;
    startCountDown();
  }

  bool isActive() => _isActive;

  void cancel() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    _isActive = false;
  }

  /// set timer callback.
  void setOnTimerTickCallback(OnTimerTickCallback callback) =>
    _onTimerTickCallback = callback;
}