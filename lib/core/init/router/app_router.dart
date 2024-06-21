import 'package:bare_bones_flutter/core/constants/enums/router_enums.dart';
import 'package:bare_bones_flutter/core/init/router/custom_page_builder_widget.dart';
import 'package:bare_bones_flutter/features/auth/login/login_view.dart';
import 'package:bare_bones_flutter/features/dashboard/view/dashboard_view.dart';
import 'package:bare_bones_flutter/features/navigation/view/bottom_navigation_view.dart';
import 'package:bare_bones_flutter/features/profile/view/profile_view.dart';
import 'package:bare_bones_flutter/features/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouterEnums.loginScreen.routeName,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RouterEnums.loginScreen.routeName,
        name: RouterEnums.loginScreen.routeName,
        pageBuilder: (context, state) => customPageBuilderWidget(
          context,
          state,
          const LoginView(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) => customPageBuilderWidget(
            context, state, BottomNavigationWidget(location: state.uri.toString(), child: child)),
        routes: [
          GoRoute(
            name: RouterEnums.dashboardScreen.routeName,
            path: RouterEnums.dashboardScreen.routeName,
            pageBuilder: (context, state) => customPageBuilderWidget(
              context,
              state,
              const DashboardView(),
            ),
          ),
          GoRoute(
            name: RouterEnums.searchScreen.routeName,
            path: RouterEnums.searchScreen.routeName,
            pageBuilder: (context, state) => customPageBuilderWidget(
              context,
              state,
              const SearchView(),
            ),
          ),
          GoRoute(
            name: RouterEnums.profileScreen.routeName,
            path: RouterEnums.profileScreen.routeName,
            pageBuilder: (context, state) => customPageBuilderWidget(
              context,
              state,
              const ProfileView(),
            ),
          ),
        ],
      ),
    ],
  );
}
