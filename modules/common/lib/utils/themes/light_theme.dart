import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static ThemeData theme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F487E),
          primary: const Color(0xFF1F487E),
          secondary: const Color(0xFF232e21),
          error: const Color(0xFFE71D36),
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
