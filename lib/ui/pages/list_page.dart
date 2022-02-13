import 'package:dashboard_camera_trap/ui/shared/search_bar.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [SearchBarWidget()],
    );
  }
}
