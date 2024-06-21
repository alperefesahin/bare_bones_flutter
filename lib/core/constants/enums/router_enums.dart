enum RouterEnums {
  loginScreen('/login_screen'),
  dashboardScreen('/dashboard_screen'),
  searchScreen('/search_screen'),
  profileScreen('/profile_screen');

  final String routeName;

  const RouterEnums(this.routeName);
}