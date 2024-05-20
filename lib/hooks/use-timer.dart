import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

_Timer useTimer() {
  final time = useState(0);
  final isPlaying = useState(false);

  useEffect(() {
    Timer? timer;

    if (isPlaying.value) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        time.value += 1;
      });
    }

    return () {
      timer?.cancel();
    };
  }, [isPlaying.value]);

  return _Timer(
      time: time.value,
      isPlaying: isPlaying.value,
      stop: () {
        isPlaying.value = false;
      },
      play: () {
        isPlaying.value = true;
      });
}

class _Timer {
  final int time;
  final Function stop;
  final Function play;
  final bool isPlaying;

  _Timer(
      {required this.stop,
      required this.play,
      required this.time,
      required this.isPlaying});
}
