import 'package:dashboard_camera_trap/core/router/routes_name.dart';
import 'package:dashboard_camera_trap/ui/pages/home_page.dart';
import 'package:dashboard_camera_trap/ui/pages/login_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.LOGIN_PAGE:
        return _GeneratePageRoute(widget: const LoginPage(), routeName: settings.name!);
      case RoutesName.HOME_PAGE:
        return _GeneratePageRoute(widget: const HomePage(), routeName: settings.name!);
      default:
        return _GeneratePageRoute(widget: const LoginPage(), routeName: settings.name!);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return widget;
          },
        );
}
