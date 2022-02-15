import 'package:dashboard_camera_trap/domain/entities/report.dart';

abstract class ReportState {}

class InitialReportState implements ReportState {}

class LoadingReportState implements ReportState {}

class AddedReportState implements ReportState {}

class LoadedReportState implements ReportState {
  final Report report;

  LoadedReportState(this.report);
}

class ErrorReportState implements ReportState {
  final String message;

  ErrorReportState(this.message);
}
