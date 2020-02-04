import 'package:flutter/material.dart';
import 'package:timer/constants.dart';
import 'projectCard.dart';

class Project
{
    String name;
    int code;
    int hours;
    int minutes;

    Project(this.name, this.code, this.hours, this.minutes);
}

class ProjectListView extends StatefulWidget
{
    @override
    _ProjectListViewState createState()
    => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView>
{
    int _currentPosition;
    int _selectedIndex;
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
    Widget build(BuildContext context)
    {
        return ListView.separated(
            padding: const EdgeInsets.all(2),
            itemCount: projectList.length,
            itemBuilder: (BuildContext context, int index)
            {
                return GestureDetector(
                    onTap: ()
                    {
                        /* We dont need these conditionals anymore, as we can just set the selectedIndex to this index! */
                        // if projectList.any item is selected then disable
                        // if (projectList[index].isSelected == false) {
                        setState(()
                        {
                            /* Instead of us setting this one to selected (enabling more than one to be selected), lets just set one index to be selected */
                            _selectedIndex = index;
                            print(_selectedIndex);

                            //_currentPosition = index;
                            //print(_currentPosition);
                            // projectList[index].isSelected = true;
                            //print(projectList[index].isSelected);

                        });
                        /* Dont need this else conditional anymore! */
                        //}
                        /*else if (projectList[index].isSelected == true) {
                          setState(() {
                          projectList[index].isSelected = false;
                          print(projectList[index].isSelected);
                          });
                        }*/
                    },
                    child: ProjectCard(
                        /* Lets select the icon based on the selectedIndex instead */
                        icon: _selectedIndex == index
                            ? Icons.check
                            : Icons.sync_disabled,
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
                        projectHours: projectList[index].hours,
                        projectMinutes: projectList[index].minutes,
                    ),
                );
            },
            separatorBuilder: (BuildContext context, int index)
            => const Divider(),
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
