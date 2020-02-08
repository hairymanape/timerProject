import 'package:flutter/material.dart';
import 'package:timer/constants.dart';
import 'projectCard.dart';
import 'package:timer/brain/timing.dart';

class ProjectListView extends StatefulWidget {
  @override
  _ProjectListViewState createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  int _selectedIndex;

  //TODO: configure a time that starts only for the specific projectCard selected and not the other ones
  /* The following stuff is my stopWatch code
  String stopTimeToDisplay = "___";

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
*/
  final int itemCount = 1;
  final List projectList = [
    Project('PROJECT 1 CAPEX', 12300, 1),
    Project('PROJECT 1 OPEX', 1231230, 4),
    Project('PROJECT 2 CAPEX', 135300, 1),
    Project('PROJECT 2 OPEX', 166300, 1),
    Project('PROJECT 3 CAPEX', 1890, 8),
    Project('PROJECT 4 OPEX', 12690, 6),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(2),
      itemCount: projectList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            /* We set the selectedIndex to index from the itembuilder */
            setState(() {
              /* Instead of us setting this one to selected (enabling more than one to be selected), lets just set one index to be selected */
              _selectedIndex = index;
              if (_selectedIndex == index) {
                TimerBrain();
              } else if (_selectedIndex != index) {
                TimerBrain();
              }
            });
            /* Dont need this else conditional anymore! */
          },
          child: ProjectCard(
            /* Lets select the icon based on the selectedIndex instead */
            icon: _selectedIndex == index ? Icons.check : Icons.sync_disabled,
            /* Lets select the color based on the selectedIndex instead */
            cardColour: _selectedIndex == index
                ? kActiveCardColour
                : kInactiveCardColour,
            textColour: kInactiveTextColour,
            iconColour:
                /* Lets select the color based on the selectedIndex instead */
                _selectedIndex == index ? Colors.green : Colors.red,
            projectList: projectList[index].name,
            projectCode: 'Project Number:' + projectList[index].code.toString(),
            projectTime: _selectedIndex == index
                ? TimerBrain().toString()
                : 'you guys are cool',
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

/*
icon: 
            cardColour: projectList[index].isSelected == true
                ? kActiveCardColour
                : kInactiveCardColour,
            textColour: kInactiveTextColour,
            iconColour: projectList[index].isActive == true
                ? Colors.green
                : kInactiveCardColour,
*/
