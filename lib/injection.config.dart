// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/di/firebase_module.dart' as _i230;
import 'feature/authentication/data/datasources/remote/auth_datasource.dart'
    as _i774;
import 'feature/authentication/data/repositories/auth_repository_impl.dart'
    as _i278;
import 'feature/authentication/domain/repositories/auth_repository.dart'
    as _i209;
import 'feature/authentication/domain/usecases/auth_state_usecase.dart'
    as _i274;
import 'feature/authentication/domain/usecases/is_logged_in_usecase.dart'
    as _i550;
import 'feature/authentication/domain/usecases/logout_usecase.dart' as _i14;
import 'feature/authentication/domain/usecases/signin_usecase.dart' as _i477;
import 'feature/authentication/presentation/bloc/auth/auth_bloc.dart' as _i561;
import 'feature/dashboard/data/datasources/dashboard_datasource.dart' as _i106;
import 'feature/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i612;
import 'feature/dashboard/domain/repositories/dashboard_repository.dart'
    as _i1053;
import 'feature/dashboard/presentation/bloc/dashboard_bloc.dart' as _i481;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.singleton<_i59.FirebaseAuth>(() => firebaseModule.auth);
    gh.factory<_i106.DashboardDataSource>(
      () => _i106.DashboardRepositoryImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i106.DashboardDataSource>(
      () => _i106.DashboardRepositoryImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i774.AuthDataSource>(
      () => _i774.AuthDataSourceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i1053.DashboardRepository>(
      () => _i612.DashboardRepositoryImpl(gh<_i106.DashboardDataSource>()),
    );
    gh.factory<_i481.DashboardBloc>(
      () => _i481.DashboardBloc(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i209.AuthRepository>(
      () => _i278.AuthRepositoryImpl(gh<_i774.AuthDataSource>()),
    );
    gh.factory<_i274.AuthStateUseCase>(
      () => _i274.AuthStateUseCase(gh<_i209.AuthRepository>()),
    );
    gh.factory<_i550.IsLoggedInUsecase>(
      () => _i550.IsLoggedInUsecase(gh<_i209.AuthRepository>()),
    );
    gh.factory<_i14.LogoutUseCase>(
      () => _i14.LogoutUseCase(gh<_i209.AuthRepository>()),
    );
    gh.factory<_i477.SignInUseCase>(
      () => _i477.SignInUseCase(gh<_i209.AuthRepository>()),
    );
    gh.factory<_i561.AuthBloc>(
      () => _i561.AuthBloc(
        gh<_i477.SignInUseCase>(),
        gh<_i14.LogoutUseCase>(),
        gh<_i274.AuthStateUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i230.FirebaseModule {}
