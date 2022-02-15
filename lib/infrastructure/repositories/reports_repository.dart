import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';

abstract class ReportsRepository {
  Future<Either<Exception, List<Report>>> getReports();
  Future<Either<Exception, Report>> getReport(String id);
  Future<Either<Exception, bool>> addReport(Report report);
  updateReport(Report report);
  deleteReportById(String id);
}
