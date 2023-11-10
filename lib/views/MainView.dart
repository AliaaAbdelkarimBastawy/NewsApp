import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/ArticleModel.dart';
import 'package:news_app/Models/HorizontalModel.dart';
import 'package:news_app/Models/VerticalModel.dart';
import 'package:dio/dio.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/CategoryView.dart';
import 'package:redacted/redacted.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../NewsListViewBuilder.dart';
import '../components/horizontal_item.dart';
import '../components/vertical_item.dart';
import 'NavigationControls.dart';

class MainView extends StatefulWidget {

  MainView({Key? key,}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  final List<HorizontalModel> HorizontalList =  const [
    HorizontalModel(Text: "Business", Image: "assets/business.webp"),
    HorizontalModel(Text: "Entertainment", Image: "assets/entertainment.webp"),
    HorizontalModel(Text: "General", Image: "assets/general.jpeg"),
    HorizontalModel(Text: "Health", Image: "assets/health.webp"),
    HorizontalModel(Text: "Science", Image: "assets/Science.webp"),
    HorizontalModel(Text: "Technology", Image: "assets/technology.webp"),
    HorizontalModel(Text: "Sports", Image: "assets/sportss.webp"),
  ];


   String category = 'general';

   @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("News",
              style: TextStyle(color: Colors.black),),
              Text("Cloud", style: TextStyle(color: Colors.orange),)],)),
      body: Padding(
       padding: const EdgeInsets.fromLTRB(16.0, 8,16,16),
       child: CustomScrollView(
         slivers: [
           SliverToBoxAdapter(child:Container(
             height: 100,
             child: ListView.builder(
                 physics: const BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                 itemCount: HorizontalList.length,
                 itemBuilder: (BuildContext context, int index) {
                   return GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)
                       {
                         return CategoryView(Category: HorizontalList[index].Text,);

                       }));
                     },
                       child: HorizontalItem(model: HorizontalList[index]));
                 },
               ),
           ),),

           SliverToBoxAdapter(child: const SizedBox(height: 16,),),
           NewsListViewBuilder(Category: 'general', Url: 'https://www.youtube.com/',),
         ],
       ),
       // Column(
       //   children: [
       //     Expanded(
       //       child: ListView.builder(
       //         physics: const BouncingScrollPhysics(),
       //         scrollDirection: Axis.horizontal,
       //         itemCount: HorizontalList.length,
       //         itemBuilder: (BuildContext context, int index) {
       //           return HorizontalItem(model: HorizontalList[index]);
       //         },
       //       ),
       //     ),
       //     const SizedBox(height: 16,),
       //     Expanded(
       //       flex: 4,
       //       child: ListView.builder(
       //         //shrinkWrap decreases the performance
       //         physics: const BouncingScrollPhysics(),
       //         scrollDirection: Axis.vertical,
       //         itemCount: VerticalList.length,
       //         itemBuilder: (BuildContext context, int index) {
       //           return VerticalItem(model: VerticalList[index]);
       //         },
       //       ),
       //     ),
       //
       //   ],
       // )
     ),
    );
  }
}
