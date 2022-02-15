import 'package:dashboard_camera_trap/ui/widgets/form_widget.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(context),
              const Divider(),
              const Expanded(child: FormWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
        "AGREGAR ITEM",
        style: Theme.of(context).textTheme.headline5,
      );
}
