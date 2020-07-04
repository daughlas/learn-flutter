import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎您';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('美好人间')
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '美女类型',
                  helperText: '请输入你喜欢的类型'
                ),
                autofocus: false
              ),
              RaisedButton(
                onPressed: _chooseAction,
                child: Text('选择完毕')
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines:1
              )
            ],
          )
        )
      )
    );
  }

  void _chooseAction() {
    print('开始选择........................');
    if (typeController.text.toString() == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('美女类型不能为空'))
      );
      return;
    }
    getHttp(typeController.text.toString()).then((val) {
      print(val);
//      setState(() {
//        showText = val['data']['name'].toString();
//      });
    });
  }

  Future getHttp(String typeText) async {
    var url = 'http://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian';
    Dio dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      print('create');
      client.badCertificateCallback=(X509Certificate cert, String host, int port){
        print('123');
        return true;
      };
    };
    print('try');
    try {
      Response response;
      var data = {'name': typeText};
      response = await Dio().get(
        url,
        queryParameters: data
      );
      print(response);
      return response.data;
    } catch(e) {
      return print(e);
    }
  }
}
