import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingRepositoryImpl {
  OnBoardingRepositoryImpl(this.preferences);

  final SharedPreferences preferences;

  Future<String?> getInfo() async {
    try {
      final token = preferences.getString('token');
      if (token != null) {
        return token;
      } else {
        initApp();
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> initApp() async {
    const token = '123qwe';

    try {
      await preferences.setString('token', token);
      log('Token insertado');
    } catch (e) {
      log(e.toString());
    }
  }
}
