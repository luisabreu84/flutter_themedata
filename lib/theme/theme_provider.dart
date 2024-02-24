import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:themedata/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {

  final box = GetStorage();

  ThemeData _themeData = lightTheme;
  bool _useSystemAppearance = true;
  bool _useDarkMode = false;

  ThemeProvider() {
    
    _useSystemAppearance = box.read('useSystemAppearance') ?? true;
    _useDarkMode = box.read('darkmode') ?? false;

    if (_useSystemAppearance) {
      var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      _themeData = brightness == Brightness.dark ? darkTheme : lightTheme;
    } else {
      _themeData = _useDarkMode ? darkTheme : lightTheme;
    }

  }

  bool get isUsingSystemAppearance => _useSystemAppearance;
  bool get isUsingDarkMode => _useDarkMode;

  ThemeData get themeData => _themeData;

  set setThemeData(ThemeData themeData) {
    _themeData = themeData;
    saveTheme();
  }

  void toggleTheme() {
    _themeData = _themeData == lightTheme ? darkTheme : lightTheme;
    saveTheme();
  }

  void setUseOfSystemAppearance(bool value) {
    _useSystemAppearance = value;
    box.write('useSystemAppearance', value);
    
    if (_useSystemAppearance) {
      var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      _themeData = brightness == Brightness.dark ? darkTheme : lightTheme;
    }
    else {
      _useDarkMode = box.read('darkmode') ?? false;
      _themeData = _useDarkMode ? darkTheme : lightTheme;
    }

    notifyListeners();
  }

  void toggleThemeBySystem() {
    _useSystemAppearance = box.read('useSystemAppearance') ?? true;
    if (_useSystemAppearance) {
      var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      _themeData = brightness == Brightness.dark ? darkTheme : lightTheme;

      notifyListeners();  
    }
  }
  
  void saveTheme() async {
    var darkMode = _themeData == darkTheme ? true : false;

    await box.write('darkmode', darkMode);
    _useDarkMode = darkMode;

    notifyListeners();
  }
}