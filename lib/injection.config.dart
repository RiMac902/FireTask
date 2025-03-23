// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/di/firebase_module.dart' as _i230;
import 'data/datasources/remote/task_remote_datasource.dart' as _i230;
import 'data/repositories/task_repository_impl.dart' as _i221;
import 'domain/repositories/task_repository.dart' as _i449;
import 'domain/usecases/create_task_usecase.dart' as _i612;
import 'domain/usecases/delete_task_usecase.dart' as _i757;
import 'domain/usecases/get_task_usecase.dart' as _i982;
import 'domain/usecases/get_tasks_usecase.dart' as _i501;
import 'domain/usecases/update_task_usecase.dart' as _i1018;
import 'presentation/bloc/task/task_bloc.dart' as _i944;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.factory<_i230.TaskRemoteDataSource>(
      () => _i230.TaskRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i449.TaskRepository>(
      () => _i221.TaskRepositoryImpl(gh<_i230.TaskRemoteDataSource>()),
    );
    gh.factory<_i612.CreateTaskUseCase>(
      () => _i612.CreateTaskUseCase(gh<_i449.TaskRepository>()),
    );
    gh.factory<_i501.GetTasksUseCase>(
      () => _i501.GetTasksUseCase(gh<_i449.TaskRepository>()),
    );
    gh.factory<_i982.GetTaskUseCase>(
      () => _i982.GetTaskUseCase(gh<_i449.TaskRepository>()),
    );
    gh.factory<_i1018.UpdateTaskUseCase>(
      () => _i1018.UpdateTaskUseCase(gh<_i449.TaskRepository>()),
    );
    gh.factory<_i757.DeleteTaskUseCase>(
      () => _i757.DeleteTaskUseCase(gh<_i449.TaskRepository>()),
    );
    gh.factory<_i944.TaskBloc>(
      () => _i944.TaskBloc(
        gh<_i612.CreateTaskUseCase>(),
        gh<_i757.DeleteTaskUseCase>(),
        gh<_i982.GetTaskUseCase>(),
        gh<_i501.GetTasksUseCase>(),
        gh<_i1018.UpdateTaskUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i230.FirebaseModule {}
