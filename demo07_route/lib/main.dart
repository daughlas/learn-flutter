import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '页面跳转返回数据',
      home: FirstPage()
    )
  );
}


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('从子页面拿数据')),
      body: Center(
        child: RouteButton()
      )
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateToSonPage(context);
      },
      child: Text('去到子页面')
    );
  }

  _navigateToSonPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SonPage())
    );

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('$result')
      )
    );
  }
}

class SonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我是子页面')),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, '元素001, 123456789');
              }, 
              child: Text('元素001')
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, '元素002, 987654321');
              }, 
              child: Text('元素002')
            ),
          ],
        )
      )
    );
  }
}