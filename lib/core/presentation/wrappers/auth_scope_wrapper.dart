import 'package:fire_task/feature/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:fire_task/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnauthorizedScopeWrapper extends StatelessWidget {
  final Widget child;

  const UnauthorizedScopeWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<AuthBloc>())],
      child: child,
    );
  }
}
