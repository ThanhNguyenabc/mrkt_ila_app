import 'dart:async';

class Debounce {
  final int miliseconds;
  Timer? timer;

  Debounce({
    this.miliseconds = 500,
  });

  void run(cb) {
    if (timer?.isActive ?? false) timer?.cancel();
    timer = Timer(Duration(milliseconds: miliseconds), cb);
  }

  void dispose() => timer?.cancel();
}
