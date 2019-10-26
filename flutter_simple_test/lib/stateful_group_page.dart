import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() => runApp(StatefulGroupPage());

class StatefulGroupPage extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}

class _StatefulGroupState extends State<StatefulGroupPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatefulWidget 与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatelessWidget 与基础组件')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.blue),
            title: Text('首页')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.grey),
                activeIcon: Icon(Icons.list, color: Colors.blue),
                title: Text('列表')
            ),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我')
        ),
        body: _currentIndex == 0 ? RefreshIndicator(
          child: ListView(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  child: Column(
                      children: <Widget>[
                        Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 100,
                          height: 100
                        ),
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            hintText: '请输入',
                            hintStyle: TextStyle(fontSize: 15)
                          )
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(color: Colors.lightBlueAccent),
                          child: PageView(
                            children: <Widget>[
                              _item('page1', Colors.deepPurple),
                              _item('page2', Colors.green),
                              _item('page3', Colors.red),
                            ]
                          )
                        )
                      ]
                  )
              )
            ]
          ),

          onRefresh: _handleRefresh
        ): Text('列表页面')
      ),
    );
  }
  Future<Null> _handleRefresh() async{
    await Future.delayed(Duration(microseconds: 200));
    return null;
  }

  _item(String title, MaterialColor color) {
    return Container(
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      )
    );
  }
}
