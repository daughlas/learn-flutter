import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() => runApp(LayoutPage());

class LayoutPage extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}

class _StatefulGroupState extends State<LayoutPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'Flutter 布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter 布局'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)
            )
          ),
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
                              Row(
                                children: <Widget>[
                                  ClipOval(
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.network('http://www.devio.org/img/avatar.png')
                                    )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      child: Opacity(
                                        opacity: 0.6,
                                        child: Image.network(
                                          'http://www.devio.org/img/avatar.png',
                                          width: 100,
                                          height: 100
                                        )
                                      )
                                    )
                                  )
                                ],
                              ),
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
                                  margin: EdgeInsets.all(10),
                                  child: PhysicalModel(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.antiAlias,
                                    child: PageView(
                                        children: <Widget>[
                                          _item('page1', Colors.deepPurple),
                                          _item('page2', Colors.green),
                                          _item('page3', Colors.red),
                                        ]
                                    )
                                  )
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(color: Colors.greenAccent),
                                    child: Text('宽度撑满')
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 1,
                                    child:  Container(
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(color: Colors.greenAccent),
                                        child: Text('宽度撑满')
                                    )
                                  )
                                ]
                              )
                            ]
                        )
                    ),
                    Stack(
                      children: <Widget>[
                        Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 100,
                            height: 100
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network(
                            'http://www.devio.org/img/avatar.png',
                            width: 36,
                            height: 36
                          )
                        )
                      ],
                    ),
                    Wrap(
                      // 从左向右，自动换行
                      spacing: 8, // 水平边距
                      runSpacing: 6, // 垂直边距
                      children: <Widget>[
                        _chip('Flutter'),
                        _chip('吕嘉文'),
                        _chip('魏彩奕'),
                        _chip('马德伟'),
                        _chip('林洁琼'),
                        _chip('邓翔'),
                        _chip('Flutter'),
                        _chip('吕嘉文'),
                        _chip('魏彩奕'),
                        _chip('马德伟'),
                        _chip('林洁琼'),
                        _chip('邓翔'),
                        _chip('Flutter'),
                        _chip('吕嘉文'),
                        _chip('魏彩奕'),
                        _chip('马德伟'),
                        _chip('林洁琼'),
                        _chip('邓翔'),
                      ],
                    )
                  ]
              ),
              onRefresh: _handleRefresh
          ): Column(
            children: <Widget>[
              Text('列表'),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text('拉伸填满高度')
                )
              )

            ],
          )
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

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900, 
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10)
        )
      )

    );
  }
}
