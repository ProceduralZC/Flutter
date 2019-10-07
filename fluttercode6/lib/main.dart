import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttercode6/Network.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: ListviewHttp(),
    );
  }
}

class ListviewHttp extends StatefulWidget {
  @override
  ListviewHttpState createState() {
    return new ListviewHttpState();
  }
}

class ListviewHttpState extends State<ListviewHttp> {
  List<ListData> _list = [];

  //异步加载数据
  _loadData() async {
    String url = "http://121.42.197.96:8089/materials/ms/userlogin?username=admin&password=123";
    http.Response response = await http.get(url);
    setState(() {
      final data = jsonDecode(response.body);
      var content = data["items"][0]["truename"];
      print(content);
//      for (var _data in data) {
//        _list.add(ListData(_data["items"][0]["truename"],_data["items"][0]["truename"]));
//      }
//      添加多条数据
      _list.add(ListData(data["items"][0]["truename"],"http://cdn.duitang.com/uploads/item/201410/26/20141026191422_yEKyd.thumb.700_0.jpeg"));
      _list.add(ListData("刘德华","http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190207/fae874c24644427eaf1b0e21b0ac8dd7.jpeg"));
      _list.add(ListData("张学友","http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190207/fae874c24644427eaf1b0e21b0ac8dd7.jpeg"));
      _list.add(ListData("周杰伦","http://pic4.zhimg.com/50/v2-46c2eb18d011d3711617a2664844e5fd_hd.jpg"));
      _list.add(ListData("周星驰","http://pic4.zhimg.com/50/v2-51aa810fdfc92d7118c21c5bfa42feb7_hd.jpg"));
      _list.add(ListData("李连杰","http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190101/17197cec8e9e48b6a0ac72b0ca15d444.jpeg"));
    });
  }

//  post请求
//  void postRequest() async {
//    var params = Map<String, String>();
//    params["username"] = "hellonews";
//    params["password"] = "123456";
//
//    var client = http.Client();
//    var response = await client.post(url_post, body: params);
//    _content = response.body;
//  }

  //构造listtile
  Widget _buildRow(int index) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: ListTile(
        title: Text(_list[index].userName),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_list[index].avatarUrl),
        ),
        onTap: () async {
          final result = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            return Network(title:"点击我进来的=：追梦蜗牛");
          }));
          if (result != null && result == "refresh") {//做一些进入处理操作，比如加载效果
//                Constants.eventBus.fire(LoginEvent());
          }
        },
      ),
    );
  }

  //初始化状态
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Http Test"),
      ),
      body: ListView.separated(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) => _buildRow(index),
        //子项的分割线
        separatorBuilder: (BuildContext context,int index) => Divider(),
      ),
    );
  }
}

//数据类，将json数据转换为对象
class ListData {
  final String userName;
  final String avatarUrl;
  ListData(this.userName, this.avatarUrl);
}

