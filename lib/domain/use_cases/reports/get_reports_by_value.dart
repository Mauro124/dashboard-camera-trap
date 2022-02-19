import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/repositories/reports_repository.dart';

class GetReportsByValue {
  final ReportsRepository reportsRepository;

  GetReportsByValue({required this.reportsRepository});

  Future<Either<Exception, List<Report>>> call(String value) {
    return reportsRepository.getReportsByValue(value);
  }
}
