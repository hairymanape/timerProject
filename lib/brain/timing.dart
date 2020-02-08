import 'dart:async';
import 'package:flutter/material.dart';

class Project {
  String name;
  int code;
  int time;

  Project(this.name, this.code, this.time);
}

class TimerBrain extends StatefulWidget {
  @override
  _TimerBrainState createState() => _TimerBrainState();
}

class _TimerBrainState extends State<TimerBrain> {
  int elapsedMilliseconds;
  String stopTimeToDisplay = "_";

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(stopTimeToDisplay));
  }

  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);

  void startTimer() {
    Timer(dur, keepRunning);
  }

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    setState(() {
      stopTimeToDisplay = (swatch.elapsed.inSeconds).toString().padLeft(2, "0");
    });
  }

  void startStopWatch() {
    swatch.start();
    startTimer();
  }

  void stopStopWatch() {
    swatch.stop();
  }
}
