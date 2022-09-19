import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '热链',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("热链"),
          ),
          body: const WeiboMsgListPage(),
        ));
  }
}

class WeiboMsgListPage extends StatefulWidget {
  const WeiboMsgListPage({Key? key}) : super(key: key);

  @override
  State<WeiboMsgListPage> createState() => _WeiboMsgListPageState();
}

class _WeiboMsgListPageState extends State<WeiboMsgListPage> {
  int itemCount = 1;
  var dataList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: Text(dataList[index].keyword),
            );
          },
          itemCount: dataList.length,
        ),
        onRefresh: () async {
          getData();
        });
  }

  void getData() async {
    var url = "http://coderutil.com/api/resou/v1/weibo?size=10";
    try{
      var result = await Dio().get(url);
      if (jsonDecode(result.data)["code"] == 200) {
        var list = json.decode(result.data)["data"];
        setState(() {
          dataList.addAll(list);
        });
      } else {}
    }catch(e){
      print(e.toString());
    }
  }
}

class HotData {
  int rank = 0;
  String keyword = "";
  String url = "";
  int hotValue = 0;
}
