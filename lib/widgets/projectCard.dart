import 'package:flutter/material.dart';
import 'package:timer/brain/timing.dart';
import 'package:timer/constants/constants.dart';

/******************************* COMMENT FOR MATT *******************************/
/// I changed this from being a stateless widget to a stateful widget
/// It is easier to manage an individual timer per project card than to manage a list with the way changeNotifiers work - see the timer class

class ProjectCard extends StatefulWidget {
  ProjectCard({
    @required this.icon,
    @required this.cardColour,
    @required this.iconColour,
    @required this.textColour,
    @required this.active,
    this.projectList,
    this.projectCode,
    this.projectTime,
    this.onPress,
  });

  final IconData icon;
  final Color cardColour;
  final Color iconColour;
  final Color textColour;

  final String projectList;
  final String projectCode;

  // I changed this to be an int so that it can be appended to the timer (simulating project being previously worked on etc)
  final int projectTime;

  // I added a flag that tells this card whether or not it is currently active.
  // We can use this to decide whether or not the timer should start/stop
  final bool active;

  final Function onPress;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  TimerBrain _timer;

  @override
  void initState() {
    super.initState();
    // Passing the amount of time previously worked on the project
    _timer = TimerBrain(startCount: widget.projectTime);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Starting and stopping the timer based on the active flag passed in from the listView
    widget.active ? _timer.startStopWatch() : _timer.stopStopWatch();

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: widget.cardColour),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.projectList,
                    style: kProjectName,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    widget.projectCode,
                    style: TextStyle(color: kInactiveTextColour),
                  ),
                  // The animated builder here listens to changes from the timer - you will notice that every tick on the timer triggers a 'notifyListeners' call - this is the listener
                  // Placing the animated builder here means that only the Text widget below it will be re-rendered
                  AnimatedBuilder(
                    animation: _timer,
                    builder: (context, child) {
                      return Text('You worked: ${_timer.stopTimeToDisplay}');
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            //TODO: Modiify the icon color depending on if it is active project or not
            child: CircleAvatar(
              backgroundColor: widget.iconColour,
              child: Icon(
                widget.icon,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
