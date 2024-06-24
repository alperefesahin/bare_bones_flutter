import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/core/init/app/app.dart';
import 'package:bare_bones_flutter/data/di_repository/dependency_injector_repository.dart';
import 'package:bare_bones_flutter/domain/di_usecase/dependency_injector_usecase.dart';
import 'package:bare_bones_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  injectionSetup();
  repositoryInjectionSetup();
  useCaseInjectionSetup();

  runApp(const ProviderScope(child: App()));
}
