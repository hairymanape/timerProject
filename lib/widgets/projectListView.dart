import 'package:flutter/material.dart';
import 'projectCard.dart';

class Project {
  String name;
  int code;
  int hours;
  int minutes;

  Project(this.name, this.code, this.hours, this.minutes);
}

class ProjectListView extends StatelessWidget {
  final int itemCount = 6;
  final List projectList = [
    Project('PROJECT1 CAPEX', 12300, 1, 2),
    Project('PROJECT1 OPEX', 1231230, 4, 5),
    Project('PROJECT2 CAPEX', 135300, 1, 2),
    Project('PROJECT2 OPEX', 166300, 6, 3),
    Project('JSON IS COOL', 1890, 8, 10),
    Project('JCOB IS COOL', 12690, 6, 22),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(2),
      itemCount: projectList.length,
      itemBuilder: (BuildContext context, int index) {
        return ProjectCard(
          //TODO: Modiify the icon depending on if it is active project or not
          icon: Icons.check,
          colour: Colors.white,
          projectList: projectList[index].name,
          projectCode: 'Project Number:' + projectList[index].code.toString(),
          projectHours: projectList[index].hours,
          projectMinutes: projectList[index].minutes,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
