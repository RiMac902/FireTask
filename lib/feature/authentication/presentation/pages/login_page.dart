import 'package:fire_task/feature/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:fire_task/feature/tasks/presentation/widgets/common/error_view.dart';
import 'package:fire_task/feature/tasks/presentation/widgets/common/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder:
            (context, state) => switch (state) {
              Initial() => const Center(child: Text('Initial state')),
              Loading() => LoadingIndicator(),
              Success() => GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SafeArea(child: Center(child: Text('Login page'))),
              ),
              Failure(:final String? message) => ErrorView(message: message!),
            },
      ),
    );
  }
}
