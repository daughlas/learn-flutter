

/// 定义一个 Dart 类，所有的类都继承自 Object
class Person {
  String name;
  int age;
  // 标准构造方法
  Person(this.name, this.age);
  @override
  String toString() {
    return 'name:$name, age:$age';
  }
}

class Student extends Person {
  String _school; // 通过下划线来标示私有变量
  String city;
  String country;
  String name;

  // ：后边的表达式，叫做类的初始化列表
  // 通过 this._school 初始化自有参数
  // name， age 交给父类进行初始化
  // city 可选参数
  // country 默认参数为 China
  Student(this._school, String name, int age, {this.city, this.country='China'})
      : // 初始化列表，除了调用父类构造器，在子类构造方法体之前，你也可以初始化实例变量
        // 不同的初始化变量之间用 , 分割
        name='$country.$city',
        // 父类的构造方法，如果父类没有默认构造方法（无參的构造方法），则需要在出事化列表中，调用父类的构造方法进行初始化
        super(name, age){
    print('构造方法体不是必须的');
  }

  // 命名构造方法
  // 使用命名构造方法为实现类的多个构造方法
  Student.cover(Student stu): super(stu.name, stu.age){
    print('命名构造方法');
  }
}

class Logger {
  static Logger _cache;
  // 工厂构造方法：
  // 不仅仅是构造方法，更是一种模式
  // 有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足需求
  // 那么可以使用工厂模式来定义构造方法
  factory Logger() {
    if(_cache == null) {
      _cache=Logger._internal();
    }
    return _cache;
  }
  Logger._internal();
  void log(String msg) {
    print(msg);
  }
}
