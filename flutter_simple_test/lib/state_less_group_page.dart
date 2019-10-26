import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() => runApp(StateLessGroupPage());

class StateLessGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWidget 与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatelessWidget 与基础组件')),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('I am text', style: textStyle),
              Icon(Icons.android, size: 50, color: Colors.red),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text('StatelessWidget 与基组件')
              ),
              Divider(color: Colors.black, height: 10, indent: 50),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('I am Card', style: textStyle)
                )
              ),
              AlertDialog(
                title: Text('盘他'),
                content: Text('你个糟老头子坏的很')
              )
            ]
          )
        )
      ),
    );
  }
}
