import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:themedata/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {

  final box = GetStorage();

  ThemeData _themeData = lightTheme;

  ThemeProvider() {
    bool isDark = box.read('darkmode') ?? false;
    _themeData = isDark ? darkTheme : lightTheme;
  }

  ThemeData get themeData => _themeData;

  set setThemeData(ThemeData themeData) {
    _themeData = themeData;
    saveTheme();
  }

  void toggleTheme() {
    _themeData = _themeData == lightTheme ? darkTheme : lightTheme;
    saveTheme();
  }
  
  void saveTheme() async {
    await box.write('darkmode', _themeData == darkTheme ? true : false);
    notifyListeners();
  }
}