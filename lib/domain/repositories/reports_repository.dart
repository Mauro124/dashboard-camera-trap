import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';

abstract class ReportsRepository {
  Future<Either<Exception, List<Report>>> getReports();
  Future<Either<Exception, List<Report>>> getReportsByValue(String value);
  Future<Either<Exception, Report>> getReportById(String id);
  Future<Either<Exception, void>> addReport(Report report);
  updateReport(Report report);
  Future<Either<Exception, void>> deleteReportById(String id);
}
