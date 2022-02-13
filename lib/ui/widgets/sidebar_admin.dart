import 'package:dashboard_camera_trap/ui/utils/dashboard_colors.dart';
import 'package:dashboard_camera_trap/ui/shared/avatar.dart';
import 'package:dashboard_camera_trap/ui/widgets/item_sidebar.dart';
import 'package:dashboard_camera_trap/ui/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../shared/separator_widget.dart';

class SidebarAdmin extends StatefulWidget {
  const SidebarAdmin({Key? key}) : super(key: key);

  @override
  _SidebarAdminState createState() => _SidebarAdminState();
}

class _SidebarAdminState extends State<SidebarAdmin> {
  @override
  Widget build(BuildContext context) {
    return _sidebar();
  }

  Widget _sidebar() => ResponsiveWrapper.of(context).isDesktop || ResponsiveWrapper.of(context).isTablet
      ? Container(
          color: DashboardColors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
          height: double.infinity,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoWidget(),
              const SeparatorWidget(vertical: 20),
              const AvatarWidget(),
              _sidebarItems(),
            ],
          ),
        )
      : Container();

  Widget _sidebarItems() {
    return Column(
      children: [
        ItemSidebar(
          icon: Icons.list,
          text: "Lista",
          selected: true,
          onClick: () => {},
        ),
      ],
    );
  }

  void selectItemSidebar(String route) {
    // context.vRouter.to(route);
  }
}
