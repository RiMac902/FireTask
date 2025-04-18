import 'dart:async';

import 'package:flutter/material.dart';
import '../../feature/authentication/presentation/bloc/auth/auth_bloc.dart';

class AuthListenable extends ChangeNotifier {
  final AuthBloc _authBloc;
  StreamSubscription? _subscription;

  AuthListenable(this._authBloc) {
    _subscription = _authBloc.stream.listen((state) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
