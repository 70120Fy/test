import 'package:flutter/material.dart';

import '../../widgets/animated/golden_particles_bg.dart';
import '../../core/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: GoldenParticlesBackground(),
      persistentFooterButtons: [
        Positioned(
          bottom: 32,
          left: 0,
          right: 0,
          child: Center(
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: AlwaysStoppedAnimation(1.0),
                curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
              ),
              child: Column(
                children: [
                  Text(
                    'Find your block.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fix your discipline.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.gold300,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
