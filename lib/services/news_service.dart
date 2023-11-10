import 'package:dio/dio.dart';

import '../Models/ArticleModel.dart';

class NewsService {
  // final dio = Dio();
  final Dio dio;
  String Category;

  NewsService({required this.dio,required this.Category});


  Future<List<ArticleModel>> getNews() async {
    List<ArticleModel> ListOfArticles = [];

    //Ha3mel request w asta2bel el data eli gayali men el request da
    Response response = await dio.get('https://newsapi.org/v2/top-headlines?category=${Category}&country=us&apiKey=3104d2727d434e69a7cf941e150cccca');
    Map<String, dynamic> jsonData = response.data;
    //Balash te3mel da la2en da msh men el 2 essential returned types
   // List<Map<String,dynamic>> articles = jsonData['articles'];

    List<dynamic> articles = jsonData['articles'];

    //eli hayrga3lak fy elmakan da e3tbro no3 el bayanat eli ana ha7adedo hena "as"
    // List<Map<String,dynamic>> articles = jsonData['articles'] as List<Map<String,dynamic>>;

    // articles.map((e)=>Article(image: e['urlToImage'], text1: e['author'], text2: e['title'])

    for(var article in articles)
      {
        ListOfArticles.add(
            ArticleModel.fromJson(article)
        );

        print("ehhh?");
        print(article['url']);
      }

    return ListOfArticles;
  }
}