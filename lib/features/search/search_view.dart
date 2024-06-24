import 'package:bare_bones_flutter/core/design_system/colors/colors.dart';
import 'package:bare_bones_flutter/core/design_system/components/bare_bones_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BareBonesScaffold(backgroundColor: green, body: Center(child: Text(AppLocalizations.of(context)!.search)));
  }
}
