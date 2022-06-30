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

