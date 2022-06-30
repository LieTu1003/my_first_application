import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HYHomePage(),
    );

  }
}
class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("商品列表"),
      ) ,
      body: HYContent(),
    );
  }
}
//Widget 暴露
// state 不能暴露
//stateless 的生命周期就是构造函数和Build方法
// class HYContent extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Text("你好，李银河");
//   }
// }
//Stateful 的生命周期
class HYContent extends StatefulWidget {
  HYContent(){
    print("1、调用HYContent的构造函数");
  }
  @override
  State<HYContent> createState() {
    print("2、调用HYContent的createState方法");
    return _HYContentState();

  }
}

class _HYContentState extends State<HYContent> {
  int _counter=0;
  _HYContentState(){
    print("3、调用_HYContentState的构造方法");
  }
  @override
  void initState(){
    //强调：这里必须调用super
    super.initState();
    print("4、调用initState");
  }
  @override
  void didUpdateWidget(covariant HYContent oldWidget) {
    // TODO: implement didUpdateWidget
    print("调用didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void didChangeDependencies() {
    print("调用didChangeDependencies");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    print("5、调用build方法");
    return Column(
      children: <Widget>[
        RaisedButton(
          child:Icon(Icons.add),
          onPressed:(){
            setState(() {
              _counter++;
            });

          },
        ),
        Text("数字：$_counter"),
      ],
    );
  }
  @override
  void dispose() {
    print("6、销毁");
    super.dispose();
  }

}
