import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:timer/constants/constants.dart';
import 'package:timer/project/project.dart';
import 'package:timer/brain/timing.dart';
import 'package:timer/widgets/projectCard.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ProjectListView extends StatefulWidget {
  @override
  _ProjectListViewState createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  //Attempting Shared preferences here //
  // currently using boiler plate crap and will try work it in//

  /*@override
  void initState() {
    super.initState();
    _incrementStartup();
*/

  Project project;
  TimerBrain _timer;
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

  Map<String, dynamic> projectTimers = {
    "12300": 0,
    "1231230": 0,
    "135300": 0,
    "166300": 0,
    "1890": 0,
    "12690": 0,
  };

  onProjectTimerChange(projectId, time) {
    //print(projectId + " " + time);
    projectTimers[projectId] = time;
  }

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

  String keyInputController;
  dynamic valueInputController;

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

  void createFile(
      Map<String, dynamic> content, Directory dir, String fileName) {
    print("creating file");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, dynamic value) {
    print("writing to file!");
    Map<String, dynamic> content = {key: value};
    int timer = projectTimers[key];
    if (fileExists) {
      print("File Exists");
      Map<String, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());

      jsonFileContent.addAll(content);

      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("file does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
  }

  readFromFile() {
    return projectTimers[keyInputController].toString();
  }

  returnDateTime() {
    var now = new DateTime.now();
    print(now.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(2),
      itemCount: projectList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            //TODO: implement switch to allow for a disabling of a task
            onTap: () {
              onProjectTap(index);
            },
            onLongPress: () {
              print(projectList[index].name + " got long pressed");
              keyInputController = projectList[index].code.toString();
              //TODO: Fix this so that I can write the time value to the file
              valueInputController = projectTimers[keyInputController];
              writeToFile(keyInputController, valueInputController);
              readFromFile();
              returnDateTime();
              //print('${_timer.stopTimeToDisplay[index]}');
              final snackBar = SnackBar(
                content: Text(
                  'The current json file is as follows: \n \n'
                  'Location: ${dir.path + "/" + fileName} \n \n'
                  'The file content is: $fileContent',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: kActiveCardColour,
                /*ction: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),*/
              );

              // Find the Scaffold in the widget tree and use
              // it to show a SnackBar.
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Container(
              key: ValueKey(index),
              child: ProjectCard(
                  // Added this so the project card can start/stop timer
                  //TODO:  move the color,icon etc logic to the projectCard based on this flag if you like
                  active: _selectedIndex == index ? true : false,
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
                  projectCode: projectList[index].code.toString(),
                  //'Project Number:' + projectList[index].code.toString(),
                  projectTime: projectList[index].time,
                  onTimeUpdate: onProjectTimerChange),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
