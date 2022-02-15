import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/data/repositories/report_repository_implementation.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_report.dart';
import 'package:dashboard_camera_trap/providers/report/report_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportNotifier extends StateNotifier<ReportState> {
  ReportNotifier() : super(InitialReportState());

  Future<void> add(Report report) async {
    state = LoadingReportState();
    Either<Exception, bool> response =
        await AddReport(reportsRepository: ReportRepositoryImplementation()).addReport(report: report);
    response.fold((failure) => state = ErrorReportState("Error al agregar el reporte"),
        (responseOk) => state = AddedReportState());
  }

  Future<void> get(String id) async {
    state = LoadingReportState();
    Either<Exception, Report> response =
        await GetReport(reportsRepository: ReportRepositoryImplementation()).getReport(id);
    response.fold((failure) => state = ErrorReportState("Error al cargar el reporte"),
        (report) => state = LoadedReportState(report));
  }
}
