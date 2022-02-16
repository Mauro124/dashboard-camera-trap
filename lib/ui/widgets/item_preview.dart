import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/providers/report/report_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportPreview extends ConsumerWidget {
  final Report? report;

  const ReportPreview({Key? key, this.report}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ReportState reportState = ref.watch(reportProvider);
    Widget child = const Center(child: Text("No hay reporte seleccionado"));

    if (reportState is LoadedReportState) {
      child = _buildPreview(context, reportState.report);
    } else if (reportState is ErrorReportState) {
      child = Text(reportState.message);
    } else if (reportState is LoadingReportState) {
      child = const Center(child: CircularProgressIndicator());
    }

    return Container(
      width: 350,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: child,
    );
  }

  Widget _buildPreview(BuildContext context, Report report) => Column(
        children: [
          Expanded(
            child: Column(
              children: [
                _buildImageOrVideo(),
                const SizedBox(height: 20),
                _buildCameraID(context, "${report.camera}"),
                const SizedBox(height: 40),
                _buildDetails(context, report),
              ],
            ),
          ),
          _buildDeleteButton(),
        ],
      );

  Widget _buildImageOrVideo() => Container(
        constraints: const BoxConstraints.expand(height: 200),
        color: Colors.black,
      );

  Widget _buildCameraID(BuildContext context, String cameraID) => Center(
      child: Text(cameraID, style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)));

  Widget _buildDetails(BuildContext context, Report report) => Column(
        children: [
          Row(
            children: [
              _buildReportDetails(context, "Fecha de inicio", "${report.startDate}"),
              _buildReportDetails(context, "Hora de inicio", "${report.startDate}"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildReportDetails(context, "Fecha de detección", "${report.detectionDate}"),
              _buildReportDetails(context, "Hora de detección", "${report.detectionTime}"),
            ],
          ),
        ],
      );

  Widget _buildReportDetails(BuildContext context, String title, String detail) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold)),
            Text(detail, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18)),
          ],
        ),
      );

  Widget _buildDeleteButton() => ElevatedButton.icon(
        icon: const Icon(Icons.delete),
        label: const Text("Eliminar reporte"),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        onPressed: () {},
      );
}
