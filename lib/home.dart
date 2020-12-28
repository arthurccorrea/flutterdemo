import 'package:flutter/material.dart';
import 'package:flutterdemo/formdemo.dart';
import 'package:flutterdemo/statedemo.dart';
import 'package:flutterdemo/wrapdemo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        ],
        title: Text("Flutter demo"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  _expandedContainerColorido(
                      Colors.purple, Icons.search, Colors.white, () {openPage(WrapDemo());}),
                  _expandedContainerColorido(
                      Colors.red, Icons.add, Colors.white, () {openPage(StateDemo());}),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  _expandedContainerColorido(
                      Colors.yellow, Icons.ac_unit, Colors.black, null),
                  _expandedContainerColorido(
                      Colors.blue, Icons.account_box, Colors.black, () {openPage(FormDemo());} ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _expandedContainerColorido(
      Color color, IconData icon, Color fontColor, function()) {
    return Expanded(
    flex: 5,
    child: InkWell(
      onTap: function,
        child: Container(
          width: double.infinity,
          color: color,
          child: Icon(
            icon,
            size: 60,
            color: fontColor,
          ),
        ),
      ),
    );
  }

  void openPage(Widget page) {
    Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => page));
  }
}
