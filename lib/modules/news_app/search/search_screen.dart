import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/news_app/cubit/cubit.dart';
import 'package:kassem_app/layout/news_app/cubit/states.dart';
import 'package:kassem_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsState>(
      listener: (context , state){},
      builder: (context , state){
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  prefix: Icons.search,
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  lapelText: 'Search',

                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Search mustn\'t be empty';
                    }
                    return null;
                  },


                ),
              ),

              Expanded(child: articleBuilder(list , context , isSearch: true)),
            ],
          ),
        );


    }

    );
  }
}