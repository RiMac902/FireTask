import 'dart:developer';

import 'package:fire_task/feature/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        log('SplashPage state: $state');
        if (state is Authenticated) {
          context.go('/dashboard');
        } else if (state is Unauthenticated) {
          context.go('/login');
        } else if (state is Failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          context.go('/login');
        }
      },
      child: const Scaffold(body: Center(child: FlutterLogo(size: 100))),
    );
  }
}
