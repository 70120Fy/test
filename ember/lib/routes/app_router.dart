import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/subscription_provider.dart';
import '../providers/diagnostic_provider.dart';
import '../providers/onboarding_provider.dart';

import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/diagnostic/diagnostic_intro_screen.dart';
import '../screens/diagnostic/diagnostic_quiz_screen.dart';
import '../screens/diagnostic/diagnostic_analyzing_screen.dart';
import '../screens/diagnostic/diagnostic_result_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/protocol/daily_protocol_screen.dart';
import '../screens/protocol/protocol_complete_screen.dart';
import '../screens/programs/programs_screen.dart';
import '../screens/programs/program_detail_screen.dart';
import '../screens/insights/insights_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/subscription/paywall_screen.dart';
import '../screens/subscription/trial_ending_screen.dart';
import '../screens/subscription/subscribe_success_screen.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (_, __) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/diagnostic-intro',
      name: 'diagnostic-intro',
      builder: (_, __) => const DiagnosticIntroScreen(),
    ),
    GoRoute(
      path: '/diagnostic-quiz',
      name: 'diagnostic-quiz',
      builder: (_, __) => const DiagnosticQuizScreen(),
    ),
    GoRoute(
      path: '/analyzing',
      name: 'analyzing',
      builder: (_, __) => const AnalyzingScreen(),
    ),
    GoRoute(
      path: '/diagnostic-result',
      name: 'diagnostic-result',
      builder: (_, __) => const DiagnosticResultScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/protocol',
      name: 'protocol',
      builder: (_, __) => const DailyProtocolScreen(),
    ),
    GoRoute(
      path: '/protocol-complete',
      name: 'protocol-complete',
      builder: (_, __) => const ProtocolCompleteScreen(),
    ),
    GoRoute(
      path: '/programs',
      name: 'programs',
      builder: (_, __) => const ProgramsScreen(),
    ),
    GoRoute(
      path: '/program-detail',
      name: 'program-detail',
      builder: (_, __) => const ProgramDetailScreen(),
    ),
    GoRoute(
      path: '/insights',
      name: 'insights',
      builder: (_, __) => const InsightsScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (_, __) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/paywall',
      name: 'paywall',
      builder: (_, __) => const PaywallScreen(),
    ),
    GoRoute(
      path: '/trial-ending',
      name: 'trial-ending',
      builder: (_, __) => const TrialEndingScreen(),
    ),
    GoRoute(
      path: '/subscribe-success',
      name: 'subscribe-success',
      builder: (_, __) => const SubscribeSuccessScreen(),
    ),
  ],
);

class AppRouter {
  static String? getRedirect(
    BuildContext context,
    SubscriptionProvider subProvider,
    DiagnosticProvider diagProvider,
    OnboardingProvider onboardingProvider,
  ) {
    final state = GoRouterState.of(context);
    final path = state.location;

    // Always allow public routes
    final publicPaths = [
      '/',
      '/onboarding',
      '/diagnostic-intro',
      '/diagnostic-quiz',
      '/analyzing',
      '/diagnostic-result',
      '/paywall',
    ];

    if (publicPaths.contains(path)) return null;

    // Check onboarding
    if (!onboardingProvider.isCompleted) return '/onboarding';

    // Check subscription
    if (subProvider.isExpired) return '/paywall';

    // Redirect to diagnostic if not taken
    if (diagProvider.result == null && path != '/diagnostic-intro') {
      return '/diagnostic-intro';
    }

    return null;
  }
}
