import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/onboarding/presentation/welcome_screen.dart';

/// SONERLER Academy uygulamasının merkezi route tanımları.
/// Yeni ekranlar eklenirken sadece bu dosya güncellenmeli.
class AppRoutes {
  AppRoutes._();

  static const String welcome = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.welcome,
  routes: [
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
  ],
);