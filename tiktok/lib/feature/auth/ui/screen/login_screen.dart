import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tiktok/common/utils/shared_pref.dart';
import 'package:tiktok/feature/auth/cubit/auth_cubit.dart';
import 'package:tiktok/feature/auth/cubit/auth_state.dart';
import 'package:tiktok/feature/auth/ui/screen/signup_screen.dart';
import 'package:tiktok/feature/feed/ui/screen/home_screen_with_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SharedPref.clearAllData();
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            isLoading = true;
          }

          if (state is AuthErrorState) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
            );
            isLoading = false;
          }
          if (state is AuthSuccessState) {
            Fluttertoast.showToast(
              msg: "Log in Sucessful. Welcome!!",
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
            );
            isLoading = false;

            ///  dont use normal push
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (_) => HomeScreenWithCubit()));

            /// can use push replacement or push and remove until
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (_) => HomeScreenWithCubit()));

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomeScreenWithCubit()),
              (route) => false,
            );
          }

          setState(() {});
        },
        child: Stack(
          children: [
            Form(
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
                          validator:
                              EmailValidator(errorText: "Email must be valid"),
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
                            RequiredValidator(
                                errorText: 'password is required'),
                            MinLengthValidator(5,
                                errorText:
                                    'password must be at least 5 digits long'),
                          ]),
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Text("Forgot Password"),
                    IgnorePointer(
                      ignoring: isLoading,
                      child: MaterialButton(
                        height: 50,
                        color: Colors.pink,
                        minWidth: double.infinity,
                        onPressed: () {
                          final formstate = formKey.currentState;
                          if (formstate == null) {
                            return;
                          }

                          bool isValid = formstate.validate();

                          if (isValid) {
                            /// login function call
                            ///

                            BlocProvider.of<AuthCubit>(context).loginWithEmail(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Login",
                                style: TextStyle(color: Colors.white)),
                            // if (isLoading)
                            //   Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 8.0, vertical: 4),
                            //     child: Container(
                            //       height: 30,
                            //       child: CircularProgressIndicator(
                            //         strokeWidth: 0.9,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Text(
                          "Not registered yet? Sign Up",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      color: Colors.pink,
                      minWidth: double.infinity,
                      onPressed: () {
                        ///1
                        BlocProvider.of<AuthCubit>(context).loginWithGoogle();

                        /// 2
                        // context.read<AuthCubit>().loginWithGoogle();
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
            if (isLoading)
              Container(
                color: Colors.grey.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }
}