// app first time open

// user logged in or not = bool:  setBool, getBool

// user data = string .

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// id, email, fullname, token, address,age , photo

class SharedPref {
  static const _IsUserLoggedIN = "is_user_logged_in_the_app";

  static setHasUserLoggedIn(bool loggedInValue) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setBool(_IsUserLoggedIN, loggedInValue);
  }

  static Future<bool> hasUserLoggedIn() async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    final isLoggedIn = instance.getBool(_IsUserLoggedIN) ?? false;

    return isLoggedIn;
  }

  static setUserData() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setString("user_data", "");
  }

  static getUserData() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getString("user_data");
  }

  static clearAllData() async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    await instance.clear();
  }
}
