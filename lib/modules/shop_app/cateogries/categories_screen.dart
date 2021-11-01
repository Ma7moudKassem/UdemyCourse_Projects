import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/shop_app/cubit/cubit.dart';
import 'package:kassem_app/layout/shop_app/cubit/states.dart';
import 'package:kassem_app/models/shop_app/categories_model.dart';
import 'package:kassem_app/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopState>(
      listener: (context ,state){},
      builder: (context , state){
        ShopCubit.get(context).getCategories();
        return ListView.separated(
            itemBuilder: (context , index)=>buildCatItem(ShopCubit.get(context).categoriesModel.data.data[index]),
            separatorBuilder: (context , index)=> myDivider() ,
            itemCount: ShopCubit.get(context).categoriesModel.data.data.length);
      }
    );
    
  }

  Widget buildCatItem(DataModel model)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(model.image),
          height: 80,
          width: 80,
        fit: BoxFit.cover,),
        SizedBox(
          width: 20,
        ),
        Text(model.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
}
