import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/core/errors/exceptions.dart';
import 'package:dashboard_camera_trap/data/data_sources/report/report_remote_data_sources.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/repositories/reports_repository.dart';

class ReportRepositoryImplementation implements ReportsRepository {
  final ReportRemoteDataSources reportRemoteDataSources;

  ReportRepositoryImplementation({required this.reportRemoteDataSources});

  @override
  Future<Either<Exception, Report>> getReportById(String id) async {
    try {
      Report report = await reportRemoteDataSources.getReport(id);
      return Right(report);
    } on ServerException catch (e) {
      return Left(ServerException(e.statusCode));
    }
  }

  @override
  Future<Either<Exception, List<Report>>> getReports() async {
    try {
      List<Report> reports = await reportRemoteDataSources.getReports();
      return Right(reports);
    } on ServerException catch (e) {
      return Left(ServerException(e.statusCode));
    }
  }

  @override
  Future<Either<Exception, void>> addReport(Report report) async {
    try {
      final response = await reportRemoteDataSources.addReport(report);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerException(e.statusCode));
    }
  }

  @override
  updateReport(Report report) {
    // TODO: implement updateReport
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, void>> deleteReportById(String id) async {
    try {
      var response = await reportRemoteDataSources.deleteReportById(id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerException(e.statusCode));
    }
  }
}
