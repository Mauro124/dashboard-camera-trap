import 'package:dashboard_camera_trap/ui/shared/search_bar.dart';
import 'package:dashboard_camera_trap/ui/widgets/item_preview.dart';
import 'package:dashboard_camera_trap/ui/widgets/table.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchBarWidget(),
              SizedBox(height: 50),
              Expanded(child: TableWidget()),
            ],
          ),
        ),
        const ReportPreview(),
      ],
    );
  }
}
