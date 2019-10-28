import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {

  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> {
  @override
  void initState() {
    
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget 生命周期'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)
        )
      )
    );
  }
}