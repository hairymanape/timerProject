/*
This currently does jack shit

import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class FileSaver {
  //attempting to add json storage
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
}*/
