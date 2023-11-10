import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/WebviewView.dart';
import 'package:redacted/redacted.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Models/ArticleModel.dart';
import 'components/vertical_item.dart';

class NewsListViewBuilder extends StatefulWidget {
  List<ArticleModel> listOfArticles = [];
  String Url;
  String Category;

   NewsListViewBuilder({Key? key, required this.Category, required this.Url}) : super(key: key);

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  final dio = Dio();
  bool loading = true;
  Widget? loadingWidget;

  // Future<void> _initializeData() async {
  //   try {
  //     final articles = await NewsService(dio: dio).getNews();
  //     setState(() {
  //       widget.listOfArticles = articles;
  //       loading = false;
  //       // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //       //   Future.delayed(const Duration(seconds: 10), () {
  //       //     setState(() {
  //       //       loading = false;
  //       //     });
  //       //   });
  //       // });
  //
  //
  //     });
  //   } catch (error) {
  //     setState(() {
  //       widget.listOfArticles = [];
  //       loading = false;
  //     });
  //     // Handle any errors that may occur during initialization
  //   }
  // }


  //initState() must be synchronous
  var future;
  @override
  void initState() {
    super.initState();

    //Request is done only once in the init state,
    // the future builder will not rebuild
    future = NewsService(dio: dio, Category: widget.Category).getNews();
    // _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    // if (loadingWidget == null) {
    //   //The addPostFrameCallback method allows you to run code
    //   // after the current frame is painted.
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     setState(() {
    //       loadingWidget =
    //           VerticalItem(model: widget.listOfArticles[1]).redacted(
    //               context: context, redact: true);
    //     });
    //   });
    // }

    return FutureBuilder <List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(

                  childCount: snapshot.data!.length,
                      (context, index) {
                    return VerticalItem(model: snapshot.data![index],);

                  },));
          }

          else if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child: Text("OOPS, There was an error, try later"));
          }

          else {
            return SliverToBoxAdapter(child:
            Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
                child: Center(child: CircularProgressIndicator())),);
          }
        });
    //   if(loading)
    //     return
    //       //  Redacted Widget------------------
    //       // SliverList(
    //       //     delegate: SliverChildBuilderDelegate(
    //       //       childCount:listOfArticles.length
    //       //   ,(context, index) {
    //       //         return loadingWidget;
    //       // }, ))
    //
    //       SliverToBoxAdapter(child:
    //       Container(
    //         height: MediaQuery.of(context).size.height / 2,
    //         child: Center(child: CircularProgressIndicator())),);
    //   else if(widget.listOfArticles.isNotEmpty)
    //     return  NewsListView();
    //
    //   else
    //     return SliverToBoxAdapter(child: Text("OOPS, There was an error, try later"));
    //
    // }
    //
    // SliverList NewsListView() {
    //   return SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         childCount:widget.listOfArticles.length
    //         ,(context, index) {
    //         return VerticalItem(model: widget.listOfArticles[index]);
    //       }, ));
    // }
  }
}