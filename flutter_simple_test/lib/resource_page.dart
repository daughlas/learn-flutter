

import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('如何使用 Flutter 本地的文件'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 100,
              height: 100,
              image: AssetImage('images/icon.jpeg')
            )
          ],
        )
      )
    );
  }
}