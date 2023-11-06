import 'package:flutter/material.dart';
import 'package:newsreader/model/article_model.dart';
import 'package:newsreader/api_classes/api_service.dart';
import 'package:newsreader/newsview.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
ApiService client=ApiService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text("Daily News",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
        backgroundColor: Colors.black,),
      body:
      FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>>snapshot){
          if(snapshot.hasData){
            return  ListView.builder(
              itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                var articles=snapshot.data![index];
                  return GestureDetector(
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>News(article: articles)));
                    },
                    child:
                    Card(
                      child:Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(snapshot.data![index].urlToImage.toString()))),
                          )),
                          Expanded(
                            flex: 2,
                              child: Container(
                                height: 150,
                                child: Padding(padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data![index].title.toString(),style: TextStyle(fontSize: 15,color: Colors.black),),
                                      Text(snapshot.data![index].publishedAt.toString(),style: TextStyle(fontSize: 12,color: Colors.black),)
                                    ],
                                  ),

                                ),

                              ))
                        ],
                      )
                    ),

                  );
                });
          }
          return Center(child: CircularProgressIndicator(),);
        }
      )
     
    );
  }
}