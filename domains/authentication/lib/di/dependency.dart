import 'package:authentication/data/data_source/authentication_local_data_source.dart';
import 'package:authentication/data/repository/authentication_repository_impl.dart';
import 'package:authentication/domain/repository/authentication_repository.dart';
import 'package:authentication/domain/use_case/get_is_onboarding_opened_use_case.dart';
import 'package:authentication/domain/use_case/set_is_onboarding_opened_use_case.dart';
import 'package:dependencies/get_it/get_it.dart';

class AuthenticationDependency {
  AuthenticationDependency() {
    _registerDataSource();
    _registerRepository();
    _registerUseCase();
  }

  void _registerDataSource() {
    sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl(
        sharedPreferences: sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        authenticationLocalDataSource: sl(),
      ),
    );
  }

  void _registerUseCase() {
    sl.registerLazySingleton<GetIsOnboardingOpenedUseCase>(
      () => GetIsOnboardingOpenedUseCase(
        authenticationRepository: sl(),
      ),
    );
    sl.registerLazySingleton<SetIsOnboardingOpenedUseCase>(
      () => SetIsOnboardingOpenedUseCase(
        authenticationRepository: sl(),
      ),
    );
  }
}
