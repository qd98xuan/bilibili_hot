import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/**
 * @author huangxuan
 * @since 2022/9/20 17:37
 * QQ: 1360643904
 * 热链详情 WebView
 */
class HotInfoWidget extends StatelessWidget {
  const HotInfoWidget({Key? key, required this.title, required this.url})
      : super(key: key);
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: HotInfoBody(url: url,),
    );
  }
}

class HotInfoBody extends StatefulWidget {
  const HotInfoBody({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<HotInfoBody> createState() => _HotInfoBodyState();
}

class _HotInfoBodyState extends State<HotInfoBody> {
  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}
