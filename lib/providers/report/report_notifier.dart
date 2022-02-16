import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_report.dart';
import 'package:dashboard_camera_trap/providers/report/report_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportNotifier extends StateNotifier<ReportState> {
  final GetReport getReport;

  ReportNotifier({required this.getReport}) : super(InitialReportState());

  Future<void> get(String id) async {
    state = LoadingReportState();
    Either<Exception, Report> response = await getReport.call(id);
    response.fold(
      (failure) => state = ErrorReportState("Error al cargar el reporte"),
      (report) => state = LoadedReportState(report),
    );
  }
}
