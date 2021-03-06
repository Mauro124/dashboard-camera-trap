import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/repositories/reports_repository.dart';

class AddReport {
  final ReportsRepository reportsRepository;

  AddReport({required this.reportsRepository});

  Future<Either<Exception, void>> call({required Report report}) async => await reportsRepository.addReport(report);
}
