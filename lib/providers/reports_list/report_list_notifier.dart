import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/delete_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_reports.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_reports_by_value.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportListNotifier extends StateNotifier<ReportListState> {
  final AddReport addReport;
  final GetReports getReports;
  final GetReportsByValue getReportsByValue;
  final DeleteReport deleteReport;

  ReportListNotifier(
      {required this.addReport, required this.getReports, required this.getReportsByValue, required this.deleteReport})
      : super(InitialReportListState());

  List<Report> _reports = [];

  Future<void> add(Report report) async {
    state = LoadingReportListState();
    Either<Exception, void> response = await addReport.call(report: report);
    response.fold(
      (failure) => state = ErrorReportListState("Error al agregar el reporte"),
      (ok) => getAll(),
    );
  }

  Future<void> delete(String id) async {
    state = LoadingReportListState();
    Either<Exception, void> response = await deleteReport.call(id: id);
    response.fold(
      (failure) => state = ErrorReportListState("Error al eliminar el reporte"),
      (ok) => getAll(),
    );
  }

  Future<void> getAll() async {
    state = LoadingReportListState();
    Either<Exception, List<Report>> response = await getReports.call();
    response.fold(
      (failure) => state = ErrorReportListState("Error al cargar la lista"),
      (reports) {
        _reports = reports;
        state = LoadedReportListState(_reports);
      },
    );
  }

  Future<void> getByValue(String value) async {
    state = LoadingReportListState();
    List<Report> reportsFilter = [];

    if (value == "") {
      reportsFilter = _reports;
    } else {
      reportsFilter = _reports
          .where((element) =>
              element.camera!.contains(value) ||
              element.startDate!.contains(value) ||
              element.detectionDate!.contains(value))
          .toList();
    }

    state = LoadedReportListState(reportsFilter);
  }
}
