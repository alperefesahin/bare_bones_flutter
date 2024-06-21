import 'package:bare_bones_flutter/core/design_system/components/bare_bones_scaffold.dart';
import 'package:bare_bones_flutter/features/navigation/view/widgets/bottom_navigation_builder.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key, this.child, required this.location});

  final Widget? child;
  final String location;

  @override
  Widget build(BuildContext context) {
    return BareBonesScaffold(
        bottomNavigationBar: bottomNavigationBuilder(context,location), body: child);
  }
}
