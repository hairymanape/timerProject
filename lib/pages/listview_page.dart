import 'package:flutter/material.dart';
import 'package:timer/widgets/projectListView.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TIME ME'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                    height: 500,
                    child: ProjectListView()),
                Expanded(
                  child: Container(
                    width: 600,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.fromLTRB(8, 4, 8, 16),
                    decoration: new BoxDecoration(
                        color: Color(0Xff444444),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      'Current active project is: ',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
