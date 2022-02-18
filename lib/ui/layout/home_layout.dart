import 'package:dashboard_camera_trap/core/router/routes_name.dart';
import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/providers/user/user_states.dart';
import 'package:dashboard_camera_trap/ui/pages/reports_page.dart';
import 'package:dashboard_camera_trap/ui/shared/separator_widget.dart';
import 'package:dashboard_camera_trap/ui/widgets/page_size_not_allow.dart';
import 'package:dashboard_camera_trap/ui/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeLayout extends ConsumerStatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeLayout> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => ref.read(userProvider.notifier).get());
  }

  @override
  Widget build(BuildContext context) {
    UserState state = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (_) {
        if (state is LoadedUserState) {
          return _buildBody(context);
        } else if (state is ErrorUserState) {
          Future.delayed(const Duration(seconds: 5), () => _goToLogin(context));
          return _buildErrorMessage(state.message);
        }

        return const Center(child: CircularProgressIndicator());
      }),
    );
  }

  void _goToLogin(BuildContext context) => Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);

  Widget _buildBody(BuildContext context) => ResponsiveWrapper.of(context).isMobile
      ? const PageSizeNotAllow()
      : LayoutBuilder(builder: (context, constraints) {
          return _admin(context, constraints);
        });

  Widget _admin(BuildContext context, Constraints constraints) => Row(
        children: [
          const SidebarWidget(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(30),
              child: const ReportsPage(),
            ),
          ),
        ],
      );

  Widget _buildErrorMessage(String message) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SeparatorWidget(vertical: 10),
            const Text("Regresando al inicio de sesión"),
            const SeparatorWidget(vertical: 10),
            const CircularProgressIndicator(),
          ],
        ),
      );
}
