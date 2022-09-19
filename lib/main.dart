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
  int itemCount = 40;
  ScrollController scrollController = ScrollController();
  var dataList = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels>scrollController.position.maxScrollExtent-40){
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
            Widget tip = Text("");
            if(index == itemCount-1){
              tip = showWait();
            }
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("${index}"),
                ),
                tip
              ],
            );
          },
          itemCount: itemCount,
        ),
        onRefresh: () async {
          itemCount=40;
        });
  }

  void getData() async {
    await Future.delayed(Duration(milliseconds: 2000),(){
      setState(() {
        itemCount+=5;
      });
    });
  }
  Widget showWait(){
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      )
    );
  }
}
