import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/shop_app/cubit/states.dart';
import 'package:kassem_app/models/shop_app/categories_model.dart';
import 'package:kassem_app/models/shop_app/home_model.dart';
import 'package:kassem_app/models/shop_app/login_model.dart';

import 'package:kassem_app/modules/shop_app/cateogries/categories_screen.dart';
import 'package:kassem_app/modules/shop_app/favorites/favorites_screen.dart';
import 'package:kassem_app/modules/shop_app/products/products_screen.dart';
import 'package:kassem_app/modules/shop_app/settings/settings_screen.dart';
import 'package:kassem_app/shared/components/constants.dart';
import 'package:kassem_app/shared/network/end_point.dart';
import 'package:kassem_app/shared/network/remote/dio_helper.dart';
class ShopCubit extends Cubit<ShopState>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens =
  [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex = index;

    emit(ShopChangeBottomNavState());
  }
  HomeModel homeModel;
  void getHomeData()
  {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
        url: HOME,
      token: token,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel.data.banners[0].image);
      print(homeModel.status);
      emit(ShopSuccessHomeDataState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel categoriesModel;
  void getCategories()
  {
    DioHelper.getData(
      url: GET_CATEGORIES,

    ).then((value)
    {
      categoriesModel = CategoriesModel.fromJson(value.data);


      emit(ShopSuccessCategoriesState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }
  ShopLoginModel userModel;
  void getUserData()
  {
    DioHelper.getData(
      url: PROFILE,
      token: token,

    ).then((value)
    {
      userModel = ShopLoginModel.fromJson(value.data);

      print(userModel.data.name);
      emit(ShopSuccessUserDataState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }
}