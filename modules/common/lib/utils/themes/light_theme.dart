import 'package:common/utils/themes/text_themes.dart';
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
        textTheme: textThemes(),
      );
}
