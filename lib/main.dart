import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti1_project/news/bloc_news/advanced_news_screen.dart';
import 'package:iti1_project/news/bloc_news/app_cubit.dart';
import 'package:iti1_project/news/bloc_news/news_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        AppCubit(InitAppState())
          ..getThemeMode(),),
        BlocProvider(create: (context) =>
        NewsCubit(InitNewsState())
          ..getBusinessNews()
          ..getSportsNews()
          ..getTechnologyNews()
          ..getScienceNews(),),
      ],

      child: BlocConsumer<AppCubit, AppStates>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          themeMode: AppCubit
              .get(context)
              .themeMode,
          //themeMode: ThemeMode.dark,
          home: //BlocHomeScreen(),
          AdvancedNewsScreen(),
        );
      }, listener: (context, state) {

      },),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
        color: Colors.blue,
        systemOverlayStyle: SystemUiOverlayStyle(
          /*statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,*/
          statusBarColor: Colors.blue,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      /*  floatingActionButtonTheme: null,
             bottomNavigationBarTheme: null,
             appBarTheme: null,
             toggleButtonsTheme: null,*/
      primarySwatch: Colors.brown,
      scaffoldBackgroundColor: Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
