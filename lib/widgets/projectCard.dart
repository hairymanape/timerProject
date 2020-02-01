import 'package:flutter/material.dart';
import 'package:timer/constants.dart';

class ProjectCard extends StatelessWidget {
  ProjectCard(
      {@required this.icon,
      @required this.cardColour,
      this.projectList,
      this.projectCode,
      @required this.iconColour,
      @required this.textColour,
      this.projectHours,
      this.projectMinutes,
      this.onPress});

  final IconData icon;
  final Color cardColour;
  final Color iconColour;
  final Color textColour;

  final String projectList;
  final String projectCode;
  final int projectHours;
  final int projectMinutes;

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: cardColour),
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
                  Text(
                    projectCode,
                    style: TextStyle(color: kInactiveTextColour),
                  ),
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
              backgroundColor: Colors.red,
              child: Icon(
                icon,
                color: iconColour,
              ),
            ),
          )
        ],
      ),
    );
  }
}
