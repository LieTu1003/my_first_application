import 'package:english_words/english_words.dart';
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
class HYContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HomeProductItem("Apple1", "macbook1", "imageURL"),
        SizedBox(height: 8,),
        HomeProductItem("Apple2", "macbook2", "imageURL"),
        SizedBox(height: 8,),
        HomeProductItem("Apple3", "macbook3", "imageURL"),
      ],
    );
  }
}
//Image.network()加载网络图片 异步加载
class HomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;
  HomeProductItem(this.title,this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration:BoxDecoration(
          border: Border.all(
            width: 5,//设置边框宽度
            color:Colors.yellow ,//设置边框颜色
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(title,style: TextStyle(fontSize: 25,color:Colors.yellow),),
          SizedBox(height: 8,),
          Text(desc,style: TextStyle(fontSize: 25,color:Colors.green),),
          SizedBox(height: 8,),
          Text(imageURL,style: TextStyle(fontSize: 25,color:Colors.orange),),
        ],
      ),

    );
  }
}


//column 垂直排列 垂直方向是主轴
//row 水平方向是主轴
//ctrl+alt+b

