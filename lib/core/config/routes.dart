import 'package:fire_task/feature/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:fire_task/feature/authentication/presentation/pages/login_page.dart';
import 'package:fire_task/feature/authentication/presentation/pages/spash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../injection.dart';
import 'auth_listenable.dart';

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  initialLocation: '/',
  debugLogDiagnostics: true,
  refreshListenable: AuthListenable(getIt<AuthBloc>()),
  redirect: (context, state) {
    final authState = context.read<AuthBloc>().state;

    if (authState is Authenticated) {
      return '/dashboard';
    } else if (authState is Unauthenticated) {
      return '/login';
    }

    return null;
  },
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
          (context, state) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Dashboard Page'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthEvent.signOut());
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            ),
          ),
    ),
  ],
);
