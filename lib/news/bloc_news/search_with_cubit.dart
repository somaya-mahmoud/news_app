

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti1_project/news/bloc_news/news_cubit.dart';
import 'package:iti1_project/news/components/components.dart';

import '../../reusable_component.dart';

class SearchWithCubit extends StatelessWidget {
  var searchController = TextEditingController();
    @override
    Widget build(BuildContext context) {

      return BlocConsumer<NewsCubit,NewsStates>(builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
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
                        cubit.search(value);
                      }

                  ),
                  Visibility(
                    visible: cubit.isSearching,
                    child:
                    Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                  Expanded(child: searchBody(cubit.searchArticles,cubit.imageUrl)),
                ],
              ),
            ),
          ),
        );
      }, listener: (context, state) {

      },);
    }
  }
