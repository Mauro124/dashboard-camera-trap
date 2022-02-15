import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/core/errors/exceptions.dart';
import 'package:dashboard_camera_trap/data/data_sources/report_remote_data_sources.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/infrastructure/repositories/reports_repository.dart';

class ReportRepositoryImplementation implements ReportsRepository {
  final ReportRemoteDataSources _reportRemoteDataSources = ReportFirebaseDataSourcesImplementation();

  @override
  deleteReportById(String id) {
    // TODO: implement deleteReportById
    throw UnimplementedError();
  }

  @override
  Report getReport(String id) {
    // TODO: implement getReport
    throw UnimplementedError();
  }

  @override
  List<Report> getReports() {
    // TODO: implement getReports
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> addReport(Report report) async {
    try {
      bool response = _reportRemoteDataSources.addReport(report);
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
}
