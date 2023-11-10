import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../NewsListViewBuilder.dart';

class CategoryView extends StatelessWidget {
  String Category;
   CategoryView({Key? key, required this.Category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(Category,
          style: TextStyle(color: Colors.black),)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8,16,16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: const SizedBox(height: 16,),),
            NewsListViewBuilder(Category: Category, Url: '',),
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
