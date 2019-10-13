import 'package:flutter/material.dart';

/**
 * 页面默认模板
 */
void main() => runApp(TestCodeApp());

class TestCodeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestCodePage(title: '首页'),
    );
  }
}

class TestCodePage extends StatefulWidget {
  TestCodePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TestCodePageState createState() => _TestCodePageState();
}

class _TestCodePageState extends State<TestCodePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
      ),
    );
  }
}