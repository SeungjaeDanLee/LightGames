import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightGamesTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFFEEFEA),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFF7D6E0),
    primary: const Color(0xFFF7D6E0),
    secondary: const Color(0xFFDDF3F5),
    background: const Color(0xFFFEEFEA),
    onPrimary: const Color(0xFF4B3F2F),
    onSecondary: const Color(0xFF4B3F2F),
    surface: Colors.white,
    onSurface: const Color(0xFF4B3F2F),
  ),
  textTheme: GoogleFonts.juaTextTheme().copyWith(
    titleLarge: GoogleFonts.jua(
      fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xFF4B3F2F)),
    bodyLarge: GoogleFonts.jua(
      fontSize: 18, color: const Color(0xFF4B3F2F)),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    shadowColor: const Color(0xFFDDF3F5),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: GoogleFonts.jua(
      fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF4B3F2F)),
    iconTheme: const IconThemeData(color: Color(0xFF4B3F2F)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFFD6A5),
      foregroundColor: const Color(0xFF4B3F2F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      textStyle: GoogleFonts.jua(fontSize: 20, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      elevation: 2,
      shadowColor: const Color(0xFFDDF3F5),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF4B3F2F),
      side: const BorderSide(color: Color(0xFFDDF3F5)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      textStyle: GoogleFonts.jua(fontSize: 20),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    ),
  ),
  useMaterial3: true,
); 