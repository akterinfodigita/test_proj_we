import 'package:flutter/material.dart';
import 'package:dokan/core/constants/app_strings.dart';
import 'package:dokan/core/constants/app_strings.dart';

import '../auth/login/view/login_page.dart';
import '../screens/dashboard/view/dashboard_screen.dart';
import '../screens/splash/view/splash_screen.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login_cubits";
  static const String dashboard = "/dashboard";
  static const String introPages = "/introPages";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: routeSettings);

      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => LoginPage(), settings: routeSettings);

      case Routes.dashboard:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen(), settings: routeSettings);

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noPageFound),
        ),
        body: const Center(
          child: Text(AppStrings.noPageFound),
        ),
      ),
    );
  }
}
