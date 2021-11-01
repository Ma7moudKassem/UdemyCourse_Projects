import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/social_app/social_layout.dart';
import 'package:kassem_app/modules/social_app/social_login/social_login_screen.dart';
import 'package:kassem_app/shared/components/components.dart';
import 'package:kassem_app/shared/styles/icons_broken.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialSignupScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> SocialSignupCubit(),
      child: BlocConsumer<SocialSignupCubit, SocialSignupState>(
        listener: (context , state){

          if (state is SocialCreateUserSuccessState){

            navigateAndFinish(context, SocialLayout());
          }

        },
        builder: (context , state)
          {
            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('SIGN UP',
                          style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black,
                              fontWeight: FontWeight.w900),),
                        Text('Sign up now to communicate with your friends ',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),),
                        SizedBox(height: 30,),

                        defaultTextFormField(

                            controller: nameController,
                            type: TextInputType.text,
                            prefix: IconBroken.User,
                            lapelText: 'Name',
                            validate: (String value)
                            {
                              if(value.isEmpty){
                                return 'Please enter your name ';
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),


                        defaultTextFormField(

                            controller: emailController,
                            type: TextInputType.emailAddress,
                            prefix: IconBroken.Message,
                            lapelText: 'E-mail Address',
                            validate: (String value)
                            {
                              if(value.isEmpty){
                                return 'Please enter your email ';
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),


                        defaultTextFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            prefix: IconBroken.Lock,
                            lapelText: 'Password',
                            isPassword: SocialSignupCubit.get(context).isPassword,
                            suffixPressed: ()
                            {
                              SocialSignupCubit.get(context).changePasswordVisibility();
                            },
                            onSubmitted: (value)
                            {
                              if(formKey.currentState.validate())
                              {
                                // SocialLoginCubit.get(context).userLogin(
                                //   email: emailController.text,
                                //   password: passwordController.text,
                                //);
                              }
                            },
                            suffix:SocialSignupCubit.get(context).suffix,
                            validate: (String value){
                              if(value.isEmpty){
                                return 'Please enter password ';
                              }
                            }),
                        SizedBox(height: 15,),
                        defaultTextFormField(

                            controller: phoneController,
                            type: TextInputType.phone,
                            prefix: IconBroken.Call,
                            lapelText: 'Phone',
                            validate: (String value)
                            {
                              if(value.isEmpty){
                                return 'Please enter your phone number ';
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),


                        ConditionalBuilder(
                          condition:state is! SocialSignupLoadingState,
                          builder: (context)=> defaultButton(
                              background: Color(0xff0148a4),
                              function: ()
                              {
                                if(formKey.currentState.validate())
                                {
                                  SocialSignupCubit.get(context).userSignup(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              isUpperCase: true,
                              radius: 10,
                              height: 50,
                              text: 'Sign up'

                          ),
                          fallback:(context)=> Center(child: CircularProgressIndicator()) ,
                        ),
                        SizedBox(height: 25,),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Do You have an account?',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey
                                    ),),
                                  TextButton(
                                    onPressed: (){
                                      navigateTo(context, SocialLogin());
                                    },
                                    child: Text('Log in',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold

                                      ),),
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
