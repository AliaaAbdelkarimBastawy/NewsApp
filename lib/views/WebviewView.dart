import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Menu.dart';
import 'NavigationControls.dart';
import 'WebViewStack.dart';

class WebviewView extends StatefulWidget {
   final WebViewController controller;
   String URL;

   WebviewView({Key? key, required this.controller, required this.URL}) : super(key: key);

  @override
  State<WebviewView> createState() => _WebviewViewState();
}

class _WebviewViewState extends State<WebviewView> {


  @override
  void initState() {
    print("widget.URL");

    print(widget.URL);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          NavigationControls(controller: widget.controller),
          Menu(controller: widget.controller, URL: widget.URL,),               // ADD
        ],
      ),
      body: WebViewStack(controller: widget.controller, URL: widget.URL),
    );
  }
}
