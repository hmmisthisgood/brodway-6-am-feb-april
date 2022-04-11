import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;

  String error = "";
  bool hasLoginError = false;
  int count = 0;

  updateCount() {
    count++;
    notifyListeners();
  }

  googleSignIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 4), () {});

    ///
    ///
    ///

    isLoading = false;
    notifyListeners();
  }
}
