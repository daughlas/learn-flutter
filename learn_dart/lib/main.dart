import 'package:flutter/material.dart';

import 'data-type.dart';
import 'oop-learn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dart Basic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    _oopLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
       child: ListView(
         children: <Widget>[
           DataType()
         ],
       ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _oopLearn() {
    print('---------- oopLearn---------');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print('log1=log2: ${log1 == log2}');
    
    Student.doPrint('__leaning oop____');

    Student stu1 = Student('东北大学', 'ljw', 30);
    print('改变之前${stu1.school}');
    stu1.school = "东北师范大学";
    print('改变之后${stu1.school}');

    print(stu1.toString());

    Student stu2 = Student('吉林大学', '吕嘉文', 20, country: '中国', city: '杭州');

    print(stu2.toString());

  }
}
