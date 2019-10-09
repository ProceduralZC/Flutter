import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:fluttercode6/utils/HttpUtils.dart';

class Network extends StatefulWidget {
  final String title;
  Network({Key key,this.title});

  @override
  createState() => new MyNetworkState(title: this.title);
}

class MyNetworkState extends State<Network> {
  String title;
  MyNetworkState({Key key,this.title});

  /*获取数据接口的调用*/
  // GET 请求
// 返回的结果直接就是 json 格式
// 要使用 await，必须在方法名后面加上 async
  _dioGetRequest () async {
    var result = await HttpUtils.request(
        'username=admin&password=123',
        method: HttpUtils.GET
    );
    setState(() {
      var content = result;
      print("userinfo="+content.toString());
      String josnNameString = convert.jsonEncode(content.toString());/*装换成json数据，做解析就行了*/
      print("token="+josnNameString);

    });
  }


// POST 请求
  _dioAddRequest () async {
    var result = await HttpUtils.request(
        'username=admin&password=123',
        method: HttpUtils.POST,
        data: {
          'username': "admin",
          'password': "123",
        }
    );
  }

// PUT 请求
  _dioEditRequest () async{
    var result = await HttpUtils.request(
        'username=admin&password=123',
        method: HttpUtils.PUT
    );
  }

// DELETE 请求
  _dioDelRequest () async {
    var result = await HttpUtils.request(
        'username=admin&password=123',
        method: HttpUtils.DELETE
    );
  }

  //初始化状态
  @override
  void initState() {
    super.initState();
    _dioGetRequest ();
  }

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