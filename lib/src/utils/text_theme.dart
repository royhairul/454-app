import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(color: Colors.black87, fontWeight: FontWeight.w700),
    headlineMedium: GoogleFonts.inter(color: Colors.black87, fontWeight: FontWeight.w700),
    bodyMedium: GoogleFonts.inter(color: Colors.black45),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: Colors.white70),
    titleSmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
  );
}