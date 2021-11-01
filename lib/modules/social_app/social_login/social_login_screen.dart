import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kassem_app/layout/social_app/social_layout.dart';
import 'package:kassem_app/modules/social_app/social_signup/social_signup_screen.dart';
import 'package:kassem_app/shared/components/components.dart';
import 'package:kassem_app/shared/network/remote/cache_helper.dart';
import 'package:kassem_app/shared/styles/icons_broken.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialLogin extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginState>(
        listener: (context, state) {},
        builder: (context, state) {

          if(state is SocialLoginSuccessState)
            {
              CacheHelper.saveData(
                  key: 'uId',
                  value:state.uId
              ).then((value) {
                navigateAndFinish(context, SocialLayout());
              });
            }
          if (state is SocialLoginErrorState) {
            showToast(text: state.error);
          }
          return Scaffold(

            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'Login now to communicate with your friends',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultTextFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            prefix: IconBroken.Message,
                            lapelText: 'E-mail Address',
                            validate: (String value) {
                              if (value.isEmpty) {
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
                            isPassword:
                                SocialLoginCubit.get(context).isPassword,
                            suffixPressed: () {
                              SocialLoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            onSubmitted: (value) {
                              if (formKey.currentState.validate()) {
                                // SocialLoginCubit.get(context).userLogin(
                                //   email: emailController.text,
                                //   password: passwordController.text,
                                //);
                              }
                            },
                            suffix: SocialLoginCubit.get(context).suffix,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter password ';
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => defaultButton(
                              background: Color(0xff0148a4),
                              function: () {
                                if (formKey.currentState.validate()) {
                                  SocialLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              isUpperCase: true,
                              radius: 10,
                              height: 50,
                              text: 'Login'),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Or login with',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Color(0xff385c8e),
                                      child: Image(
                                        image:
                                            AssetImage('assets/images/f.png'),
                                        height: 27,
                                        width: 27,
                                      ),
                                      radius: 25,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    CircleAvatar(
                                      radius: 25,
                                      child: Image(
                                        image:
                                            AssetImage('assets/images/g.png'),
                                        height: 25,
                                        width: 25,
                                      ),
                                      backgroundColor: Color(0xfff14436),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigateTo(context, SocialSignupScreen());
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
