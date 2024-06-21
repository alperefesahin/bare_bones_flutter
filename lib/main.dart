import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/core/init/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  injectionSetup();

  runApp(const ProviderScope(child: App()));
}
