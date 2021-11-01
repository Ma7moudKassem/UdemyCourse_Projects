import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/news_app/cubit/cubit.dart';
import 'package:kassem_app/layout/shop_app/cubit/cubit.dart';
import 'package:kassem_app/layout/shop_app/shop_layout.dart';
import 'package:kassem_app/layout/social_app/social_layout.dart';
//import 'package:kassem_app/modules/shop_app/cateogries/categories_screen.dart';
import 'package:kassem_app/modules/shop_app/login/shop_login_screen.dart';
//import 'package:kassem_app/modules/shop_app/on_boarding_app/on_boarding_screen.dart';
// import 'package:kassem_app/modules/shop_app/on_boarding_app/on_boarding_screen.dart';
// import 'package:kassem_app/modules/social_app/social_signup/cubit/cubit.dart';
import 'package:kassem_app/shared/bloc_observer.dart';
import 'package:kassem_app/shared/components/constants.dart';
import 'package:kassem_app/shared/cubit/cubit.dart';
import 'package:kassem_app/shared/cubit/states.dart';
import 'package:kassem_app/shared/network/remote/cache_helper.dart';
import 'package:kassem_app/shared/network/remote/dio_helper.dart';
import 'package:kassem_app/shared/styles/themes.dart';
import 'layout/social_app/cubit/cubit.dart';
import 'modules/social_app/social_login/social_login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  String token = CacheHelper.getData(key: 'token');

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = SocialLogin();
    widget = ShopLayout();
  }

  if (onBoarding != null) {
    if (token != null)
      widget = ShopLoginScreen();
  } else {}

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
// class myApp()
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => NewsCubit()
              ..getBusiness()
              ..getScience()
              ..getSports()),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getUserData(),
        ),
        BlocProvider(
          create: (BuildContext context) => SocialCubit()..getUserData()..getPost()
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: startWidget,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
