import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BTextTheme {

  static TextTheme lightTextTheme = TextTheme(
        displayMedium: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 24,

        ),
        titleSmall:  GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
        ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 24 ,
    ),
    titleSmall:  GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 16,
    ),

  );

}