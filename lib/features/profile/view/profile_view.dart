import 'package:bare_bones_flutter/core/design_system/colors/colors.dart';
import 'package:bare_bones_flutter/core/design_system/components/bare_bones_scaffold.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BareBonesScaffold(
      backgroundColor: blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // handle sign out
              },
              child: const Text('Sign out!'),
            )
          ],
        ),
      ),
    );
  }
}
