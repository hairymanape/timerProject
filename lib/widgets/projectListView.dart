import 'package:flutter/material.dart';
import 'package:timer/constants.dart';
import 'package:timer/project/project.dart';
import 'projectCard.dart';

class ProjectListView extends StatefulWidget {
  @override
  _ProjectListViewState createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  int _selectedIndex;
  final int itemCount = 1;
  final List projectList = [
    Project('PROJECT 1 CAPEX', 12300, 1),
    Project('PROJECT 1 OPEX', 1231230, 4),
    Project('PROJECT 2 CAPEX', 135300, 0),
    Project('PROJECT 2 OPEX', 166300, 1),
    Project('PROJECT 3 CAPEX', 1890, 8),
    Project('PROJECT 4 OPEX', 12690, 6),
  ];

  onProjectTap(int index) {
    // Added a check here to only setState if the index has changed to avoid re-rendering
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(2),
      itemCount: projectList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () => onProjectTap(index),
            child: Container(
              key: ValueKey(index),
              child: ProjectCard(
                // Added this so the project card can start/stop timer
                // You could also move the color,icon etc logic to the projectCard based on this flag if you like
                active: _selectedIndex == index,
                /* Lets select the icon based on the selectedIndex instead */
                icon:
                    _selectedIndex == index ? Icons.check : Icons.sync_disabled,
                /* Lets select the color based on the selectedIndex instead */
                cardColour: _selectedIndex == index
                    ? kActiveCardColour
                    : kInactiveCardColour,
                textColour: kInactiveTextColour,
                iconColour:
                    /* Lets select the color based on the selectedIndex instead */
                    _selectedIndex == index ? Colors.green : Colors.red,
                projectList: projectList[index].name,
                projectCode:
                    'Project Number:' + projectList[index].code.toString(),
                projectTime: projectList[index].time,
              ),
            ));
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
