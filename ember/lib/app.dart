import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'core/constants/app_colors.dart';
import 'providers/onboarding_provider.dart';
import 'providers/diagnostic_provider.dart';
import 'providers/program_provider.dart';
import 'providers/streak_provider.dart';
import 'providers/mood_provider.dart';
import 'providers/subscription_provider.dart';
import 'providers/user_provider.dart';
import 'providers/settings_provider.dart';
import 'services/storage_service.dart';
import 'services/content_service.dart';
import 'routes/app_router.dart';

class EmberApp extends StatelessWidget {
  const EmberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StorageService()..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DiagnosticProvider(context.read<StorageService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => ProgramProvider(
            context.read<StorageService>(),
            ContentService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => StreakProvider(context.read<StorageService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => MoodProvider(context.read<StorageService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => SubscriptionProvider(context.read<StorageService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(context.read<StorageService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
      ],
      child: Consumer<OnboardingProvider>(
        builder: (context, onboardingProvider, child) {
          return MaterialApp.router(
            title: 'Ember',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            routerConfig: _router,
            builder: (context, child) {
              return MaterialApp(
                title: 'Ember',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.darkTheme,
                home: onboardingProvider.shouldShowOnboarding
                    ? const OnboardingScreen()
                    : const HomeScreen(),
              );
            },
          );
        },
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    {
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    },
    {
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    },
    {
      path: '/diagnostic',
      name: 'diagnostic',
      builder: (context, state) => const DiagnosticIntroScreen(),
    },
    {
      path: '/quiz',
      name: 'quiz',
      builder: (context, state) => const DiagnosticQuizScreen(),
    },
    {
      path: '/analyzing',
      name: 'analyzing',
      builder: (context, state) => const AnalyzingScreen(),
    },
    {
      path: '/result',
      name: 'result',
      builder: (context, state) => const DiagnosticResultScreen(),
    },
    {
      path: '/protocol',
      name: 'protocol',
      builder: (context, state) => const DailyProtocolScreen(),
    },
    {
      path: '/protocol/complete',
      name: 'protocolComplete',
      builder: (context, state) => const ProtocolCompleteScreen(),
    },
    {
      path: '/programs',
      name: 'programs',
      builder: (context, state) => const ProgramsScreen(),
    },
    {
      path: '/programs/detail',
      name: 'programDetail',
      builder: (context, state) => const ProgramDetailScreen(),
    },
    {
      path: '/insights',
      name: 'insights',
      builder: (context, state) => const InsightsScreen(),
    },
    {
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    },
    {
      path: '/subscription',
      name: 'subscription',
      builder: (context, state) => const PaywallScreen(),
    },
    {
      path: '/trial',
      name: 'trial',
      builder: (context, state) => const TrialEndingScreen(),
    },
    {
      path: '/subscribe-success',
      name: 'subscribeSuccess',
      builder: (context, state) => const SubscribeSuccessScreen(),
    },
  ],
);
