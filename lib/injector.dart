// presentation/di/injector.dart

import 'package:get_it/get_it.dart';
import 'package:task_app/data/datasource/auth_datasource.dart';
import 'package:task_app/data/repository/auth_repository_impl.dart';
import 'package:task_app/domain/respository/auth_repository.dart';
import 'package:task_app/domain/usecase/auth_usecases.dart';
import 'package:task_app/presentation/auth_provider.dart';


final GetIt injector = GetIt.instance;

void setupDependencies() {
  // Data sources
  injector
      .registerLazySingleton<AuthDataSource>(() => FirebaseAuthDataSource());

  // Repositories
  injector.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(injector<AuthDataSource>()));

  // Use cases
  injector.registerLazySingleton<AuthUseCase>(
      () => AuthUseCaseImpl(injector<AuthRepository>()));

  // Providers
  injector.registerFactory<CustomAuthProvider>(
      () => CustomAuthProvider(injector<AuthUseCase>()));
}
