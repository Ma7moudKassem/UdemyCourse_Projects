import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/social_app/cubit/cubit.dart';
import 'package:kassem_app/layout/social_app/cubit/states.dart';
import 'package:kassem_app/layout/social_app/social_layout.dart';
// import 'package:kassem_app/modules/social_app/feeds/feeds_screen.dart';
import 'package:kassem_app/shared/components/components.dart';
import 'package:kassem_app/shared/styles/icons_broken.dart';

class NewPostScreen extends StatelessWidget {

  var textController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialCubit , SocialStates>(
        listener: (context , state){},
     builder: (context , state)

      {
        return  Scaffold(
          appBar: defaultAppBar(
              context: context,
              title: Text('Create Post'),
              actions: [
                TextButton(
                    onPressed: (){
                      var now = DateTime.now();



                      if(SocialCubit.get(context).postImage == null )
                      {

                        SocialCubit.get(context).createPost(
                          dateTime: now.toString(),
                          text: textController.text,

                        );


                      }
                      else {
                        SocialCubit.get(context).uploadImagePost(
                          dateTime: now.toString(),
                          text: textController.text,

                        );


                      }



                    },
                    child: Text('POST',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)),
                SizedBox(width: 10,)
              ]),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(

                      backgroundImage: NetworkImage('${SocialCubit.get(context).userModel.image}'),
                      radius: 25,
                    ),
                    SizedBox(width: 15,),
                    Text('${SocialCubit.get(context).userModel.name}',

                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          height: 1.4
                      ),
                    ),


                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(

                      hintText: 'What\'s in your mind...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(SocialCubit.get(context).postImage != null)
                  // SizedBox(
                  //   height: 20,
                  // ),
                   Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      width: double.infinity,
                    height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: FileImage(SocialCubit.get(context).postImage),
                          fit: BoxFit.cover,


                        ),

                      ),


                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        child: IconButton(onPressed: (){
                           SocialCubit.get(context).removePostImage();
                        }, icon: Icon(
                          Icons.close,
                          size: 25,
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(

                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          SocialCubit.get(context).getPostImage();
                        }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconBroken.Image,
                          ),
                          SizedBox(width: 10,),
                          Text('Add Photo'),
                        ],
                      ),),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: (){}, child:Text('# Tags'),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
