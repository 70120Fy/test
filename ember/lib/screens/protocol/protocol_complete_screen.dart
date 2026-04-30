import 'package:flutter/material.dart';

import '../../widgets/animated/confetti_overlay.dart';

class ProtocolCompleteScreen extends StatelessWidget {
  const ProtocolCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFD4A853).withOpacity(0.2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_circle,
                      size: 80,
                      color: Color(0xFFD4A853),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Day 1 Complete',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  '🔥 12 day streak',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 48),
                GoldenButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Continue to Day 2'),
                ),
              ],
            ),
          ),
          ConfettiOverlay(),
        ],
      ),
    );
  }
}

class GoldenButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double height;

  const GoldenButton({
    super.key,
    this.onPressed,
    required this.child,
    this.padding,
    this.width,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [Color(0xFFD4A853), Color(0xFF8B3A1A)],
          center: Alignment.topLeft,
          radius: 1.0,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD4A853).withOpacity(0.3),
            offset: const Offset(0, 4),
            blur: 16,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Color(0xFF1A1612),
            fontWeight: FontWeight.w600,
          ),
          child: child,
        ),
      ),
    );
  }
}
