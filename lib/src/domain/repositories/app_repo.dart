import 'package:flutter/material.dart';
import 'package:inventory_tesis/src/common/theme/app_themes.dart';
import 'package:inventory_tesis/src/core/config/language.dart';

abstract class AppRepository {
  ThemeData get currentTheme;

  void setThemeData(AppTheme theme);

  Language get currentLanguage;

  void setLanguage(Language language);
}
