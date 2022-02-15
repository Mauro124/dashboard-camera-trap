import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/data/repositories/report_repository_implementation.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_reports.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportListNotifier extends StateNotifier<ReportListState> {
  ReportListNotifier() : super(InitialReportListState());

  Future<void> add(Report report) async {
    state = LoadingReportListState();
    Either<Exception, bool> response =
        await AddReport(reportsRepository: ReportRepositoryImplementation()).addReport(report: report);
    response.fold((failure) => state = ErrorReportListState("Error al agregar el reporte"),
        (responseOk) => state = AddedReportListState());
  }

  Future<void> getAll() async {
    state = LoadingReportListState();
    Either<Exception, List<Report>> response =
        await GetReports(reportsRepository: ReportRepositoryImplementation()).getReports();
    response.fold((failure) => state = ErrorReportListState("Error al cargar la lista"),
        (reports) => state = LoadedReportListState(reports));
  }
}
