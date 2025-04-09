import 'package:fire_task/core/utils/helpers.dart';
import 'package:fire_task/feature/authentication/presentation/bloc/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (previous, current) => previous != current,
      listener:
          (context, state) => switch (state) {
            Initial() => null,
            Authenticated() => context.go('/dashboard'),
            Unauthenticated() => context.go('/login'),
            Failure(:final String message) => AppHelpers.showSnackBar(
              context,
              message,
            ),
            _ => null,
          },
      child: const Scaffold(body: Center(child: FlutterLogo())),
    );
  }
}
