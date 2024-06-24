import 'package:bare_bones_flutter/core/design_system/colors/colors.dart';
import 'package:bare_bones_flutter/core/design_system/components/bare_bones_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BareBonesScaffold(
      backgroundColor: orange,
      body: Center(child: Text(AppLocalizations.of(context)!.dashboard)),
    );
  }
}
