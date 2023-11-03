


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iti1_project/news/components/components.dart';
import 'package:iti1_project/news/models/news_response.dart';
import 'package:iti1_project/reusable_component.dart';

class SearchNewsScreen extends StatefulWidget {

    @override
    _SearchNewsScreenState createState() => _SearchNewsScreenState();
  }

  class _SearchNewsScreenState extends State<SearchNewsScreen> {
    var searchController = TextEditingController();
    String imageUrl = "https://aqaarplus.com/assets/uploads/default.png";

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                myTextFormField(textInputAction: TextInputAction.search,
                    controller: searchController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        print('Write Search Key');
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Icons.search,
                    label: "Search",
                    onFieldSubmitted: (value) {
                      if (value.isEmpty) {
                        print('Write Search Key');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:
                            Text("Write search key", style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500),)));
                        return;
                      }
                      search(value);
                    }

                ),
                Visibility(
                  visible: isSearching,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
                   Expanded(child: searchBody(searchArticles,imageUrl)),
              ],
            ),
          ),
        ),
      );
    }
    List<Articles> searchArticles = [];
    bool isSearching = false;
        var date = DateTime.now();
    void search(String value) async {
      setState(() {
        isSearching = true;
      });
     // try {
        var response = await Dio().get(
          'https://newsapi.org/v2/everything',
          queryParameters: {
            "q": "$value",
            "from": "${date.year},${date.month},${date.day},",
            "sortBy": "publishedAt",
            "apiKey": "dff1d5b26ff04d79aa3048c9642f07f9",
          },
        );

        NewsResponse news = NewsResponse.fromJson(response.data);
        searchArticles = news.articles!;
        //emit(GetNewsState());
        setState(() {
             isSearching = false;
        });
     // }
      /*on DioError catch (e) {
        if (e.type == DioErrorType.response) {
          print('catched');
          print(e.response!.data['message']);
          return;
        }
        if (e.type == DioErrorType.connectTimeout) {
          print('check your connection');
          return;
        }

        if (e.type == DioErrorType.receiveTimeout) {
          print('unable to connect to the server');
          return;
        }

        if (e.type == DioErrorType.other) {
          print('Something went wrong');
          return;
        }
        print(e);
      } catch (e) {
        print(e);
      }*/
    }
  }
