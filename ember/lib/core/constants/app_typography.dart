import 'package:flutter/material.dart';

class AppTypography {
  // Font families
  static const String displayHero = 'Playfair Display';
  static const String headingXL = 'Playfair Display';
  static const String headingLG = 'Playfair Display';
  static const String headingMD = 'Cormorant Garamond';
  static const String bodyLG = 'Nunito';
  static const String bodyMD = 'Nunito';
  static const String bodySM = 'Nunito';
  static const String caption = 'Nunito';
  static const String label = 'Nunito';
  static const String labelBold = 'Nunito';
  static const String numberXL = 'Nunito';
  static const String numberLG = 'Nunito';
  static const String numberMD = 'Nunito';
  static const String quote = 'Cormorant Garamond';
  static const String sourceRef = 'Nunito';

  // Display Hero
  static TextStyle get displayHeroStyle => const TextStyle(
        fontFamily: displayHero,
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.gold300,
        height: 1.2,
      );

  // Heading XL
  static TextStyle get headingXLStyle => const TextStyle(
        fontFamily: headingXL,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  // Heading LG
  static TextStyle get headingLGStyle => const TextStyle(
        fontFamily: headingLG,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  // Heading MD
  static TextStyle get headingMDStyle => const TextStyle(
        fontFamily: headingMD,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  // Body LG
  static TextStyle get bodyLGStyle => const TextStyle(
        fontFamily: bodyLG,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  // Body MD
  static TextStyle get bodyMDStyle => const TextStyle(
        fontFamily: bodyMD,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  // Body SM
  static TextStyle get bodySMStyle => const TextStyle(
        fontFamily: bodySM,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textTertiary,
        height: 1.5,
      );

  // Caption
  static TextStyle get captionStyle => const TextStyle(
        fontFamily: caption,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textTertiary,
        height: 1.5,
      );

  // Label
  static TextStyle get labelStyle => const TextStyle(
        fontFamily: label,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  // Label Bold
  static TextStyle get labelBoldStyle => const TextStyle(
        fontFamily: labelBold,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  // Number XL
  static TextStyle get numberXLStyle => const TextStyle(
        fontFamily: numberXL,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.0,
        fontFeatures: [FontFeature.tabularFigures()],
      );

  // Number LG
  static TextStyle get numberLGStyle => const TextStyle(
        fontFamily: numberLG,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.0,
        fontFeatures: [FontFeature.tabularFigures()],
      );

  // Number MD
  static TextStyle get numberMDStyle => const TextStyle(
        fontFamily: numberMD,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.0,
        fontFeatures: [FontFeature.tabularFigures()],
      );

  // Quote
  static TextStyle get quoteStyle => const TextStyle(
        fontFamily: quote,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  // Source Ref
  static TextStyle get sourceRefStyle => const TextStyle(
        fontFamily: sourceRef,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.gold600,
        height: 1.5,
      );
}
