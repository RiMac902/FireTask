import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/',
      builder:
          (context, state) =>
              const Scaffold(body: Center(child: Text('Home Page'))),
    ),
    GoRoute(
      path: '/login',
      builder:
          (context, state) =>
              const Scaffold(body: Center(child: Text('Login Page'))),
    ),
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
);
