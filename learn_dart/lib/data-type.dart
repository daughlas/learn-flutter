import 'package:flutter/material.dart';

/// 常用数据类型
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();
    return Container(child:Text('常用数据类型，请查看控制台输出'));
  }
  /// 数字类型
  void _numType() {
    num num1 = -1.0;// num 是数字类型的父类
    num num2 = 2;// num 是数字类型的父类
    int int1 = 3;// int 类型，只能接受整数
    double d1 = 1.678;// double 双精度
    print("num:$num1 num:$num2 int:$int1 double: $d1");
    print(num1.abs()); // 求绝对值
    print(num1.toInt()); // 转换成整数
    print(num1.toDouble());// 转换成 double
  }

  // 字符串
  void _stringType() {
    String str1 = '字符串';
    String str2 = "双引号";
    String str3 = 'str:$str1 str2:$str2'; // 字符串拼接
    String str4 = 'str1:' + str1 + ' str2:' + str2;
    print(str3);
    print(str4);

    // 常用方法
    String str5 = '常用数据类型，请看控制台输出';
    print(str5.substring(1, 5)); // 字符串截取
    print(str5.indexOf('类型')); // 获取指定字符串位置
  }

  // 布尔类型，Dart 是强 bool 类型检查，只有 bool 类型的值是 true，才被认为是 true
  void _boolType() {
    bool success = true, fail = false;
    print(success);
    print(fail);

    // 常用方法
    print(success || fail);
    print(success && fail);
  }

  // List 集合
  void _listType() {
    print('---_listType----');
    // 集合初始化的方式
    List list = [1, 2, 3, '集合'];
    print(list);
    List<int> list2 = [1, 3, 5];
    List list3  = [];
    list3.add('list3');// 通过 add 方法添加元素
    list3.addAll(list);
    print(list3);

    List list4 = List.generate(3, (index) => index*2);
    print(list4);

    // 集合的遍历
    for(int i = 0; i < list.length; i++) {
      print(list[i]);
    }
    for(var o in list) {
      print(o);
    }
    list.forEach((val) {
      print(val);
    });
  }

  // Map
  // Map 是将 key 和 value 相关联的对象，key 和 value 都可以是任何类型的对象
  // 并且 key是唯一的
  // 如果key 重复，后面的会覆盖前面的key 里边的内容
  void _mapType() {
    print('---_mapType----');
    Map names = {'xiaoming': '小明', 'xiaohong': '小红'};
    print(names);
    Map ages = {};
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 14;
    print(ages);
    // 遍历
    ages.forEach((k, v){
      print('$k, $v');
    });
    Map ages2 = ages.map((k, v) {
      return MapEntry(v, k);
    });
    print(ages2);
    print('map 遍历方法之 for 循环');
    for (var key in ages.keys) {
      print('$key ${ages[key]}');
    }
  }

  // 科普小知识： dynamic、var、Object 三折的区别
  void _tips() {
    // dynamic
    dynamic x = 'hal';
    print(x.runtimeType);
    print(x);
    x = 123;
    print(x.runtimeType);
    print(x);

    // var
    // var 和 dynamic 的区别是数据类型一旦被确定，就不能修改了
    var a = 'var';
    print(a.runtimeType);
    print(a);

    // Object dart 对象的基类
    Object o1 = '111';
    print(o1.runtimeType);
    print(o1);
  }
}
