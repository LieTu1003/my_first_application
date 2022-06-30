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
class HYContent extends StatefulWidget {
  const HYContent({Key? key}) : super(key: key);

  @override
  State<HYContent> createState() => _HYContentState();
}
/**
 * 为什么flutter在设计的时候StatefulWidget的build方法放在State中
 * 1、build出来的Widget是需要依赖State中的变量（状态）
 * 2、在编程过程中，Widget（描述信息）不断地销毁和创建
 * 而对于State中地数据可以修改，所以不需要重新创建*/
//state中有一个属性Widget，可以用来拿取上面Widget地内容
class _HYContentState extends State<HYContent> {
  int _counter=0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child:Icon(Icons.add) ,
                color: Colors.orange,
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
              ),
              RaisedButton(
                  child:Text("-",style: TextStyle(fontSize: 23),) ,
                  color: Colors.orange,
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });
                  }
              ),
            ],

          ),
          Text("当前计数器：$_counter"),
        ],
      ),
    );
  }
}

/**
 * 生命周期函数对我们开发者的意义是什么？
 * 1、初始化我们的一些数据、变量、状态
 * 2、发送网络请求
 * 3、监听组件中的事件
 * 4、管理内存（手动销毁）
 * flutter只需要监听Widget的生命周期*/