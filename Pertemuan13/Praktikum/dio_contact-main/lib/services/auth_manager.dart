import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static const String loginStatusKey = 'loginStatusKey';
  static const String loginTimeKey = 'loginTimeKey';
  static const String usernameKey = 'username';

  // Check if the user is logged in and if the login session is valid
  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLoggedIn = prefs.getBool(loginStatusKey) ?? false;
    String? loginTimeString = prefs.getString(loginTimeKey);

    if (isLoggedIn && loginTimeString != null) {
      try {
        DateTime loginTime = DateTime.parse(loginTimeString);
        final Duration timeDifference = DateTime.now().difference(loginTime);

        // Set maximum duration for valid login session
        const Duration maxDuration = Duration(hours: 4);

        if (timeDifference > maxDuration) {
          await logout();
          return false;
        }
        return true;
      } catch (e) {
        debugPrint('Error parsing DateTime: $e');
        await logout();
        return false;
      }
    }

    return false;
  }

  // Log in the user and store the login time and status
  static Future<void> login(String username, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(loginStatusKey, true);
    prefs.setString(loginTimeKey, DateTime.now().toString());
    prefs.setString(usernameKey, username);
    prefs.setString('token', token);
  }

  // Log out the user and remove all related data
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(loginStatusKey);
    prefs.remove(loginTimeKey);
    prefs.remove(usernameKey);
    prefs.remove('token');
  }
}