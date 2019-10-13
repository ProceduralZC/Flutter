import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(HomePage());
  //状态栏一体化
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //不显示右上角Debug字样
      home: Scaffold(
        body: Column(
          children: <Widget>[
            GradientAppBar("标题"), //自定义渐变标题栏
          ],
        ),

      ),
    );
  }
}

//自定义一个渐变的标题栏
class GradientAppBar extends StatelessWidget {
  final String title; // 标题名称
  final double barHeight = 50.0; //标题栏高度

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return new Center(

      child: new Row(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Text(
                "为什么说Flutter是革命性的1",
                style: new TextStyle(
                    fontSize: 18.0
                ),
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    '央视网',
                  ),
                  new Text(
                    '2018-03-11',
                  ),
                ],
              ),
            ],
          ),
          new Image.asset(
            'images/head.jpg',
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}


