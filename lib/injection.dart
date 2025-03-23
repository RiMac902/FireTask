import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @lazySingleton
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();
}

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  getIt.registerSingleton<NetworkInfo>(
    NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );
}
