import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer/widgets/projectListView.dart';

/******************************* COMMENT FOR MATT *******************************/
/// I changed this from being a widget to a plain dart class.
/// It doesn't need to display itself and it was easier this way :p

class TimerBrain extends ChangeNotifier {
  dynamic fileContent;
  Map<String, dynamic> projectTimers;
  int elapsedMilliseconds;

  String stopTimeToDisplay = "00:00:00";
  //stopTimeToDisplay2 = projectTimers[keyInputController];
  bool _isRunning = false;
  final Stopwatch _stopwatch = Stopwatch();
  final dur = const Duration(seconds: 1);
  // Added the ability for this class to take in a starting count
  final startCount;

  TimerBrain({this.startCount = 0}) {
    _init();
  }

  _init() {
    if (this.startCount > 0) {
      // Only display the starting count if it is above 0
      _setTimeToDisplay();
    }
  }

  //Have modified the following to convert seconds into hh:mm:ss
  _setTimeToDisplay() {
    stopTimeToDisplay =
        (_stopwatch.elapsed.inHours).toString().padLeft(2, "0") +
            (":") +
            (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
            (":") +
            (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
  }

  void startTimer() {
    Timer(dur, keepRunning);
  }

  void keepRunning() {
    if (_stopwatch.isRunning) {
      startTimer();
    }
    _setTimeToDisplay();
    elapsedMilliseconds = _stopwatch.elapsedMilliseconds;
    // This will notify any widgets who are using the timer that something has changed and that they need to re render
    notifyListeners();
  }

  void startStopWatch() {
    // this likely isn't required but is just an extra check to avoid calling start if it is already started
    if (_isRunning) {
      return;
    }

    _isRunning = true;
    _stopwatch.start();
    startTimer();
  }

  void stopStopWatch() {
    _isRunning = false;
    _stopwatch.stop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // TODO: check if we need to dispose these timers
    super.dispose();
  }
}
//Thinking about how I access the value that will show my time value so that I dont lose it every time I forceclose the app
/*class TimeValue {
  String projectCode;
  int time;

  TimeValue({this.projectCode, this.time});

  factory TimeValue.fromJson(Map<String, dynamic> parsedJson) {
    return TimeValue(
      projectCode: parsedJson['id'],
      time: parsedJson['time'],
    );
  }
}

Future<String> _loadAProjectAsset() async {
  return await rootBundle.loadString('${ProjectListView}');
}
*/
