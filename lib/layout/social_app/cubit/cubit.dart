import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kassem_app/layout/social_app/cubit/states.dart';
import 'package:kassem_app/models/social_app/post_model.dart';
import 'package:kassem_app/models/social_app/social_user_model.dart';
import 'package:kassem_app/modules/social_app/chats/chats_screen.dart';
import 'package:kassem_app/modules/social_app/feeds/feeds_screen.dart';
import 'package:kassem_app/modules/social_app/notifications/notifications_screen.dart';
// import 'package:kassem_app/modules/social_app/settings/settings_screen.dart';
// import 'package:kassem_app/modules/social_app/social_signup/cubit/states.dart';
import 'package:kassem_app/modules/social_app/users/users_screen.dart';
import 'package:kassem_app/shared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit() : super (SocialInitialState());

  static SocialCubit get(context)=> BlocProvider.of(context);

  SocialUserModel userModel ;



  void getUserData()
  {
    emit(SocialGetLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get(

    ).then((value){

      // print(value.data());

      userModel  = SocialUserModel.fromJson(value.data());
      print(userModel.name);
      print(userModel.image);
      print(userModel.uId);
      print(userModel.cover);

      emit(SocialGetUserSuccessState());
    }).catchError((error){

      print(error.toString());

      emit(SocialGetUserErrorState(error.toString()));

    });
  }

  int currentIndex = 0 ;

  List<Widget> screens =
      [
        FeedsScreen(),
        ChatsScreen(),
        UsersScreen(),
        NotificationsScreen(),

      ];

  List<String> titles =
  [
   'Home',
   'Chats',
   'Users',
   'Notification',

  ];

  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }


  File profileImage ;
  var picker = ImagePicker();

  Future<void> getProfileImage() async
  {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery
    );
    if(pickedFile != null )
      {
        profileImage = File(pickedFile.path);
        emit(SocialImageProfilePickedSuccessState());
      }
    else
      {
        print('No Image Selected ');
        emit(SocialImageProfilePickedErrorState());
      }

  }




  File coverImage ;

  Future<void> getCoverImage() async
  {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery
    );
    if(pickedFile != null )
    {
      coverImage = File(pickedFile.path);
      emit(SocialImageCoverPickedSuccessState());
    }
    else
    {
      print('No Image Selected ');
      emit(SocialImageCoverPickedErrorState());
    }

  }



  void uploadProfileImage ({
    @required String name,
    @required String phone,
    @required String bio,
})
  {
    emit(SocialUpdateUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
          value.ref.getDownloadURL().then((value) {
            print(value);
            updateUser(name: name, phone: phone, bio: bio, image: value);

            //emit(SocialUploadImageProfileSuccessState());
          }).catchError((error){

            emit(SocialUploadImageProfileErrorState());

          });
    }).catchError((error){

      emit(SocialUploadImageProfileErrorState());

    });
  }





  void uploadCoverImage ({
    @required String name,
    @required String phone,
    @required String bio,
})
  {
    emit(SocialUpdateUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateUser(name: name, phone: phone, bio: bio,cover: value);

       // emit(SocialUploadImageCoverSuccessState());
      }).catchError((error){

        emit(SocialUploadImageCoverErrorState());

      });
    }).catchError((error){

      emit(SocialUploadImageCoverErrorState());

    });
  }




//
//   void updateUserImages({
//   @required String name,
//   @required String phone,
//   @required String bio,
// })
//   {
//     emit(SocialUpdateUserLoadingState());
//     if(profileImage != null)
//       {
//         uploadProfileImage();
//       }
//    else if(coverImage != null)
//       {
//         uploadCoverImage();
//       }
//     else
//       {
//         updateUser(
//           name: name,
//           bio: bio,
//           phone: phone
//         );
//
//
//       }
//
//   }

  void updateUser({
    @required String name,
    @required String phone,
    @required String bio,
    String cover,
    String image,
  })
  {
    SocialUserModel model = SocialUserModel(
      name: name,
      phone: phone,
      bio:  bio,
      email: userModel.email,
      cover: cover??userModel.cover,
      image: image??userModel.image,
      uId: userModel.uId,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value)
    {
      getUserData();
    })
        .catchError((error){
      print(error.toString());
      emit(SocialUpdateUserErrorState());
    });

  }


  File postImage ;

  Future<void> getPostImage() async
  {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery
    );
    if(pickedFile != null )
    {
      postImage = File(pickedFile.path);
      emit(SocialImagePostPickedSuccessState());
    }
    else
    {
      print('No Image Selected ');
      emit(SocialImagePostPickedErrorState());
    }

  }

  void uploadPostImage ({
    @required String name,
    @required String phone,
    @required String bio,
  })
  {
    emit(SocialUpdateUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateUser(name: name, phone: phone, bio: bio, image: value);

        //emit(SocialUploadImageProfileSuccessState());
      }).catchError((error){

        emit(SocialUploadImageProfileErrorState());

      });
    }).catchError((error){

      emit(SocialUploadImageProfileErrorState());

    });
  }

  void removePostImage()
  {
    postImage = null;
    
    emit(SocialRemovePostImageState());
    
  }


  void uploadImagePost ({

    @required String dateTime,
    @required String text,


  })
  {
    emit(SocialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        createPost(dateTime: dateTime, text: text, postImage: value,);


        // emit(SocialUploadImageCoverSuccessState());
      }).catchError((error){

        emit(SocialCreatePostErrorState(error));

      });
    }).catchError((error){

      emit(SocialCreatePostErrorState(error));

    });
  }



  void createPost({

    @required String dateTime,
    @required String text,
      String postImage,

  })
  {
    emit(SocialCreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel.name,
      image:userModel.image,
      uId: userModel.uId,
      text: text,
      dateTime: dateTime,
      postImage: postImage??'',

    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value)
    {
      emit(SocialCreatePostSuccessState());
     
    })
        .catchError((error){
      print(error.toString());
      emit(SocialCreatePostErrorState(error));
    });
  }

  List<PostModel> posts=[];

  void getPost(){
    FirebaseFirestore.instance.collection('posts')
        .get().then((value) {

      value.docs.forEach((element) {
        posts.add(PostModel.fromJson(element.data()));

      });
          emit(SocialGetPostSuccessState());

        }).catchError((error){

          emit(SocialGetPostErrorState(error.toString()));

    });


  }



}