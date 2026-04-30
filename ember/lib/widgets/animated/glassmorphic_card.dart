import 'package:flutter/material.dart';

class GlassmorphicCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double borderRadius;
  final double? blur;
  final BoxShadow? shadow;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const GlassmorphicCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.color,
    this.borderRadius = 16,
    this.blur = 20,
    this.shadow,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = color ?? Theme.of(context).cardColor;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: bgColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
            width: 1,
          ),
          boxShadow: [
            if (shadow != null) shadow!,
            BoxShadow(
              color: const Color(0x1A000000),
              offset: const Offset(0, 2),
              blur: 8,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur ?? 20,
              sigmaY: blur ?? 20,
            ),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class GoldGlowCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const GoldGlowCard({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      color: Theme.of(context).cardColor,
      borderRadius: 24,
      padding: padding ?? const EdgeInsets.all(20),
      shadow: BoxShadow(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        blurRadius: 24,
        spreadRadius: 2,
      ),
      child: child,
    );
  }
}
