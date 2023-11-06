import 'package:newsreader/model/source_model.dart';
class Article{
  Source? source;
  String? urlToImage;
  String? title;
  String? publishedAt;
  String? description;
  String? author;
  Article({
    this.urlToImage,
    this.source,
    this.title,
    this.description,
    this.author,
    this.publishedAt
});
  factory Article.fromJson(Map<String ,dynamic>json){
    return Article(
      source: Source.fromJson(json['source']),
      urlToImage: json['urlToImage'],
      title: json['title'],
      publishedAt: json['publishedAt'],
      description: json['description'],
      author: json['author'],
    );
  }
}