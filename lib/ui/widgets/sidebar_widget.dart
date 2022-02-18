import 'package:dashboard_camera_trap/ui/shared/avatar.dart';
import 'package:dashboard_camera_trap/ui/shared/user_information.dart';
import 'package:dashboard_camera_trap/ui/widgets/item_sidebar.dart';
import 'package:dashboard_camera_trap/ui/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../shared/separator_widget.dart';

class SidebarWidget extends StatefulWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  _SidebarWidgetState createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  @override
  Widget build(BuildContext context) {
    return _sidebar();
  }

  Widget _sidebar() => ResponsiveWrapper.of(context).isDesktop || ResponsiveWrapper.of(context).isTablet
      ? Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(right: BorderSide(color: Colors.grey[100]!, width: 2)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
          height: double.infinity,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const LogoWidget(),
                    const SeparatorWidget(vertical: 20),
                    const AvatarWidget(),
                    _sidebarReports(),
                  ],
                ),
              ),
              const Divider(),
              const UserInformation(),
            ],
          ),
        )
      : Container();

  Widget _sidebarReports() {
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
}
