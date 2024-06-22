import 'package:bare_bones_flutter/core/constants/enums/router_enums.dart';
import 'package:bare_bones_flutter/core/design_system/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget bottomNavigationBuilder(BuildContext context, String location) {
  return BottomNavigationBar(
    key: ValueKey(location),
    backgroundColor: white,
    currentIndex: _calculateSelectedIndex(context),
    selectedItemColor: blue,
    onTap: (index) => _onItemTapped(index, context),
    items: [
      BottomNavigationBarItem(
        label: AppLocalizations.of(context)?.dashboard,
        icon: const Icon(CupertinoIcons.home, size: 20),
        activeIcon: const Icon(CupertinoIcons.home, size: 20),
      ),
      BottomNavigationBarItem(
        label: AppLocalizations.of(context)?.search,
        icon: const Icon(CupertinoIcons.search, size: 20),
        activeIcon: const Icon(CupertinoIcons.search, size: 20),
      ),
      BottomNavigationBarItem(
        label: AppLocalizations.of(context)?.profile,
        icon: const Icon(CupertinoIcons.person, size: 20),
        activeIcon: const Icon(CupertinoIcons.person, size: 20),
      ),
    ],
  );
}

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).uri.toString();

  if (location == RouterEnums.dashboardScreen.routeName) {
    return 0;
  }
  if (location == RouterEnums.searchScreen.routeName) {
    return 1;
  }
  if (location == RouterEnums.profileScreen.routeName) {
    return 2;
  }
  return 0;
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      GoRouter.of(context).goNamed(RouterEnums.dashboardScreen.routeName);
      break;
    case 1:
      GoRouter.of(context).goNamed(RouterEnums.searchScreen.routeName);
      break;
    case 2:
      GoRouter.of(context).go(RouterEnums.profileScreen.routeName);
      break;
  }
}
