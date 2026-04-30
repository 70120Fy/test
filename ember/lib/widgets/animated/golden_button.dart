import 'package:flutter/material.dart';

class GoldenButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double height;
  final Color? color;

  const GoldenButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    required this.child,
    this.isLoading = false,
    this.padding,
    this.width,
    this.height = 56,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      onLongPress: isLoading ? null : onLongPress,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              color ?? Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ],
            center: Alignment.topLeft,
            radius: 1.0,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: (color ?? Theme.of(context).colorScheme.primary)
                  .withOpacity(0.3),
              offset: const Offset(0, 4),
              blur: 16,
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                    strokeWidth: 3,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}

class GoldGradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double height;

  const GoldGradientButton({
    super.key,
    this.onPressed,
    required this.child,
    this.padding,
    this.width,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return GoldenButton(
      onPressed: onPressed,
      child: child,
      padding: padding,
      width: width,
      height: height,
      color: const Color(0xFFD4A853),
    );
  }
}
