import 'package:dashboard_camera_trap/ui/dialogs/add_item_dialog.dart';
import 'package:dashboard_camera_trap/ui/utils/dialog_extension.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitle(context),
            _buildAddReportButton(),
          ],
        ),
        const Divider(),
        const SizedBox(height: 30),
        Expanded(child: _buildTable()),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
        "Base de datos",
        style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
      );

  Widget _buildTable() {
    return DataTable2(
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
        _buildDataColumn("Es Video", ColumnSize.S),
      ],
      rows: List<DataRow>.generate(
          10,
          (index) => DataRow(cells: [
                DataCell(Text('B' * (10 - (index + 5) % 10))),
                DataCell(Text('C' * (15 - (index + 5) % 10))),
                DataCell(Text('D' * (15 - (index + 10) % 10))),
                DataCell(Text('D' * (15 - (index + 10) % 10))),
                DataCell(Text('D' * (15 - (index + 10) % 10))),
                DataCell(Text(((index + 0.1) * 25.4).toString()))
              ])),
    );
  }

  DataColumn2 _buildDataColumn(String text, [ColumnSize size = ColumnSize.M, bool isNumeric = false]) => DataColumn2(
        label: Text(text),
        size: size,
        numeric: isNumeric,
      );

  Widget _buildAddReportButton() => ElevatedButton.icon(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        ),
        onPressed: () => _showDialog(context),
        icon: const Icon(Icons.add),
        label: const Text("AGREGAR REPORTE"),
      );

  void _showDialog(BuildContext context) => const AddReportDialog().show(context, true);
}
