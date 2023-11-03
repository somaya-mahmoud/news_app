



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti1_project/news/bloc_news/app_cubit.dart';
import 'package:iti1_project/news/bloc_news/news_cubit.dart';
import 'package:iti1_project/news/bloc_news/search_with_cubit.dart';

class AdvancedNewsScreen extends StatelessWidget {

  late NewsCubit cubit;
    @override
    Widget build(BuildContext context) {

        return BlocConsumer<NewsCubit,NewsStates>(
          listener: (context, state) {

          },
        builder: (context, state) {
            cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchWithCubit(),));
                }, icon: Icon(Icons.search)),
                IconButton(onPressed: () {
                // change theme
                  AppCubit.get(context).changeThemeMode();
                }, icon: Icon(Icons.lightbulb)),
              ],
              title: Text(
                  cubit.categories[cubit.index]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              onTap: (value) {
                cubit.changeBottomNavigationState(value);
              },
              type: BottomNavigationBarType.fixed,

              items:[
                BottomNavigationBarItem(icon: Icon(Icons.add_business),label: cubit.categories[0]),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_baseball), label: cubit.categories[1]),
                BottomNavigationBarItem(
                    icon: Icon(Icons.biotech), label: cubit.categories[2]),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: cubit.categories[3]),
              ],
            ),
            body: cubit.screens[cubit.index],
          );
        },

      );
    }
  }
