import 'package:flutter/material.dart';
import 'package:timer/constants.dart';
import 'projectCard.dart';

class Project {
  String name;
  int code;
  int hours;
  int minutes;

  Project(this.name, this.code, this.hours, this.minutes);
}

class ProjectListView extends StatefulWidget {
  @override
  _ProjectListViewState createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  int currentPosition;
  bool isActive = false;
  final int itemCount = 1;
  final List projectList = [
    Project('PROJECT 1 CAPEX', 12300, 1, 2),
    Project('PROJECT 1 OPEX', 1231230, 4, 5),
    Project('PROJECT 2 CAPEX', 135300, 1, 2),
    Project('PROJECT 2 OPEX', 166300, 6, 3),
    Project('PROJECT 3 CAPEX', 1890, 8, 10),
    Project('PROJECT 4 OPEX', 12690, 6, 22),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(2),
      itemCount: projectList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              //TODO: figure out how to access the index value and set the current Position to that value.
              print('You tapped: ${projectList[index].name}');
              print(projectList.map((val) {
                String idx = projectList.indexOf(val).toString();
                return idx;
              }));
              print(projectList.indexOf('PROJECT 1 CAPEX'));
            });
          },
          child: ProjectCard(
            //TODO: Modiify the icon depending on if it is active project or not
            icon: Icons.sync_disabled,
            cardColour: kInactiveCardColour,
            textColour: kInactiveTextColour,
            iconColour: Colors.green,
            projectList: projectList[index].name,
            projectCode: 'Project Number:' + projectList[index].code.toString(),
            projectHours: projectList[index].hours,
            projectMinutes: projectList[index].minutes,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

/*
icon: projectList[index].isActive == true
                ? Icons.check
                : Icons.sync_disabled,
            cardColour: projectList[index].isActive == true
                ? kActiveCardColour
                : kInactiveCardColour,
            textColour: kInactiveTextColour,
            iconColour: projectList[index].isActive == true
                ? Colors.green
                : kInactiveCardColour,
*/
