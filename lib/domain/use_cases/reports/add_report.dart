import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/infrastructure/repositories/reports_repository.dart';

class AddReport {
  final ReportsRepository reportsRepository;

  AddReport({required this.reportsRepository});

  Future<Either<Exception, bool>> call({required Report report}) async => await reportsRepository.addReport(report);
}
