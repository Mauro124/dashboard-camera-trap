import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/infrastructure/repositories/reports_repository.dart';

class GetReport {
  final ReportsRepository reportsRepository;

  GetReport({required this.reportsRepository});

  Future<Either<Exception, Report>> call(String id) {
    return reportsRepository.getReportById(id);
  }
}
