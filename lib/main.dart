import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/sura_screen_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ahadeth_screen.dart';
import 'home_screen.dart';
import 'my_theme_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

late  MyProvider provider;
  @override
  Widget build(BuildContext context) {
   provider=Provider.of<MyProvider>(context);
   getSharedPreferences();
    return  MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'),
      ],
      locale: Locale(provider.languageCode),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(BuildContext) => HomeScreen(),
        SuraScreenDetails.routeName:(BuildContext)=>SuraScreenDetails(),
        AhadethScreen.routeName:(BuildContext) =>AhadethScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appMode,
    );
  }
getSharedPreferences() async {
  SharedPreferences prefs= await SharedPreferences.getInstance();
  String lang = prefs.getString("lang")?? "en";
  String theme =prefs.getString("theme")??"light";
  provider.changeLanguage(lang);
  provider.changeTheme(theme=="light"?ThemeMode.light:ThemeMode.dark);
}
}

