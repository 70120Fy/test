import 'package:flutter/material.dart';

class GoldenParticlesBackground extends StatefulWidget {
  final int particleCount;
  final bool paused;

  const GoldenParticlesBackground({
    super.key,
    this.particleCount = 30,
    this.paused = false,
  });

  @override
  State<GoldenParticlesBackground> createState() =>
      _GoldenParticlesBackgroundState();
}

class _GoldenParticlesBackgroundState
    extends State<GoldenParticlesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Particle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _particles = List.generate(
      widget.particleCount,
      (index) => Particle.create(index),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _GoldenParticlesPainter(
            particles: _particles,
            time: _controller.value,
            paused: widget.paused,
          ),
        );
      },
    );
  }
}

class Particle {
  final double x;
  final double y;
  final double speed;
  final double opacity;
  final double size;

  Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.opacity,
    required this.size,
  });

  static Particle create(int index) {
    return Particle(
      x: (index * 17) % 100,
      y: (index * 23) % 100,
      speed: 0.2 + (index % 5) * 0.1,
      opacity: 0.05 + (index % 4) * 0.05,
      size: 1.5 + (index % 4) * 0.5,
    );
  }

  Particle update(double width, double height, double time) {
    final newY = y - speed * 20 * time;
    final newX = x + (time * 10).sin() * 0.5;
    return Particle(
      x: newX % 100,
      y: newY < 0 ? 100 : newY % 100,
      speed: speed,
      opacity: opacity,
      size: size,
    );
  }
}

class _GoldenParticlesPainter extends CustomPainter {
  final List<Particle> particles;
  final double time;
  final bool paused;

  _GoldenParticlesPainter({
    required this.particles,
    required this.time,
    required this.paused,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final particle in particles) {
      final updated = paused
          ? particle
          : particle.update(size.width, size.height, time);

      final px = (updated.x / 100) * size.width;
      final py = (updated.y / 100) * size.height;

      paint.color = Color(0xD4A853)
          .withOpacity((updated.opacity * 0.8) + (time.sin() * 0.2));

      canvas.drawCircle(
        Offset(px, py),
        (updated.size / 4) * (size.width / 400),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension _DoubleExt on double {
  double sin() => _sin(this);
  double _sin(double x) {
    // Simple approximation
    final n = ((x / 3.14159) * 1000).round();
    return ((n % 2 == 0 ? 1 : -1) *
            ((x % 3.14159) - (x % 3.14159) * (x % 3.14159) / 6))
        .abs();
  }
}
