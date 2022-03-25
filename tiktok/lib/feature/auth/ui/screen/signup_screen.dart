import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../cubit/auth_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign up")),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: EmailValidator(errorText: "Email must be valid"),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(5,
                          errorText: 'password must be at least 5 digits long'),
                    ]),
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Text("Forgot Password"),
              MaterialButton(
                onPressed: () {
                  final formstate = formKey.currentState;

                  if (formstate == null) {
                    return;
                  }

                  bool isValid = formstate.validate();

                  if (isValid) {
                    /// sign up function call
                    BlocProvider.of<AuthCubit>(context).signupWithEmail(
                        email: emailController.text,
                        password: passwordController.text);
                  }
                },
                child: Text("Sign Up"),
              ),
              MaterialButton(
                color: Colors.pink,
                minWidth: double.infinity,
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).loginWithGoogle();
                },
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.pink,
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).loginWithFacebook();
                },
                child: Text(
                  "Sign in with Facebook",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
