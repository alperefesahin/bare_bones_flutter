import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/domain/usecase/sign_up/sign_up_usecase.dart';

void useCaseInjectionSetup() {
  getIt.registerLazySingleton(() => SignUpUseCase(getIt()));
}
