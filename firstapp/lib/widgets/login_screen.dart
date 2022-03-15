import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _hidePassword = true;

  String? email;

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///1. TextField = no validation
                ///2. TextFormField= has validation

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  // autofocus: true,

                  /// important functions
                  onChanged: (val) {
                    print(val);
                  },
                  onFieldSubmitted: (submitedVal) {
                    print(submitedVal);
                  },

                  focusNode: emailFocusNode,
                  style: TextStyle(color: Colors.purple, fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "a@b.com",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // enabledBorder: InputBorder(),
                    // disabledBorder: InputBorder(),
                  ),

                  validator: (currentVal) {
                    ///
                    ///
                    if (currentVal == null) {
                      return "Email cannot be null";
                    }

                    if (currentVal.isEmpty) {
                      return "Email cannot be empty";
                    }

                    if (!currentVal.contains("@")) {
                      return "Enter a valid email";
                    }

                    /// success case
                    return null;
                  },
                ),

                SizedBox(height: 15),
                TextFormField(
                  // autofocus: true,
                  controller: _passwordController,
                  obscureText: _hidePassword,
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        _hidePassword = !_hidePassword;
                        print(_hidePassword);
                        setState(() {});
                      },
                      child: Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(),
                  onPressed: () {
                    final formState = _formKey.currentState;
                    // _emailController.clear();

                    if (formState != null) {
                      formState.save();
                      // final email = _emailController.text;
                      // final _password = _passwordController.text;

                      bool _isValidated = formState.validate();

                      ///
                      FocusScope.of(context).unfocus();
                    }
                  },
                  child: Text("Sign In"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
