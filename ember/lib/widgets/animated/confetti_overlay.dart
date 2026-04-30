import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ConfettiOverlay extends StatefulWidget {
  final VoidCallback? onComplete;
  final Duration duration;

  const ConfettiOverlay({
    super.key,
    this.onComplete,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay>
    with TickerProviderStateMixin {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      vsync: this,
      duration: widget.duration,
    );

    _controller.play();

    _controller.addListener(() {
      if (_controller.isFinished) {
        widget.onComplete?.call();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirectionality: BlastDirectionality.explosive,
            gravity: 0.5,
            particleDrag: 0.05,
            emissionFrequency: 0.05,
            numberOfParticles: 100,
            colors: const [
              Color(0xFFD4A853),
              Color(0xFFE8C87A),
              Color(0xFFB8892E),
              Color(0xFFFFF5DB),
            ],
          ),
        ),
      ],
    );
  }
}
