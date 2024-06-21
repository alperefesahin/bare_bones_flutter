enum RouterEnums {
  signUpScreen('/sign_up_screen'),
  signInScreen('/sign_in_screen'),
  dashboardScreen('/dashboard_screen'),
  searchScreen('/search_screen'),
  profileScreen('/profile_screen');

  final String routeName;

  const RouterEnums(this.routeName);
}