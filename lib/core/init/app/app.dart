import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/core/init/router/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouterConfig = getIt<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterConfig.router,
    );
  }
}
