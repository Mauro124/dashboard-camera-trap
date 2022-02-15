import 'package:dashboard_camera_trap/ui/dialogs/add_item_dialog.dart';
import 'package:dashboard_camera_trap/ui/utils/dialog_extension.dart';
import 'package:flutter/material.dart';

class ButtonAddItem extends StatelessWidget {
  const ButtonAddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
      ),
      onPressed: () => _showDialog(context),
      icon: const Icon(Icons.add),
      label: const Text("AGREGAR ITEM"),
    );
  }

  void _showDialog(BuildContext context) => const AddItemDialog().show(context, true);
}
