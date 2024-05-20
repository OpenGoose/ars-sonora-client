import 'dart:async';

import 'package:ars_sonora/hooks/use-timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Counter extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final timer = useTimer();
    return Column(
      children: [
        timer.isPlaying
            ? ElevatedButton(
                child: const Text("Stop"),
                onPressed: () {
                  timer.stop();
                },
              )
            : ElevatedButton(
                child: const Text("Play"),
                onPressed: () {
                  timer.play();
                },
              ),
        Text(timer.time.toString()),
      ],
    );
  }
}
