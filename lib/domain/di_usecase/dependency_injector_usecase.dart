import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/data/repository/auth_repository.dart';
import 'package:bare_bones_flutter/domain/usecase/auth/auth_usecase.dart';

void useCaseInjectionSetup() {
  getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(getIt<AuthRepository>()));
}
