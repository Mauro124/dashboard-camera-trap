import 'package:dashboard_camera_trap/ui/pages/list_page.dart';
import 'package:dashboard_camera_trap/ui/utils/dashboard_colors.dart';
import 'package:dashboard_camera_trap/ui/widgets/page_size_not_allow.dart';
import 'package:dashboard_camera_trap/ui/widgets/sidebar_admin.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DashboardColors.white,
      body: ResponsiveWrapper.of(context).isMobile ? const PageSizeNotAllow() : _admin(context),
    );
  }

  Widget _admin(BuildContext context) => Row(
        children: [
          const SidebarAdmin(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: DashboardColors.davysGrey, width: 2)),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(30),
              child: const ListPage(),
            ),
          ),
        ],
      );
}
