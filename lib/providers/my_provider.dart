import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyProvider extends ChangeNotifier{
  String languageCode="en";
  ThemeMode  appMode= ThemeMode.light;
late  SharedPreferences prefs;
  changeLanguage(String langCode) async {
    languageCode=langCode;
    notifyListeners();
    prefs= await SharedPreferences.getInstance();
    prefs.setString("lang", langCode);
    notifyListeners();
  }
  String changeBackGround(){
    if(appMode==ThemeMode.light) {
      return "assets/images/background.png";
    }
    else
      return "assets/images/darkback.png";
  }
  changeTheme(ThemeMode mode) async {
    appMode=mode;
    prefs=await SharedPreferences.getInstance();
    prefs.setString("theme", mode==ThemeMode.light?"light":"dark");
notifyListeners();
  }
}
