import 'package:fire_task/core/utils/helpers.dart';
import 'package:fire_task/feature/authentication/domain/params/sign_in_params.dart';
import 'package:fire_task/feature/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widgets/desktop_login_layout.dart';
part '../widgets/mobile_login_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.signIn(
          SignInParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Failure) {
            AppHelpers.showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return constraints.maxWidth > 600
                      ? _DesktopLayout(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        onSubmit: _onSubmit,
                        isLoading: state is Loading,
                      )
                      : _MobileLayout(formKey: _formKey);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
