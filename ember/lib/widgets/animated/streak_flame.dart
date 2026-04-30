import 'package:flutter/material.dart';

class StreakFlame extends StatelessWidget {
  final int streakDays;
  final bool isActive;

  const StreakFlame({
    super.key,
    required this.streakDays,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    final size = _getSizeForStreak(streakDays);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer glow
          if (isActive)
            Container(
              width: size * 1.5,
              height: size * 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary
                        .withOpacity(0.3),
                    blurRadius: size * 0.5,
                  ),
                ],
              ),
            ),
          // Flame icon
          Text(
            '🔥',
            style: TextStyle(
              fontSize: size,
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.5),
              shadows: isActive
                  ? [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        blurRadius: size * 0.2,
                        spreadRadius: size * 0.1,
                      ),
                    ]
                  : null,
            ),
          ),
          // Inner flame
          if (streakDays >= 10)
            Positioned(
              top: size * 0.1,
              child: Text(
                '$streakDays',
                style: TextStyle(
                  fontSize: size * 0.4,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1612),
                  shadows: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  double _getSizeForStreak(int streakDays) {
    if (streakDays >= 30) return 80;
    if (streakDays >= 10) return 60;
    return 40;
  }
}

class AnimatedFlame extends StatefulWidget {
  final int streakDays;
  final bool animate;

  const AnimatedFlame({
    super.key,
    required this.streakDays,
    this.animate = true,
  });

  @override
  State<AnimatedFlame> createState() => _AnimatedFlameState();
}

class _AnimatedFlameState extends State<AnimatedFlame>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _flameHeight = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _controller.addListener(() {
      setState(() {
        _flameHeight = 1.0 + _controller.value * 0.1;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: widget.animate ? _flameHeight : 1.0,
            child: child,
          );
        },
      ),
      child: StreakFlame(streakDays: widget.streakDays),
    );
  }
}
