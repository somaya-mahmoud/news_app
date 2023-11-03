
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti1_project/news/bloc_news/business_with_bloc.dart';
import 'package:iti1_project/news/bloc_news/science_with_bloc.dart';
import 'package:iti1_project/news/bloc_news/sports_with_bloc.dart';
import 'package:iti1_project/news/bloc_news/technology_with_bloc.dart';
import 'package:iti1_project/news/models/news_response.dart';

class NewsStates{}

  class InitNewsState extends NewsStates{}
  class GetNewsState extends NewsStates{}
  class SearchNewsState extends NewsStates{}
class BottomNavigationChangeState extends NewsStates {}


  class ChangeNewsNavigationState extends NewsStates{}

  class NewsCubit extends Cubit<NewsStates> {
    NewsCubit(initialState) : super(initialState);

    static NewsCubit get(context) => BlocProvider.of(context);
    int index = 0;
    List<String> categories = ["Business", "Sports", "Technology", "Science"];
    List<Widget> screens = [
      BusinessWithBloc(),
      SportsWithBloc(),
      TechnologyWithBloc(),
      ScienceWithBloc()
    ];
    List<Articles> businessArticles = [];
    List<Articles> sportsArticles = [];
    List<Articles> technologyArticles = [];
    List<Articles> scienceArticles = [];

    String imageUrl = "https://aqaarplus.com/assets/uploads/default.png";

    int bottomNavigationIndex = 0;

    void changeBottomNavigationState(int value) {
      bottomNavigationIndex = value;
      emit(BottomNavigationChangeState());
    }

    void getBusinessNews() async {
      try {
        var response = await Dio().get(
          'https://newsapi.org/v2/top-headlines',
          queryParameters: {
            "country": "eg",
            "category": "business",
            "apiKey": "fa72aea7f1af46a6a45be8aa23e21b64",
          },
        );

        NewsResponse news = NewsResponse.fromJson(response.data);
        businessArticles = news.articles!;
        emit(GetNewsState());
      } catch (e) {
        print(e);
      }
    }

    void getSportsNews() async {
      try {
        var response = await Dio().get(
          'https://newsapi.org/v2/top-headlines',
          queryParameters: {
            "country": "eg",
            "category": "sports",
            "apiKey": "fa72aea7f1af46a6a45be8aa23e21b64",
          },
        );

        NewsResponse news = NewsResponse.fromJson(response.data);
        sportsArticles = news.articles!;
        emit(GetNewsState());
      } catch (e) {
        print(e);
      }
    }

    void getTechnologyNews() async {
      var response = await Dio().get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          "country": "eg",
          "category": "technology",
          "apiKey": "fa72aea7f1af46a6a45be8aa23e21b64",
        },
      );

      NewsResponse news = NewsResponse.fromJson(response.data);
      technologyArticles = news.articles!;
      emit(GetNewsState());
    }



      List<Articles> searchArticles = [];

      bool isSearching = false;

      var date = DateTime.now();

      void search(String value) async {
        isSearching = true;

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
          emit(SearchNewsState());
          isSearching = false;

      }
      void getScienceNews() async {
        try {
          var response = await Dio().get(
            'https://newsapi.org/v2/top-headlines',
            queryParameters: {
              "country": "eg",
              "category": "science",
              "apiKey": "dff1d5b26ff04d79aa3048c9642f07f9",
            },
          );

          NewsResponse news = NewsResponse.fromJson(response.data);
          scienceArticles = news.articles!;
          emit(GetNewsState());
        } catch (e) {
          print(e);
        }
      }

    }