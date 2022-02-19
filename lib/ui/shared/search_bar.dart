import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        onSubmitted: (value) async {
          await ref.read(reportListProvider.notifier).getByValue(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          icon: const Icon(Icons.search),
          hintText: "Buscar por cámara, día, etc.",
          suffixIcon: _buildClearIcon(),
        ),
      ),
    );
  }

  Widget _buildClearIcon() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => {},
          child: const Icon(Icons.clear),
        ),
      );
}
