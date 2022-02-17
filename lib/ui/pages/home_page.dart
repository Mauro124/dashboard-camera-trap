import 'package:dashboard_camera_trap/core/router/routes_name.dart';
import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/providers/user/user_states.dart';
import 'package:dashboard_camera_trap/ui/pages/list_page.dart';
import 'package:dashboard_camera_trap/ui/widgets/page_size_not_allow.dart';
import 'package:dashboard_camera_trap/ui/widgets/sidebar_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => ref.read(userProvider.notifier).getUser());
  }

  @override
  Widget build(BuildContext context) {
    UserState state = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (_) {
        if (state is EmptyUser) {
          _goToLogin(context);
        } else if (state is LoadedUserState) {
          return _buildBody(context);
        } else if (state is ErrorUserState) {
          return Center(child: Text(state.message));
        }

        return const Center(child: CircularProgressIndicator());
      }),
    );
  }

  void _goToLogin(BuildContext context) => Navigator.pushNamed(context, RoutesName.HOME_PAGE);

  Widget _buildBody(BuildContext context) => ResponsiveWrapper.of(context).isMobile
      ? const PageSizeNotAllow()
      : LayoutBuilder(builder: (context, constraints) {
          return _admin(context, constraints);
        });

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
