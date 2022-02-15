import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_states.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableWidget extends ConsumerStatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends ConsumerState<TableWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed((Duration.zero), () async {
      await ref.read(reportListProvider.notifier).getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    ReportListState state = ref.watch(reportListProvider);
    print("STATE: $state");

    if (state is LoadedReportListState) {
      List<DataRow> rows = _buildRows(state.reports);
      return _buildTable(rows);
    } else if (state is LoadingReportListState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ErrorReportListState) {
      return Container();
    }

    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildTable(List<DataRow> rows) {
    return Expanded(
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 400,
        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        columns: [
          _buildDataColumn("Cámara"),
          _buildDataColumn("Fecha de inicio"),
          _buildDataColumn("Fecha de detección"),
          _buildDataColumn("Hora de detección"),
          _buildDataColumn("Es foto", ColumnSize.S),
          _buildDataColumn("Es video", ColumnSize.S),
        ],
        rows: rows,
      ),
    );
  }

  DataColumn2 _buildDataColumn(String text, [ColumnSize size = ColumnSize.M, bool isNumeric = false]) => DataColumn2(
        label: Text(text),
        size: size,
        numeric: isNumeric,
      );

  List<DataRow> _buildRows(List<Report> reports) {
    List<DataRow> rows = [];
    List<DataCell> cells = [];

    for (Report report in reports) {
      cells.add(DataCell(Text("${report.camera}")));
      cells.add(DataCell(Text("${report.startDate}")));
      cells.add(DataCell(Text("${report.detectionDate}")));
      cells.add(DataCell(Text("${report.detectionTime}")));
      cells.add(DataCell(Text("${report.isPhoto}")));
      cells.add(DataCell(Text("${report.isVideo}")));
      rows.add(DataRow(cells: cells));
    }

    return rows;
  }
}
