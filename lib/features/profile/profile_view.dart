import 'package:bare_bones_flutter/core/constants/enums/router_enums.dart';
import 'package:bare_bones_flutter/core/design_system/colors/colors.dart';
import 'package:bare_bones_flutter/core/design_system/components/bare_bones_loading_indicator.dart';
import 'package:bare_bones_flutter/core/design_system/components/bare_bones_scaffold.dart';
import 'package:bare_bones_flutter/features/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authViewModelProvider, (p, c) {
      if (p?.isLoading == false && c.isLoading == true) {
        BareBonesLoadingIndicator.of(context).show();
      }
      if (p?.isLoading == true && c.isLoading == false) {
        BareBonesLoadingIndicator.of(context).hide();
      }
      if (p?.isLoggedIn == true && c.isLoggedIn == false) {
        context.goNamed(RouterEnums.signInScreen.routeName);
      }
    });

    final uid = ref.watch(authViewModelProvider).userModel.uid;

    return BareBonesScaffold(
      backgroundColor: blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.profile),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(uid),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authViewModelProvider.notifier).signOut();
              },
              child: Text(AppLocalizations.of(context)!.signOutExclamation),
            )
          ],
        ),
      ),
    );
  }
}
