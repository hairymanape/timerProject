import 'package:flutter/material.dart';
import 'package:timer/constants.dart';

class ProjectCard extends StatelessWidget {
  ProjectCard(
      {@required this.icon,
      @required this.colour,
      @required this.projectList,
      @required this.projectCode,
      this.projectHours,
      this.projectMinutes});

  final IconData icon;
  final Color colour;

  final String projectList;
  final String projectCode;
  final int projectHours;
  final int projectMinutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.deepPurple),
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
                    projectList,
                    style: kProjectName,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(projectCode),
                  Text(
                      'You worked: $projectHours hours and $projectMinutes minutes today.')
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            //TODO: Modiify the icon color depending on if it is active project or not
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                icon,
                color: colour,
              ),
            ),
          )
        ],
      ),
    );
  }
}
