import 'dart:developer';

import 'package:fire_task/feature/authentication/presentation/bloc/splash/splash_bloc.dart';
import 'package:fire_task/feature/authentication/presentation/pages/login_page.dart';
import 'package:fire_task/feature/authentication/presentation/pages/spash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder:
          (context, state) =>
              const Scaffold(body: Center(child: Text('Register Page'))),
    ),
    GoRoute(
      path: '/dashboard',
      builder:
          (context, state) =>
              const Scaffold(body: Center(child: Text('Dashboard Page'))),
    ),
    GoRoute(
      path: '/tasks',
      builder:
          (context, state) =>
              const Scaffold(body: Center(child: Text('Tasks Page'))),
    ),
    GoRoute(
      path: '/settings',
      builder:
          (context, state) =>
              const Scaffold(body: Center(child: Text('Settings Page'))),
    ),
  ],
  redirect: (context, state) {
    final isLoggedInState = context.read<SplashBloc>().state;

    log('isLoggedInState: $isLoggedInState');

    if (isLoggedInState is Authenticated) {
      return '/dashboard';
    }

    if (isLoggedInState is Unauthenticated) {
      return '/login';
    }

    return null;
  },
);
