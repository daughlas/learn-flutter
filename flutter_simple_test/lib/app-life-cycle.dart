
import 'package:flutter/material.dart';

class AppLifeCyclePage extends StatefulWidget {
  @override
  _AppLifeCyclePageState createState() => _AppLifeCyclePageState();
}

class _AppLifeCyclePageState extends State<AppLifeCyclePage>  with  WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP 生命周期'),
        leading: BackButton()
      ),
      body: Container(
        child: Text('APP 应用 生命周期')
      )
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if (state  == AppLifecycleState.paused) {
      print('App 进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('App 进入前台');
    } else if (state == AppLifecycleState.inactive) {
      // 来电话的时候，不常用
    } else if (state == AppLifecycleState.suspending) {
      // 挂起
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}