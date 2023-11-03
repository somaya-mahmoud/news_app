

 import 'dart:io';
 import 'package:flutter/material.dart';
 import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewScreen extends StatelessWidget {

late String articleUrl;


NewsWebViewScreen(this.articleUrl);

  @override
    Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    print(articleUrl);
    return Scaffold(
            body: WebView(
              initialUrl: articleUrl,
            ),
      );
    }
  }
