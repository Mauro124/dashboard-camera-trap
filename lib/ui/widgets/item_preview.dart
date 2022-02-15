import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:flutter/material.dart';

class ReportPreview extends StatelessWidget {
  final Report? report;

  const ReportPreview({Key? key, this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          _buildImageOrVideo(),
          const SizedBox(height: 20),
          _buildCameraID(context, "IMAG0002"),
          const SizedBox(height: 40),
          _buildDetails(context),
        ],
      ),
    );
  }

  Widget _buildImageOrVideo() => Container(
        constraints: const BoxConstraints.expand(height: 200),
        color: Colors.black,
      );

  Widget _buildCameraID(BuildContext context, String cameraID) => Center(
      child: Text(cameraID, style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)));

  Widget _buildDetails(BuildContext context) => Column(
        children: [
          Row(
            children: [
              _buildReportDetails(context, "Fecha de inicio", "20/10/2022"),
              _buildReportDetails(context, "Hora de inicio", "10:00 hs"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildReportDetails(context, "Fecha de detección", "20/10/2022"),
              _buildReportDetails(context, "Hora de detección", "10:00 hs"),
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
}
