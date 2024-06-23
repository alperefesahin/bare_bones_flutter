import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/data/repository/sign_up_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

void repositoryInjectionSetup() {
  getIt.registerLazySingleton(() => SignUpRepository(getIt<FirebaseAuth>()));
}