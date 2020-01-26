import 'package:flutter/material.dart';
import 'package:timer/widgets/projectListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TIME ME',
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('TIME ME'),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: new BoxDecoration(
                          color: Color(0Xff444444),
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 600,
                      child: ProjectListView()),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.fromLTRB(8, 4, 8, 16),
                      decoration: new BoxDecoration(
                          color: Color(0Xff444444),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                          'SUMMARY VIEW. Needs to have time started, total time for current project, total time for day,'),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
