import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:flutter/material.dart';

class ReportsDataSource extends DataTableSource {
  late List<Report> reports;
  late Function(Report) onView;

  ReportsDataSource({
    required this.reports,
    required this.onView,
  });

  @override
  DataRow getRow(int index) {
    Report report = reports[index];
    return DataRow.byIndex(
      index: index,
      color: index.isEven ? MaterialStateProperty.all(Colors.grey[200]) : MaterialStateProperty.all(Colors.white),
      cells: [
        DataCell(Text("${report.camera}")),
        DataCell(Text("${report.startDate}")),
        DataCell(Text("${report.detectionDate}")),
        DataCell(Text("${report.detectionTime}")),
        DataCell(Text("${report.isPhoto}")),
        DataCell(Text("${report.isVideo}")),
        DataCell(
          ElevatedButton(
            child: const Text("Ver"),
            onPressed: () => onView(report),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => reports.length;

  @override
  int get selectedRowCount => 0;
}
