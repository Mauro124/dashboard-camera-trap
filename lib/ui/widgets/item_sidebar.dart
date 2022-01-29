import 'package:dashboard_camera_trap/ui/utils/dashboard_colors.dart';
import 'package:flutter/material.dart';

class ItemSidebar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function onClick;

  const ItemSidebar({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? DashboardColors.aliceBlue : DashboardColors.white,
        border: Border.all(color: DashboardColors.white),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        onTap: () => onClick(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected ? DashboardColors.black : DashboardColors.silverChalice,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: selected ? DashboardColors.black : DashboardColors.silverChalice,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
