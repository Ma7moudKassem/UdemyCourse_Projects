import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/news_app/cubit/cubit.dart';
import 'package:kassem_app/layout/news_app/cubit/states.dart';
import 'package:kassem_app/modules/news_app/search/search_screen.dart';

import 'package:kassem_app/shared/components/components.dart';
import 'package:kassem_app/shared/cubit/cubit.dart';
import 'package:kassem_app/shared/network/remote/dio_helper.dart';



//https://newsapi.org/v2/everything?q=tesla&apiKey=30a008ab3da04bcba83f1298035677e7

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsState>(
      listener: (context , index){},
      builder: (context,index){
        var cubit = NewsCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
             IconButton(onPressed: (){
               navigateTo(context, SearchScreen());

             },
                 icon: Icon(Icons.search)),
             IconButton(onPressed: (){
               AppCubit.get(context).changeMode();
             },
                 icon: Icon(Icons.brightness_4_outlined)),
              // IconButton(
              //     onPressed: (){},
              //     icon: Icon(
              //       Icons.search,
              //       color: Colors.black,
              //     )),
              // IconButton(
              //     onPressed: (){},
              //     icon: Icon(
              //       Icons.brightness_4_outlined,
              //       color: Colors.black,
              //     ))
            ],




          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentIndex,
            onTap: (index){

              cubit.changeBottomNavItem(index);
            },
          ),
          body: cubit.screen[cubit.currentIndex],

        );
      },
    );
  }
}
