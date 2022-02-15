import 'package:dashboard_camera_trap/ui/pages/list_page.dart';
import 'package:dashboard_camera_trap/ui/widgets/page_size_not_allow.dart';
import 'package:dashboard_camera_trap/ui/widgets/sidebar_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWrapper.of(context).isMobile
          ? const PageSizeNotAllow()
          : LayoutBuilder(builder: (context, constraints) {
              return _admin(context, constraints);
            }),
    );
  }

  Widget _admin(BuildContext context, Constraints constraints) => Row(
        children: [
          const SidebarAdmin(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey[100]!, width: 2)),
              ),
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(30),
              child: const ListPage(),
            ),
          ),
        ],
      );
}
