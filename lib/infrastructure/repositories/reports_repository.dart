import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';

abstract class ReportsRepository {
  List<Report> getReports();
  Report getReport(String id);
  Future<Either<Exception, bool>> addReport(Report report);
  updateReport(Report report);
  deleteReportById(String id);
}
