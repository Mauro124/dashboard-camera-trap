import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_reports.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportListNotifier extends StateNotifier<ReportListState> {
  final AddReport addReport;
  final GetReports getReports;

  ReportListNotifier({required this.addReport, required this.getReports}) : super(InitialReportListState());

  Future<void> add(Report report) async {
    state = LoadingReportListState();
    Either<Exception, bool> response = await addReport.call(report: report);
    response.fold((failure) => state = ErrorReportListState("Error al agregar el reporte"),
        (responseOk) => state = AddedReportListState());
  }

  Future<void> getAll() async {
    state = LoadingReportListState();
    Either<Exception, List<Report>> response = await getReports.call();
    response.fold((failure) => state = ErrorReportListState("Error al cargar la lista"),
        (reports) => state = LoadedReportListState(reports));
  }
}
