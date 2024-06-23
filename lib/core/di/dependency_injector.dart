import 'package:bare_bones_flutter/core/init/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void injectionSetup() {
  // We call AppRouter for once and register it as a singleton.
  getIt.registerFactory(() => AppRouter());
  getIt.registerFactory(() => FirebaseAuth.instance);
}