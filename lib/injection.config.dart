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
import 'feature/dashboard/domain/usecases/add_member_usecase.dart' as _i946;
import 'feature/dashboard/domain/usecases/create_board_usecase.dart' as _i333;
import 'feature/dashboard/domain/usecases/create_project_usecase.dart'
    as _i1040;
import 'feature/dashboard/domain/usecases/create_task_usecase.dart' as _i505;
import 'feature/dashboard/domain/usecases/delete_board_usecase.dart' as _i113;
import 'feature/dashboard/domain/usecases/delete_project_usecase.dart' as _i767;
import 'feature/dashboard/domain/usecases/delete_task_usecase.dart' as _i659;
import 'feature/dashboard/domain/usecases/get_boards_usecase.dart' as _i134;
import 'feature/dashboard/domain/usecases/get_projects_usecase.dart' as _i1029;
import 'feature/dashboard/domain/usecases/get_tasks_usecase.dart' as _i1020;
import 'feature/dashboard/domain/usecases/move_task_usecase.dart' as _i560;
import 'feature/dashboard/domain/usecases/remove_member_usecase.dart' as _i992;
import 'feature/dashboard/domain/usecases/reorder_columns_usecase.dart'
    as _i184;
import 'feature/dashboard/domain/usecases/reorder_tasks_usecase.dart' as _i211;
import 'feature/dashboard/domain/usecases/update_board_usecase.dart' as _i77;
import 'feature/dashboard/domain/usecases/update_project_usecase.dart' as _i498;
import 'feature/dashboard/domain/usecases/update_task_usecase.dart' as _i435;
import 'feature/dashboard/domain/usecases/watch_boards_usecase.dart' as _i668;
import 'feature/dashboard/domain/usecases/watch_projects_usecase.dart' as _i260;
import 'feature/dashboard/domain/usecases/watch_tasks_usecase.dart' as _i414;
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
    gh.factory<_i774.AuthDataSource>(
      () => _i774.AuthDataSourceImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i1053.DashboardRepository>(
      () => _i612.DashboardRepositoryImpl(gh<_i106.DashboardDataSource>()),
    );
    gh.factory<_i481.DashboardBloc>(
      () => _i481.DashboardBloc(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i946.AddMemberUseCase>(
      () => _i946.AddMemberUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i333.CreateBoardUseCase>(
      () => _i333.CreateBoardUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i1040.CreateProjectUseCase>(
      () => _i1040.CreateProjectUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i505.CreateTaskUseCase>(
      () => _i505.CreateTaskUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i113.DeleteBoardUseCase>(
      () => _i113.DeleteBoardUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i767.DeleteProjectUseCase>(
      () => _i767.DeleteProjectUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i659.DeleteTaskUseCase>(
      () => _i659.DeleteTaskUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i134.GetBoardsUseCase>(
      () => _i134.GetBoardsUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i1029.GetProjectsUseCase>(
      () => _i1029.GetProjectsUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i1020.GetTasksUseCase>(
      () => _i1020.GetTasksUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i560.MoveTaskUseCase>(
      () => _i560.MoveTaskUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i992.RemoveMemberUseCase>(
      () => _i992.RemoveMemberUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i184.ReorderColumnsUseCase>(
      () => _i184.ReorderColumnsUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i211.ReorderTasksUseCase>(
      () => _i211.ReorderTasksUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i77.UpdateBoardUseCase>(
      () => _i77.UpdateBoardUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i498.UpdateProjectUseCase>(
      () => _i498.UpdateProjectUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i435.UpdateTaskUseCase>(
      () => _i435.UpdateTaskUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i668.WatchBoardsUseCase>(
      () => _i668.WatchBoardsUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i260.WatchProjectsUseCase>(
      () => _i260.WatchProjectsUseCase(gh<_i1053.DashboardRepository>()),
    );
    gh.factory<_i414.WatchTasksUseCase>(
      () => _i414.WatchTasksUseCase(gh<_i1053.DashboardRepository>()),
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
