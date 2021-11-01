import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/models/social_app/social_user_model.dart';
import 'package:kassem_app/modules/social_app/social_signup/cubit/states.dart';

class SocialSignupCubit extends Cubit<SocialSignupState> {
  SocialSignupCubit() : super(SocialSignupInitialState());

  static SocialSignupCubit get(context) => BlocProvider.of(context);

  void userSignup({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
  }) {
    emit(SocialSignupLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
        uId: value.user.uid,
        name: name,
        email: email,
        phone: phone,
      );

      print(value.user.email);
      print(value.user.uid);
    }).catchError((error) {
      emit(SocialSignupErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String uId,
    @required String name,
    @required String email,
    @required String phone,
  }) {
    SocialUserModel model = SocialUserModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
      bio:  'write your bio...',

      image:
          'https://www.irishrsa.ie/wp-content/uploads/2017/03/default-avatar-300x300.png',
      cover:
      'https://fanpage.tv/media/cover/2096/thumb/',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
  }
}
