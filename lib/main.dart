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
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(5),
            child: Text(""),
          );
        },itemCount: itemCount,),
        onRefresh: () async {
          setState(() {
            itemCount =  20;
          });
        });
  }
}
