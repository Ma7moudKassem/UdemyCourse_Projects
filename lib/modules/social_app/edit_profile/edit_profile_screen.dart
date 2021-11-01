import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/social_app/cubit/cubit.dart';
import 'package:kassem_app/layout/social_app/cubit/states.dart';
import 'package:kassem_app/shared/components/components.dart';
import 'package:kassem_app/shared/styles/icons_broken.dart';

class UpdateProfile extends StatelessWidget {

  var nameController  =TextEditingController();
  var bioController  =TextEditingController();
  var phoneController  =TextEditingController();




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context , state){},
      builder: (context , state){

        var userModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;

        nameController.text = userModel.name;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;



        return  Scaffold(
          appBar: defaultAppBar(context: context,
              title: Text('Edit your Profile'),
              actions: [
                defaultTextButton(function: (){
                  SocialCubit.get(context).updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                }, text: 'Update'),
                SizedBox(
                  width: 15,
                ),
              ]),

          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column (
                children: [
                  if(state is SocialUpdateUserLoadingState)
                    LinearProgressIndicator(),
                  // SizedBox(height: 10,),
                  Container(
                    height: 240,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                    coverImage == null ?
                                    NetworkImage('${userModel.cover}')
                                        : FileImage(coverImage),
                                    fit: BoxFit.cover,


                                  ),

                                ),


                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  child: IconButton(onPressed: (){
                                    SocialCubit.get(context).getCoverImage();
                                  }, icon: Icon(
                                    IconBroken.Camera,
                                    size: 25,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 69,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(

                                backgroundImage:profileImage == null ? NetworkImage('${userModel.image}') : FileImage(profileImage),
                                radius: 65,
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              child: IconButton(onPressed: (){
                                SocialCubit.get(context).getProfileImage();
                              }, icon: Icon(
                                IconBroken.Camera,
                                size: 25,
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  if(SocialCubit.get(context).profileImage != null  ||  SocialCubit.get(context).coverImage != null)
                  Row(
                    children: [
                      if(SocialCubit.get(context).profileImage != null)
                  Expanded(child: Column(
                    children: [
                      defaultButton(height: 50, text: 'upload Profile', function: (){
                        SocialCubit.get(context).uploadProfileImage(name: nameController.text, phone: phoneController.text, bio: bioController.text);
                      }, radius: 10),
                      if(state is SocialUpdateUserLoadingState)
                      SizedBox(
                        height: 5,
                      ),
                      if(state is SocialUpdateUserLoadingState)
                      LinearProgressIndicator(),
                    ],
                  )),
                      SizedBox(width: 5,),
                  if(SocialCubit.get(context).coverImage != null)
                      Expanded(child: Column(
                        children: [
                          defaultButton(height: 50, text: 'upload cover', function: (){
                            SocialCubit.get(context).uploadCoverImage(name: nameController.text, phone: phoneController.text, bio: bioController.text,
                            );
                          }, radius: 10),
                          if(state is SocialUpdateUserLoadingState)
                            SizedBox(
                              height: 5,
                            ),
                          if(state is SocialUpdateUserLoadingState)
                            LinearProgressIndicator(),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      prefix: IconBroken.User,
                      lapelText: 'Name',
                      validate: ( String  value ){

                        if (value.isEmpty)
                          {
                            return 'Name mustn\'t be empty';
                          }
                        return null ;
                      }),
                  SizedBox(height: 10,),

                  defaultTextFormField(
                      controller: bioController,
                      type: TextInputType.text,
                      prefix: IconBroken.Info_Circle,
                      lapelText: 'Bio...',
                      validate: ( String  value ){
                        if (value.isEmpty)
                        {
                          return 'Bio mustn\'t be empty';
                        }
                        return null ;
                      }),

                  SizedBox(height: 10,),


                  defaultTextFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      prefix: IconBroken.Call,
                      lapelText: 'Phone',
                      validate: ( String  value ){
                        if (value.isEmpty)
                        {
                          return 'Phone mustn\'t be empty';
                        }
                        return null ;
                      }),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
