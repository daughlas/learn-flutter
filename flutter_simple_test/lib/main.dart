import 'package:flutter/material.dart';
import 'package:flutter_simple_test/gesture-page.dart';
import 'package:flutter_simple_test/launch-page.dart';
import 'package:flutter_simple_test/layout-page.dart';
import 'package:flutter_simple_test/life-cycle-page.dart';
import 'package:flutter_simple_test/plugin_use.dart';
import 'package:flutter_simple_test/stateless_group_page.dart';
import 'package:flutter_simple_test/stateful_group_page.dart';
import 'package:flutter_simple_test/resource_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由演示')
        ),
        body: RouterNavigator()
      ),
      routes: <String, WidgetBuilder> {
        'less': (BuildContext context) => StateLessGroupPage(),
        'ful': (BuildContext context) => StatefulGroupPage(),
        'layout': (BuildContext context) => LayoutPage(),
        'plugin': (BuildContext context) => PluginUse(),
        'gesture': (BuildContext context) => GesturePage(),
        'resource': (BuildContext context) => ResourcePage()
      }
    );
  }
}

class RouterNavigator extends StatefulWidget {
  @override
  _RouterNavigatorState createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? '' : '不'}通过路由跳转'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName = value;
              });
          }),
          _item('StatelessWidget 与基础组件', StateLessGroupPage() ,'less'),
          _item('StatefulWidget 与基础组件', StatefulGroupPage() ,'ful'),
          _item('Flutter 布局基础', LayoutPage() ,'layout'),
          _item('Flutter 引入插件示例 ', PluginUse() ,'plugin'),
          _item('Flutter 手势监听', GesturePage(), 'gesture'),
          _item('Flutter 文件资源', ResourcePage(), 'resource'),
          _item('Flutter 外部应用', LaunchPage(), 'launch'),
          _item('Flutter 生命周期', LifeCyclePage(), 'lifeCycle')
        ]

      )
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }

        },
        child: Text(title)
      )
    );
  }
}
