import 'package:flutter/material.dart';

class AppGradients {
  static const Gradient goldPrimary = LinearGradient(
    colors: [Color(0xFFD4A853), Color(0xFFE89B3E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient goldDeep = LinearGradient(
    colors: [Color(0xFFD4A853), Color(0xFF8B3A1A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient goldSubtle = LinearGradient(
    colors: [Color(0x33D4A853), Color(0x00000000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient bgRadial = RadialGradient(
    colors: [Color(0xFF1A1612), Color(0xFF110F0D)],
    center: Alignment.topCenter,
    radius: 1.0,
  );

  static const Gradient goldenParticles = LinearGradient(
    colors: [Color(0xFFE8C87A), Color(0xFFB8892E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient programCard = LinearGradient(
    colors: [Color(0xFF241F1A), Color(0xFF2E2822)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
