import 'package:flutter/material.dart';

class Network extends StatefulWidget {
  final String title;
  Network({Key key,this.title});

  @override
  createState() => new MyNetworkState(title: this.title);
}

class MyNetworkState extends State<Network> {
  String title;
  MyNetworkState({Key key,this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              '公众号   程序职场    '+title,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}