import 'package:fire_task/core/presentation/wrappers/auth_scope_wrapper.dart';
import 'package:fire_task/feature/authentication/presentation/bloc/splash/splash_bloc.dart';
import 'package:fire_task/feature/authentication/presentation/pages/login_page.dart';
import 'package:fire_task/feature/authentication/presentation/pages/spash_page.dart';
import 'package:fire_task/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => getIt<SplashBloc>()..add(SplashEvent.started()),
            child: SplashPage(),
          ),
    ),
    ShellRoute(
      builder:
          (context, state, child) => UnauthorizedScopeWrapper(child: child),
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          builder:
              (context, state) =>
                  const Scaffold(body: Center(child: Text('Register Page'))),
        ),
      ],
    ),
    ShellRoute(
      ///TODO: builder: (context, state, child) => AuthorizedScopeWrapper(child: child),
      routes: [
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
    ),
  ],
);
