import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String? text;
  final bool isSpinning;

  const LoadingIndicator({
    super.key,
    this.text,
    this.isSpinning = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isSpinning)
            Container(
              width: 60,
              height: 60,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD4A853),
                    ),
                  ),
                ],
              ),
            ),
          if (text != null) ...[
            const SizedBox(height: 16),
            Text(
              text!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
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

class GoldenSpinner extends StatelessWidget {
  final String? text;

  const GoldenSpinner({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      text: text,
      isSpinning: true,
    );
  }
}

class AnalyzingSpinner extends StatelessWidget {
  final List<String> phrases;
  final Duration phraseDuration;
  final VoidCallback? onComplete;

  const AnalyzingSpinner({
    super.key,
    this.phrases = const [
      'Analyzing your patterns...',
      'Identifying your block...',
      'Preparing your prescription...',
    ],
    this.phraseDuration = const Duration(milliseconds: 1500),
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      text: phrases[0],
      isSpinning: true,
    );
  }
}
