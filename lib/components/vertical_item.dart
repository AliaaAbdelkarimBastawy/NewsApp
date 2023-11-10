import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/ArticleModel.dart';
import 'package:news_app/Models/VerticalModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../views/WebviewView.dart';

class VerticalItem extends StatefulWidget {
  ArticleModel model;


  VerticalItem({Key? key, required this.model,}) : super(key: key);

  @override
  State<VerticalItem> createState() => _VerticalItemState();
}

class _VerticalItemState extends State<VerticalItem> {
  late WebViewController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.model.URL),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {

            return WebviewView(controller: controller, URL: widget.model.URL,);

          },));},
        child: Column(children: [
          Container(
            child:  CachedNetworkImage(
              fit: BoxFit.fill,
              placeholder: (context, url) => Container(child: Center(child: CircularProgressIndicator())),
              imageUrl: widget.model.image ?? "",
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(children: [
            const SizedBox(height: 5,),
            Text(widget.model.title,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 5,),
            Text(widget.model.description?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),),
            const SizedBox(height: 10,),

          ],),
        ],),
      ),
    );
  }
}
