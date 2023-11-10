import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/HorizontalModel.dart';

class HorizontalItem extends StatelessWidget {
  HorizontalModel model;
  HorizontalItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(0,8,8,8.0),
      child: Container(
          child: Container(alignment: Alignment.center,
              child: Text(model.Text, style: const TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 18),)),
          width: 180,
          height: 120,
          decoration: BoxDecoration(color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(fit: BoxFit.fill,
                  image: AssetImage(model.Image))
             ),
      ),
    );
  }
}
