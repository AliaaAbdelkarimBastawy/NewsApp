class ArticleModel
{
  //Image can accept null values -Type of image is Nullable

  final String? image;
  final String  title;
  final String? description;
  final String URL;

  ArticleModel({required this.image, required this.title, required this.description, required this.URL});

  factory ArticleModel.fromJson(json)
  {
    return ArticleModel(image: json['urlToImage'],
        title: json['title'],
        description: json['description'], URL: json['url']);
  }
}