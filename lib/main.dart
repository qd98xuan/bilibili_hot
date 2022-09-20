import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hot_list/hot_item.dart';

/**
* @author huangxuan
* @since 2022/9/20 17:04
* QQ: 1360643904
* 热搜列表
*/
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
  ScrollController scrollController = ScrollController();
  var dataList = [];

  //页数
  int pn = 1;
  int ps = 20;

  //是否还有数据
  bool hasData = true;

  @override
  void initState() {
    super.initState();
    getData();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 40) {
        pn++;
        getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
          controller: scrollController,
          itemBuilder: (BuildContext context, int index) {
            Widget tip = const Text("");
            if (index == dataList.length - 1) {
              tip = showWait();
            }
            //每一项的Item
            return generateItem(tip, dataList, index);
          },
          itemCount: dataList.length,
        ),
        onRefresh: () async {
          pn = 1;
          dataList.clear();
          getData();
        });
  }

  void getData() async {
    String url = "https://api.bilibili.com/x/web-interface/popular";
    var request = await Dio().get(url, queryParameters: {"ps": ps, "pn": pn});
    var data = request.data;
    print(data);
    if (data["code"] == 0) {
      setState(() {
        dataList.addAll(data["data"]["list"]);
      });
    } else {
      print("请求失败：${data["message"]}");
    }
  }

  Widget showWait() {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.yellow,
    ));
  }
}
