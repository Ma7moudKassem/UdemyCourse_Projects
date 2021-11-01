//https://newsapi.org/v2/everything?q=tesla&apiKey=30a008ab3da04bcba83f1298035677e7


//base url :https://newsapi.org/
//path:



import 'package:kassem_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:kassem_app/shared/network/remote/cache_helper.dart';

import 'components.dart';

void signOut(context) {

  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

String token = '';
String uId = '';