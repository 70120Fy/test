import 'package:flutter/material.dart';

class AppShadows {
  static final card = BoxShadow(
    color: const Color(0x1A000000),
    offset: const Offset(0, 2),
    blur: 8,
  );

  static final cardHover = BoxShadow(
    color: const Color(0x2A000000),
    offset: const Offset(0, 4),
    blur: 16,
  );

  static final goldGlow = BoxShadow(
    color: const Color(0x33D4A853),
    offset: const Offset(0, 0),
    blur: 20,
  );

  static final goldGlowStrong = BoxShadow(
    color: const Color(0x55D4A853),
    offset: const Offset(0, 0),
    blur: 30,
  );
}
