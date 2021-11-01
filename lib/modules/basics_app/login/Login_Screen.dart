import 'package:flutter/material.dart';
import 'package:kassem_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultTextFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      prefix: Icons.email,
                      lapelText: 'Email',
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Email must not be empty';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      prefix: Icons.lock,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      lapelText: 'Password',
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Password must not be empty';
                        }
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    radius: 10,
                      background: Colors.blue,
                      height: 40,
                      text: 'loGin',
                      function: () {
                        if (formKey.currentState.validate())
                        print(
                          emailController.text,
                        );
                        print(
                          passwordController.text,
                        );
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
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
  }
}
