import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('链接外部应哟过'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          }
        )
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _launchURL,
              child: Text('打开 Baidu.com'),
            ),
            RaisedButton(
              onPressed: _openMap,
              child: Text('打开地图'),
            ),
          ],
        )
      )
    );
  }

  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openMap() async {
    const url = 'geo:52.32, 4.917';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // iOS
      const url2 = 'http://maps.apple.com/?ll=52.32,4.917';
      if (await canLaunch(url2)) {
        await launch(url);
      } else {
        throw '无法打开';
      }
    }
  }
}
