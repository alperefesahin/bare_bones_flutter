import 'package:bare_bones_flutter/core/design_system/components/bare_bones_scaffold.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BareBonesScaffold(body: Center(child: Text('Login')));
  }
}
