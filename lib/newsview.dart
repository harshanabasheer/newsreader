import 'package:flutter/material.dart';
import 'package:newsreader/model/article_model.dart';

class News extends StatelessWidget {
  final Article article;
  News({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Image(image: NetworkImage(article.urlToImage.toString())),
          Padding(padding: const EdgeInsets.all(8.0),
            child: Text(article.title.toString(),style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          Padding(padding: const EdgeInsets.all(8.0),
            child: Text(article.description.toString(),style: TextStyle(color: Colors.black,fontSize: 20),),
          ),
          Padding(padding: const EdgeInsets.all(8.0),
            child: Text(article.author.toString(),style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
          ),

        ],
      )
    );
  }
}
