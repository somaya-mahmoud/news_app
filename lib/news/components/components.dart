


  import 'package:flutter/material.dart';
import 'package:iti1_project/news/bloc_news/news_web_view_screen.dart';
import 'package:iti1_project/news/models/news_response.dart';

Widget newsBody(List<Articles> articles,String imageUrl){
    return articles.isEmpty
      ? Center(
    child: CircularProgressIndicator.adaptive(),
  )
      :
  ListView.builder(
    itemBuilder: (context, index) {
      bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
      return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsWebViewScreen(articles[index].url!),));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:isDarkMode ? Colors.black: Colors.grey[300]),
        child: Column(
          children: [
            Image.network(articles[index].urlToImage ?? imageUrl),
            SizedBox(
              height: 10,
            ),
            Text(
              articles[index].title!,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
    },
    itemCount: articles.length,
  );



}


  Widget searchBody(List<Articles> articles,String imageUrl){

   return ListView.builder(
    itemBuilder: (context, index){
      bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
      return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsWebViewScreen(articles[index].url!),));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:isDarkMode ? Colors.black: Colors.grey[300]),
          child: Column(
            children: [
              Image.network(articles[index].urlToImage ?? imageUrl),
              SizedBox(
                height: 10,
              ),
              Text(
                articles[index].title!,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
            ],
          ),
        ),
      );
    },

    itemCount: articles.length,
  );
  }







