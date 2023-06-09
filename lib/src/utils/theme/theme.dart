import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Quatr/src/utils/theme/widgets_themes/text_theme.dart';

class BAppTheme {
  BAppTheme._();

  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.green,

      brightness: Brightness.light,
      textTheme: BTextTheme.lightTextTheme,
      appBarTheme: AppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom())
      // primarySwatch:  const MaterialColor(0xFF006E33, <int, Color>{
      //   50: Color(0x1A006E33),
      //   100: Color(0x33006E33),
      //   200: Color(0x4D006E33),
      //   300: Color(0x66006E33),
      //   400: Color(0x80006E33),
      //   500: Color(0xFF006E33),
      //   600: Color(0x99006E33),
      //   700: Color(0xB3006E33),
      //   800: Color(0xCC006E33),
      //   900: Color(0xE6006E33),
      // })

      );
  static ThemeData darkTheme =
      ThemeData(
          primarySwatch:Colors.green,
         // brightness: Brightness.dark,
          textTheme: BTextTheme.darkTextTheme,
          appBarTheme: AppBarTheme(),
          floatingActionButtonTheme: FloatingActionButtonThemeData(),
          elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
          //   primarySwatch: const MaterialColor(0xFF006E33, <int, Color>{
          // 50: Color(0x1A006E33),
          // 100: Color(0x33006E33),
          // 200: Color(0x4D006E33),
          // 300: Color(0x66006E33),
          // 400: Color(0x80006E33),
          // 500: Color(0xFF006E33),
          // 600: Color(0x99006E33),
          // 700: Color(0xB3006E33),
          // 800: Color(0xCC006E33),
          // 900: Color(0xE6006E33),
          // })
          );

  static ThemeData onBoardTheme =
      ThemeData(
        primarySwatch: Colors.green,
          brightness: Brightness.light,
          textTheme: BTextTheme.lightTextTheme,
          appBarTheme: AppBarTheme(),
          floatingActionButtonTheme: FloatingActionButtonThemeData(),
          elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom())
      );



}
