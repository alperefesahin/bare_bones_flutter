import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

void repositoryInjectionSetup() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<FirebaseAuth>()));
}
