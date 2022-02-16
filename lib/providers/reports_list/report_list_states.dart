import 'package:dashboard_camera_trap/domain/entities/report.dart';

abstract class ReportListState {}

class InitialReportListState implements ReportListState {}

class LoadingReportListState implements ReportListState {}

class LoadedReportListState implements ReportListState {
  final List<Report> reports;

  LoadedReportListState(this.reports);
}

class ErrorReportListState implements ReportListState {
  final String message;

  ErrorReportListState(this.message);
}
