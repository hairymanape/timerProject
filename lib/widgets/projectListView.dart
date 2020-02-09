import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:timer/constants/constants.dart';
import 'package:timer/project/project.dart';
import 'package:timer/widgets/projectCard.dart';

class ProjectListView extends StatefulWidget {
  @override
  _ProjectListViewState createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  int _selectedIndex;
  final int itemCount = 1;
  final List projectList = [
    Project('PROJECT 1 CAPEX', 12300, 0),
    Project('PROJECT 1 OPEX', 1231230, 0),
    Project('PROJECT 2 CAPEX', 135300, 0),
    Project('PROJECT 2 OPEX', 166300, 0),
    Project('PROJECT 3 CAPEX', 1890, 0),
    Project('PROJECT 4 OPEX', 12690, 0),
  ];

  onProjectTap(int index) {
    // Added a check here to only setState if the index has changed to avoid re-rendering
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  File jsonFile;
  Directory dir;
  String fileName = "myJsonFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
    print("hey");
  }

  @override
  void dispose() {
    super.dispose();
  }

  File createFile(Map<String, dynamic> content) {}

  void writeToFile(String key, dynamic value) {}

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(2),
      itemCount: projectList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            //TODO: implement switch to allow for a disabling of a task
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

class FileSaver {
  //attempting to add json storage

}
