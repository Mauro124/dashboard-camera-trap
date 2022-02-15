import 'package:dashboard_camera_trap/ui/dialogs/add_item_dialog.dart';
import 'package:dashboard_camera_trap/ui/shared/search_bar.dart';
import 'package:dashboard_camera_trap/ui/utils/dialog_extension.dart';
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
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitle(context),
                  _buildAddReportButton(context),
                ],
              ),
              const Divider(),
              const SizedBox(height: 30),
              const Expanded(child: TableWidget()),
            ],
          ),
        ),
        const ReportPreview(),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
        "Base de datos",
        style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
      );

  Widget _buildAddReportButton(BuildContext context) => ElevatedButton.icon(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        ),
        onPressed: () => _showDialog(context),
        icon: const Icon(Icons.add),
        label: const Text("AGREGAR REPORTE"),
      );

  void _showDialog(BuildContext context) => const AddReportDialog().show(context, true);
}
