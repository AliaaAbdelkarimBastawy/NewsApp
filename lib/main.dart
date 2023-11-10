import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/views/MainView.dart';
import 'package:redacted/redacted.dart';

import 'Models/ArticleModel.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainView()));
}



