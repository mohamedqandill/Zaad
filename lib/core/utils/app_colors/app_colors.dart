import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF6A1B9A);
  static const Color secondary = Color(0xFF4A148C);
  static const Color card1BorderStart = Color(0xFF4FC3F7);
  static const Color card1BorderEnd = Color(0xFF9575CD);
  static const Color card2Start = Color(0xFFBA68C8);
  static const Color card2End = Color(0xFF7B1FA2);
  static const Color buttonStart = Color(0xFFCE93D8);
  static const Color buttonEnd = Color(0xFF6A1B9A);

  static const LinearGradient textGradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFFC54EEC)],
  );
  static const LinearGradient cardGradient = LinearGradient(
    stops: [0.0, 0.97],
    colors: [
      Color(0xFFFAF5FF),
      Color(0xFFAE91CE),
    ],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6A1B9A), Color(0xFF4A148C)],
  );

  static const LinearGradient card2Gradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [card2Start, card2End],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [buttonStart, buttonEnd],
  );

  static const Color chatBg = Color(0xFFF3E5F5);
}
