



import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kassem_app/layout/social_app/cubit/cubit.dart';
import 'package:kassem_app/layout/social_app/cubit/states.dart';
import 'package:kassem_app/models/social_app/post_model.dart';
import 'package:kassem_app/modules/social_app/new_post/new_post_screen.dart';
import 'package:kassem_app/shared/components/components.dart';

import 'package:kassem_app/shared/styles/icons_broken.dart';

class FeedsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context , state){},
      builder: (context , state){
        return  Scaffold(
          body:
          ConditionalBuilder(
            condition:SocialCubit.get(context).posts.length > 0 //&& SocialCubit.get(context).userModel != null,
              ,
            builder: (context)=>SingleChildScrollView(
              physics: BouncingScrollPhysics(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: InkWell(
                     onTap: (){navigateTo(context, NewPostScreen());},
                     child: Row(
                       children: [
                         CircleAvatar(


                           backgroundImage: NetworkImage('${SocialCubit.get(context).userModel.image}'),
                           radius: 25,
                         ),
                         SizedBox(width: 15,),
                         Text('What\'s on your mind?',

                             style: TextStyle(
                               fontSize: 15
                             )
                         ),

                       ],
                     ),
                   ),
                 ),


                  ListView.builder(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:  (context , index) => buildPostItem(SocialCubit.get(context).posts[index], context , index),

                      itemCount: SocialCubit.get(context).posts.length)
                ],
              ),
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          ),
        );
      },

    );



  }
  Widget buildPostItem(PostModel model , context , index)=> Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 10,
    margin: EdgeInsets.all(5.0),


    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(

                    backgroundImage: NetworkImage('${SocialCubit.get(context).userModel.image}'),
                    radius: 25,
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            Text('${SocialCubit.get(context).userModel.name}',

                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  height: 1.4
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.blueAccent,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),

                          ],

                        ),
                        Text('${model.dateTime}',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              height: 1.4
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 20,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 10
                ),
                child: Text(
                  '${model.text}',
                  style: TextStyle(
                      height: 1.3,
                      fontSize: 15
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       bottom: 10,
              //       top: 5
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     child: Wrap(
              //
              //       children: [
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(
              //               end: 6
              //           ),
              //           child: Container(
              //             height: 25,
              //             child: MaterialButton(onPressed: (){},
              //               minWidth: 1,
              //
              //               padding: EdgeInsets.zero,
              //               child: Text(
              //                 '#Software',
              //                 style: TextStyle(
              //                     color: Colors.blue
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(
              //               end: 6
              //           ),
              //           child: Container(
              //             height: 25,
              //             child: MaterialButton(onPressed: (){},
              //               minWidth: 1,
              //
              //               padding: EdgeInsets.zero,
              //               child: Text(
              //                 '#Flutter',
              //                 style: TextStyle(
              //                     color: Colors.blue
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //
              //       ],
              //     ),
              //
              //   ),
              // ),
              if(model.postImage != '')
                 Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 15
                ),
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage('${model.postImage}'),
                        fit: BoxFit.cover
                    ),

                  ),
                  width: double.infinity,
                  height: 200,






                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Heart,
                              size: 20,
                              color: Colors.red,

                            ),
                            SizedBox(width: 5,),
                            Text(
                              '${SocialCubit.get(context).likes[index]}',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){},
                    ),
                  ),
                  Expanded(
                    child: InkWell(

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              IconBroken.Chat,
                              size: 20,
                              color: Colors.amber,

                            ),
                            SizedBox(width: 5,),
                            Text(
                              '0 Comments',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){},
                    ),
                  ),

                ],
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10
                ),
                child: Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          CircleAvatar(

                            backgroundImage: NetworkImage('${SocialCubit.get(context).userModel.image}'),
                            radius: 18,
                          ),
                          SizedBox(width: 15,),
                          Text('Write a comment ...',

                              style: Theme.of(context).textTheme.caption
                          ),

                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 25,
                            color: Colors.red,

                          ),
                          SizedBox(width: 5,),
                          Text(
                            'Like',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      SocialCubit.get(context).likePost(SocialCubit.get(context).postId[index]);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),

                ],
              ),


            ],
          ),
        )
      ],
    ),
  );
}
