import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/colors.dart';

class style_mode {

  static ThemeData LightTheme = ThemeData(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,


    textSelectionTheme: TextSelectionThemeData(
      cursorColor: app_Colors_Light.MainColor,
      selectionColor: app_Colors_Light.MainColor,
      selectionHandleColor: app_Colors_Light.MainColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      outline: app_Colors_Light.Strok_color,
      seedColor: app_Colors_Light.BG_color,
      primary: app_Colors_Light.BG_color,
      brightness: Brightness.light


    ),


      bottomAppBarTheme: BottomAppBarTheme(
          shape: CircularNotchedRectangle(),
          color: app_Colors_Light.BG_color,
          surfaceTintColor: app_Colors_Light.BG_color
      ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.black),
    ),
    scaffoldBackgroundColor: app_Colors_Light.BG_color,
    cardColor: app_Colors_Light.BG_Card_color,
    textTheme: TextTheme(

      bodyLarge: GoogleFonts.alexandria(
          fontSize: 16,fontWeight: FontWeight.w600,color: app_Colors_Light.Main_Text_Dark
      ),
      bodyMedium: GoogleFonts.alexandria(
          fontSize: 14,fontWeight: FontWeight.w500,color: app_Colors_Light.Main_Text_Dark,
      ),
      bodySmall: GoogleFonts.alexandria(
          fontSize: 12,fontWeight: FontWeight.w400,color: app_Colors_Light.Second_Text_Light
      ),

    ),
    dividerColor: app_Colors_Light.Strok_color


  );

















  static ThemeData DarkTheme =  ThemeData(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: app_Colors_Light.MainColor,
      selectionColor: app_Colors_Light.MainColor,
      selectionHandleColor: app_Colors_Light.MainColor,
    ),

    colorScheme: ColorScheme.fromSeed(
        outline: app_Colors_Dark.Strok_color,
        seedColor: app_Colors_Dark.BG_color,
      primary: app_Colors_Dark.BG_color,
      brightness: Brightness.dark
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
      color: app_Colors_Dark.BG_color,
      surfaceTintColor: app_Colors_Dark.BG_color
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: app_Colors_Light.MainColor),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.black)
    ),
    scaffoldBackgroundColor: app_Colors_Dark.BG_color,
    cardColor: app_Colors_Dark.BG_Card_color,
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.alexandria(
          fontSize: 16,fontWeight: FontWeight.w600,color: app_Colors_Dark.main_Text_Dark
      ),

    bodyMedium: GoogleFonts.alexandria(
       fontSize: 14,fontWeight: FontWeight.w500,color: app_Colors_Dark.main_Text_Dark,
    ),
      bodySmall: GoogleFonts.alexandria(
          fontSize: 12,fontWeight: FontWeight.w600,color: app_Colors_Dark.main_Text_Light
      ),

    ),
    dividerColor: app_Colors_Light.Strok_color,
    dividerTheme: DividerThemeData(color: app_Colors_Light.Strok_color,),



  );













}