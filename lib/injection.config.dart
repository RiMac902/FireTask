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
import 'feature/authentication/domain/usecases/signin_usecase.dart' as _i477;
import 'feature/tasks/data/datasources/remote/task_remote_datasource.dart'
    as _i53;
import 'feature/tasks/data/repositories/task_repository_impl.dart' as _i331;
import 'feature/tasks/domain/repositories/task_repository.dart' as _i982;
import 'feature/tasks/domain/usecases/create_task_usecase.dart' as _i227;
import 'feature/tasks/domain/usecases/delete_task_usecase.dart' as _i691;
import 'feature/tasks/domain/usecases/get_task_usecase.dart' as _i789;
import 'feature/tasks/domain/usecases/get_tasks_usecase.dart' as _i493;
import 'feature/tasks/domain/usecases/update_task_usecase.dart' as _i952;
import 'feature/tasks/presentation/bloc/task/task_bloc.dart' as _i459;

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
    gh.factory<_i774.AuthDataSource>(
      () => _i774.AuthDataSourceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i53.TaskRemoteDataSource>(
      () => _i53.TaskRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i982.TaskRepository>(
      () => _i331.TaskRepositoryImpl(gh<_i53.TaskRemoteDataSource>()),
    );
    gh.factory<_i209.AuthRepository>(
      () => _i278.AuthRepositoryImpl(gh<_i774.AuthDataSource>()),
    );
    gh.factory<_i477.SignInUseCase>(
      () => _i477.SignInUseCase(gh<_i209.AuthRepository>()),
    );
    gh.factory<_i227.CreateTaskUseCase>(
      () => _i227.CreateTaskUseCase(gh<_i982.TaskRepository>()),
    );
    gh.factory<_i691.DeleteTaskUseCase>(
      () => _i691.DeleteTaskUseCase(gh<_i982.TaskRepository>()),
    );
    gh.factory<_i493.GetTasksUseCase>(
      () => _i493.GetTasksUseCase(gh<_i982.TaskRepository>()),
    );
    gh.factory<_i789.GetTaskUseCase>(
      () => _i789.GetTaskUseCase(gh<_i982.TaskRepository>()),
    );
    gh.factory<_i952.UpdateTaskUseCase>(
      () => _i952.UpdateTaskUseCase(gh<_i982.TaskRepository>()),
    );
    gh.factory<_i459.TaskBloc>(
      () => _i459.TaskBloc(
        gh<_i227.CreateTaskUseCase>(),
        gh<_i691.DeleteTaskUseCase>(),
        gh<_i789.GetTaskUseCase>(),
        gh<_i493.GetTasksUseCase>(),
        gh<_i952.UpdateTaskUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i230.FirebaseModule {}
