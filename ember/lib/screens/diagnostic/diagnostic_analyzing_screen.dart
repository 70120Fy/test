import 'package:flutter/material.dart';

import '../../widgets/common/loading_indicator.dart';

class AnalyzingScreen extends StatefulWidget {
  const AnalyzingScreen({super.key});

  @override
  State<AnalyzingScreen> createState() => _AnalyzingScreenState();
}

class _AnalyzingScreenState extends State<AnalyzingScreen> {
  final List<String> _phrases = [
    'Analyzing your patterns...',
    'Identifying your block...',
    'Preparing your prescription...',
  ];

  int _currentPhrase = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        context.go('/diagnostic-result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GoldenSpinner(text: _phrases[_currentPhrase]),
            const SizedBox(height: 32),
            if (_currentPhrase < _phrases.length - 1 &&
                DateTime.now().millisecondsSinceEpoch % 3000 < 500)
              Text(
                _phrases[_currentPhrase],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
      ),
    );
  }
}

class GoldenSpinner extends StatelessWidget {
  final String? text;

  const GoldenSpinner({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).cardColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: _SpinningRingPainter(),
          ),
          const Text(
            '...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A853),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpinningRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 4;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..color = const Color(0xFFD4A853).withOpacity(0.2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
