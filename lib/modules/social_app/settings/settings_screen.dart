import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/social_app/cubit/cubit.dart';
import 'package:kassem_app/layout/social_app/cubit/states.dart';
import 'package:kassem_app/modules/social_app/edit_profile/edit_profile_screen.dart';
import 'package:kassem_app/modules/social_app/search/search_screen.dart';
import 'package:kassem_app/shared/components/components.dart';
import 'package:kassem_app/shared/styles/icons_broken.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(

      listener: (context , state ){},
      builder: (context , state ){
        var userModel = SocialCubit.get(context).userModel;
        return Scaffold(
          appBar: defaultAppBar(context: context,
            titleSpacing:0,

            title: Padding(
              padding: const EdgeInsetsDirectional.only(end: 30),
              child: InkWell(
                onTap: (){
                  navigateTo(context, SearchScreen());
                },
                child: Container(
                  height: 35,

                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconBroken.Search,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 10,),
                          Text('Search',style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 240,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage('${userModel.cover}'),
                                  fit: BoxFit.cover,


                                ),

                              ),


                            ),
                          ),
                          CircleAvatar(
                            radius: 69,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(

                              backgroundImage: NetworkImage('${userModel.image}'),
                              radius: 65,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${userModel.name}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      ' ${userModel.bio}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '100',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                    'Posts'
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '40',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                    'Photos'
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '5K',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                    'Followers'
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '120',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                    'Following'
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: (){},
                            child: Text('Add Photos',
                                style:TextStyle(
                                    fontWeight: FontWeight.bold
                                )),),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        OutlinedButton(
                            onPressed: (){
                              navigateTo(context, UpdateProfile());
                            },
                            child: Icon(IconBroken.Edit_Square,
                              size: 22,)),
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        );
      },

    );

  }
}
