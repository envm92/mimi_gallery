import 'package:flutter/material.dart';

final ThemeData galleryTheme = _buildTheme();
ThemeData _buildTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pinkAccent.shade200,
      secondary: Colors.yellow.shade200
    ),
  );
}