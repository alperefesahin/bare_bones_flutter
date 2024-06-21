import 'package:flutter/material.dart';

class BareBonesScaffold extends StatelessWidget {
  const BareBonesScaffold({super.key, required this.body, this.appBar, this.bottomNavigationBar});

  final Widget? body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
