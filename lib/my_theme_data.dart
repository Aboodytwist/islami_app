import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyThemeData{
  static Color blackColor=Color(0xFF242424);
  static Color whiteColor=Color(0xFFFFFFFF);
  static Color primaryColor=Color(0xFFB7935F);
  static Color yellowColor=Color(0xFFFACC1D);
  static Color darkColor=Color(0xFF141A2E);

  static  ThemeData lightTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: whiteColor,
        onPrimary: blackColor,
        secondary: primaryColor,
        onSecondary: whiteColor,
        surface: whiteColor,
        onSurface: primaryColor,
        error:Colors.red ,
        onError:Colors.red ),
      bottomNavigationBarTheme:BottomNavigationBarThemeData(
        type:BottomNavigationBarType.shifting,
        selectedItemColor:blackColor,
        unselectedItemColor: whiteColor,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          bodySmall:GoogleFonts.elMessiri(
            color:blackColor,
            fontSize: 20,

          ),
          bodyMedium: GoogleFonts.elMessiri(
            color: blackColor,
            fontSize: 25,

          ),
          bodyLarge: GoogleFonts.elMessiri(
              color: blackColor,
              fontSize: 30,
              fontWeight: FontWeight.bold
          )
      ),

      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent

      )
  );
  static  ThemeData darkTheme=ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: darkColor,
          onPrimary: yellowColor,
          secondary: darkColor,
          onSecondary: whiteColor,
          surface: whiteColor,
          onSurface: yellowColor,
          error:Colors.red ,
          onError:Colors.red
      ),
      bottomNavigationBarTheme:BottomNavigationBarThemeData(
        type:BottomNavigationBarType.shifting,
        selectedItemColor:yellowColor,
        unselectedItemColor: whiteColor,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          bodySmall:GoogleFonts.elMessiri(
            color:whiteColor,
            fontSize: 20,

          ),
          bodyMedium: GoogleFonts.elMessiri(
            color: yellowColor,
            fontSize: 25,

          ),
          bodyLarge: GoogleFonts.elMessiri(
              color: whiteColor,
              fontSize: 30,
              fontWeight: FontWeight.bold
          )
      ),

      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent

      )
  );


}