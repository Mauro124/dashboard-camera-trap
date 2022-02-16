import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_states.dart';
import 'package:dashboard_camera_trap/ui/widgets/report_table/reports_datasource.dart';
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
    Future.delayed((Duration.zero), () async => await ref.read(reportListProvider.notifier).getAll());
  }

  @override
  Widget build(BuildContext context) {
    ReportListState state = ref.watch(reportListProvider);

    if (state is LoadedReportListState) {
      return _buildTable(state.reports);
    } else if (state is LoadingReportListState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ErrorReportListState) {
      return Container();
    }

    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildTable(List<Report> reports) {
    return Expanded(
      child: PaginatedDataTable2(
        source: ReportsDataSource(reports: reports, onView: (Report report) => _getReportById(report.id!)),
        showFirstLastButtons: false,
        rowsPerPage: reports.length,
        sortColumnIndex: 1,
        columnSpacing: 12,
        columns: _buildColumns,
        showCheckboxColumn: false,
        wrapInCard: false,
      ),
    );
  }

  List<DataColumn2> get _buildColumns => [
        _buildDataColumn("Cámara"),
        _buildDataColumn("Fecha de inicio"),
        _buildDataColumn("Fecha de detección"),
        _buildDataColumn("Hora de detección"),
        _buildDataColumn("Es foto", ColumnSize.S),
        _buildDataColumn("Es video", ColumnSize.S),
        _buildDataColumn("", ColumnSize.S),
      ];

  DataColumn2 _buildDataColumn(String text, [ColumnSize size = ColumnSize.M, bool isNumeric = false]) => DataColumn2(
        label: Text(text),
        size: size,
        numeric: isNumeric,
      );

  void _getReportById(String id) => ref.read(reportProvider.notifier).get(id);
}
