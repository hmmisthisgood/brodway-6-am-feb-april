import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tiktok/feature/auth/ui/widget/auth_textfield.dart';

import '../../cubit/auth_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
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
              AuthTextField(
                controller: fullnameController,
                hintText: "Enter your fullname",
                validator: EmailValidator(errorText: "Email must be valid"),
              ),
              SizedBox(height: 10),
              AuthTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter your email",
                validator: EmailValidator(errorText: "Email must be valid"),
              ),
              SizedBox(height: 10),
              AuthTextField(
                controller: passwordController,
                hintText: "Enter your password",
                obscureText: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'password is required'),
                  MinLengthValidator(5,
                      errorText: 'password must be at least 5 digits long'),
                ]),
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
