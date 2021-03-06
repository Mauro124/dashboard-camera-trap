import 'package:dashboard_camera_trap/core/router/route_generator.dart';
import 'package:dashboard_camera_trap/core/router/routes_name.dart';
import 'package:dashboard_camera_trap/ui/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:dashboard_camera_trap/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard camera trap',
      theme: themeData,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.LOGIN_PAGE,
      builder: (_, widget) => buildResponsiveMaterial(context, widget!),
    );
  }

  Widget buildResponsiveMaterial(BuildContext context, Widget widget) {
    return Material(
      child: ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 2460,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.autoScale(450, name: MOBILE, scaleFactor: 0.6),
          ResponsiveBreakpoint.autoScale(800, name: TABLET, scaleFactor: 0.6),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET, scaleFactor: 0.9),
          ResponsiveBreakpoint.autoScale(1200, name: DESKTOP, scaleFactor: 0.7),
          ResponsiveBreakpoint.autoScale(1350, name: DESKTOP, scaleFactor: 0.7),
          ResponsiveBreakpoint.autoScale(2460, name: "4K", scaleFactor: 0.8),
        ],
      ),
    );
  }
}
