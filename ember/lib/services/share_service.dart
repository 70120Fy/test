import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';

class ShareService {
  Future<void> shareProtocolComplete({
    required String programTitle,
    required int streakDays,
  }) async {
    final text = 'Day 3 of the $programTitle ✓\n🔥 $streakDays day streak\n#EmberApp #DisciplineDiagnostic';

    await Share.share(text);
  }

  Future<Uint8List?> generateShareImage({
    required String programTitle,
    required int streakDays,
  }) async {
    try {
      final image = img.Image(width: 600, height: 400);

      // Background
      final bg = img.ColorRgb8(17, 15, 13);
      img.fill(image, bg);

      // Golden frame
      final gold = img.ColorRgb8(212, 168, 83);
      img.fillRect(image, 10, 10, 580, 380, gold);
      img.fillRect(image, 15, 15, 570, 370, bg);

      // Flame icon
      img.drawString(
        image,
        img.fonts.lookupFont('Nunito', style: img.FontStyle.bold),
        '🔥',
        x: 300,
        y: 100,
        color: gold,
        size: 64,
        align: img.TextAlign.center,
      );

      // Text
      img.drawString(
        image,
        img.fonts.lookupFont('Nunito', style: img.FontStyle.bold),
        'Protocol Complete!',
        x: 300,
        y: 180,
        color: gold,
        size: 36,
        align: img.TextAlign.center,
      );

      img.drawString(
        image,
        img.fonts.lookupFont('Nunito', style: img.FontStyle.bold),
        programTitle,
        x: 300,
        y: 230,
        color: AppColors.gold300.value,
        size: 24,
        align: img.TextAlign.center,
      );

      img.drawString(
        image,
        img.fonts.lookupFont('Nunito', style: img.FontStyle.bold),
        '$streakDays day streak',
        x: 300,
        y: 270,
        color: gold,
        size: 24,
        align: img.TextAlign.center,
      );

      img.drawString(
        image,
        img.fonts.lookupFont('Nunito', style: img.FontStyle.normal),
        '#EmberApp #DisciplineDiagnostic',
        x: 300,
        y: 340,
        color: AppColors.gold600.value,
        size: 14,
        align: img.TextAlign.center,
      );

      final pngBytes = img.encodePng(image);
      return pngBytes;
    } catch (e) {
      return null;
    }
  }
}

class AppColors {
  static const int gold300 = 0xFFE8C87A;
  static const int gold600 = 0xFF9A7124;
  static const int gold400 = 0xFFD4A853;
}
