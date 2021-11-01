import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/news_app/cubit/cubit.dart';
import 'package:kassem_app/layout/news_app/cubit/states.dart';
import 'package:kassem_app/shared/components/components.dart';

class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit , NewsState>(
      listener: (context , state){},
      builder: (context , state){

        var list = NewsCubit.get(context).sports;

        return articleBuilder(list, context);
      },

    );
  }
}
