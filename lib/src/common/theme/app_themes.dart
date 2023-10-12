import 'package:flutter/material.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';

enum AppTheme {
  // ignore: constant_identifier_names
  Light,
  // ignore: constant_identifier_names
  Dark,
}

class AppThemeData {
  AppThemeData._();

  static final appThemeData = {
    AppTheme.Light: _lightThemeData,
    AppTheme.Dark: _darkThemeData,
  };

  static final ThemeData _base = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 1.0,
      backgroundColor: AppColors.primaryBlue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: Colors.blueGrey,
      backgroundColor: Colors.red,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static ThemeData get _lightThemeData {
    final baseLight = ThemeData.light();
    return baseLight.copyWith(
      scaffoldBackgroundColor: AppColors.platinum,
      canvasColor: Colors.white,
      primaryColor: AppColors.primaryBlue,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      appBarTheme: _base.appBarTheme.copyWith(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: _base.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.white,
      ),
    );
  }

  static ThemeData get _darkThemeData {
    final baseDark = ThemeData.dark();
    return baseDark.copyWith(
      primaryColor: AppColors.blueForDarkMode,
      secondaryHeaderColor: AppColors.primaryBlue,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      scaffoldBackgroundColor: const Color(0xFF1E1F20),
      cardColor: const Color(0xff2E2F33),
      appBarTheme: _base.appBarTheme.copyWith(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: _base.bottomNavigationBarTheme.copyWith(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        unselectedItemColor: Colors.white,
      ),
    );
  }

  static ThemeData fromEnum(AppTheme theme) =>
      appThemeData[theme] ?? _lightThemeData;

  static ThemeData byIndex(int index) => appThemeData.values.toList()[index];
}
