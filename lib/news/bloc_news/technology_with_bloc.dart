

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti1_project/news/bloc_news/news_cubit.dart';
import 'package:iti1_project/news/components/components.dart';

class TechnologyWithBloc extends StatelessWidget {
late NewsCubit cubit ;
   @override
   Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit,NewsStates>(builder: (context, state) {
       cubit  = NewsCubit.get(context);
       return Scaffold(
         body: newsBody(cubit.technologyArticles,cubit.imageUrl),

       );
     }, listener: (context, state) {

     },);
   }
 }
