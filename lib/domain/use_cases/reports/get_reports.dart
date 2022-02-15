import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/infrastructure/repositories/reports_repository.dart';

class GetReports {
  final ReportsRepository reportsRepository;

  GetReports({required this.reportsRepository});

  Future<Either<Exception, List<Report>>> getReports() {
    return reportsRepository.getReports();
  }
}
