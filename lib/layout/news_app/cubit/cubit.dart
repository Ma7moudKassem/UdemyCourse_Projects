import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/news_app/cubit/states.dart';
import 'package:kassem_app/modules/news_app/business/business_screen.dart';
import 'package:kassem_app/modules/news_app/science/science_screen.dart';
import 'package:kassem_app/modules/news_app/sports/sports_screen.dart';
import 'package:kassem_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit(): super(NewsInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);
   int currentIndex =  0;


  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),

    // BottomNavigationBarItem(
    //   icon: Icon(Icons.settings),
    //   label: 'Settings',
    // ),

  ];

  List<Widget> screen= [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),


  ];

  void changeBottomNavItem (int index){


    currentIndex = index;
    if (index == 0)
      getBusiness();


    if (index == 1)
      getSports();

    if (index == 2)
      getScience();

    emit(NewsBottomNavState());


  }

  List<dynamic> business = [];
  void getBusiness ()
  {
    emit(NewsBusinessLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country':'eg',

          'category':'business',
          'apiKey':'30a008ab3da04bcba83f1298035677e7',
        }
    ).then((value)
    {
      // print(value.data['articles'][0]['title'].toString());

      business = value.data['articles'];
      print(business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      
      emit(NewsGetBusinessErrorState(error.toString()));
    });

  }



  List<dynamic> sports = [];
  void getSports ()
  {
    emit(NewsSportsLoadingState());

    if(sports.length == 0)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {'country':'eg',

              'category':'sports',
              'apiKey':'30a008ab3da04bcba83f1298035677e7',
            }
        ).then((value)
        {
          // print(value.data['articles'][0]['title'].toString());

          sports = value.data['articles'];
          print(sports[0]['title']);

          emit(NewsGetSportsSuccessState());


        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));



        });
      }else
        {
          emit(NewsGetSportsSuccessState());
        }



  }


  List<dynamic> science= [];
  void getScience ()
  {
    emit(NewsScienceLoadingState());

    if(science.length == 0){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {'country':'eg',

            'category':'science',
            'apiKey':'30a008ab3da04bcba83f1298035677e7',
          }
      ).then((value)
      {
        // print(value.data['articles'][0]['title'].toString());

        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error)
      {
        print(error.toString());

        emit(NewsGetScienceErrorState(error.toString()));
      });

    }else{
      emit(NewsGetScienceSuccessState());
    }

  }


  List<dynamic> search= [];
  void getSearch (String value )
  {
    emit(NewsSearchLoadingState());
    //search = [] ;
    DioHelper.getData(
        url: 'v2/everything',
        query: {'q':'$value',


          'apiKey':'30a008ab3da04bcba83f1298035677e7',
        }
    ).then((value)
    {
      // print(value.data['articles'][0]['title'].toString());

      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessfulState());
    }).catchError((error)
    {
      print(error.toString());

      emit(NewsGetSearchErrorState(error.toString()));
    });
  }


}

