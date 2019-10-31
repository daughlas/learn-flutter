import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {

  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> {

  int _count = 0;

  @override
  void initState() {
    // 初始化工作
    print('-------- initState --------');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // createState 的时候会调
    // 数据变更的时候会调
    print('-------- didChangeDependencies --------');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LifeCyclePage oldWidget) {
    print('-------- didUpdateWidget --------');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('-------- deactivate --------');
    super.deactivate();
  }

  @override
  void dispose() {
    print('-------- dispose --------');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print('-------- build --------');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget 生命周期'),
        leading: BackButton()
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text('点我', style: TextStyle(fontSize: 26))
            ),
            Text(_count.toString())
          ],
        )
      )
    );
  }


}