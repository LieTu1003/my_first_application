import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '任务清单'),
      routes: {
        "home_page": (context) => const MyHomePage(title: '任务清单'),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<String>(
            //这是点击弹出菜单的操作
              onSelected: (String value) {},
              //这是弹出菜单的建立，包含了两个子项
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Text('设置'),
                      Icon(Icons.settings)
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Text('关于'),
                      Icon(Icons.help_outline),
                    ],
                  ),
                )
              ])
          //导航栏右侧菜单
        ],
      ),

      drawer: const MyDrawer(), //抽屉

      // ignore: unnecessary_new
      body: Center(
          child: HomeContent()
      ),

      floatingActionButton: FloatingActionButton(
        //悬浮按钮
        onPressed: () {
          _onAdd();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageADD(
                    title: 'B页面',
                    data: "要传递的数据",
                  )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration:
              BoxDecoration(color: Color.fromARGB(255, 255, 59, 141)),
              child: Text(
                '菜单',
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('任务清单'),
            onTap: () {
              Navigator.of(context).pushNamed("home_page");
            },
          ),
          const ListTile(
            leading: Icon(Icons.alarm),
            title: Text('番茄钟'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('关于'),
            onTap: () {
              showAlertDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('关于'),
        content: const Text('本APP解释权归移动应用软件开发课程第二小组所有'),
        actions: <Widget>[
          FlatButton(
            child: const Text('确定'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class  HomeContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        everyList("任务一 完成计算机图形学作业","2022/6/28  13:05"),
        SizedBox(height:8),
        everyList("任务二 完成数电作业","2022/6/28  13:05"),
      ],
    );
  }
}

class everyList extends StatefulWidget {
  final String  title;
  final String data;
  everyList(this.title,this.data);
  @override
  State<everyList> createState() => _everyListState();
}

class _everyListState extends State<everyList> {
  var now=DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
              width: 5,
              color: Colors.yellow
          ),
        ),
        child: Row(
          children:<Widget>[
            SwitchAndCheckBoxTestRoute(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget>[
                    Icon(Icons.alarm,),
                    Text("${widget.title}",style:TextStyle(fontSize: 20,color: Colors.blue))
                  ],

                ),
                SizedBox(height:8),
                Row(
                  children:<Widget>[
                    Text("截至时间：${widget.data}",style:TextStyle(fontSize: 20,color: Colors.blue)),
                    SizedBox(width: 250,),
                    Text("剩余时间：01:05:30",style:TextStyle(fontSize: 20,color: Colors.blue)),
                  ],)
              ],),
          ], )


    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面
            setState(() {
              _switchSelected=value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){
            setState(() {
              _checkboxSelected=value!;
            });
          } ,
        )
      ],
    );
  }
}

class ShowInputAlertWidget extends StatefulWidget {
  final confirmCallback;
  final title;
  final placeholder;
  const ShowInputAlertWidget(this.confirmCallback, this.title, this.placeholder);

  @override
  State<ShowInputAlertWidget> createState() => _ShowInputAlertWidgetState();
}


class _ShowInputAlertWidgetState extends State<ShowInputAlertWidget> {
  String inputValue ='';
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title:Text(widget.title),
      content:Column(
        children: [
          CupertinoTextField(
            placeholder:widget.placeholder,
            onChanged: (value){
              inputValue = value;
            },
          )
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child:Text('取消'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child:Text('确定'),
          onPressed: (){
            widget.confirmCallback(inputValue);
          },
        )
      ],
    );
  }
}
class PageADD extends StatelessWidget {
  String data;

  PageADD({Key? key, required this.data, required String title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("B页面"),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("home_page");
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}




