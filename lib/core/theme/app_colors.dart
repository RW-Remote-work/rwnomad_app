import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Grey / Primary scale (from Chakra UI)
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey900 = Color(0xFF000000);
  static const Color grey800 = Color(0xFF1A1A1A);
  static const Color grey700 = Color(0xFF333333);
  static const Color grey600 = Color(0xFF4D4D4D);
  static const Color grey500 = Color(0xFF666666);
  static const Color grey400 = Color(0xFF808080);
  static const Color grey300 = Color(0xFF999999);
  static const Color grey200 = Color(0xFFB2B2B2);
  static const Color grey100 = Color(0xFFCCCCCC);
  static const Color grey50 = Color(0xFFE5E5E5);
  static const Color grey10 = Color(0xFFF2F2F2);

  // Purple (accent)
  static const Color purple500 = Color(0xFFA2AEF6);
  static const Color purple50 = Color(0xFFEFF1FD);

  // Beige (background)
  static const Color beige500 = Color(0xFFF4F1EC);
  static const Color beige50 = Color(0xFFFDFDFC);

  // Green
  static const Color green500 = Color(0xFFB8EED2);

  // Orange
  static const Color orange500 = Color(0xFFFCC1AC);

  // Blue (links / CTA)
  static const Color blue100 = Color(0xFF4E47DB);
  static const Color blue200 = Color(0xFF716DF7);

  // Semantic
  static const Color background = beige50;
  static const Color surface = white;
  static const Color textPrimary = grey800;
  static const Color textSecondary = grey400;
  static const Color textMuted = grey200;
  static const Color error = Colors.red;
  static const Color favorite = Colors.redAccent;
}
