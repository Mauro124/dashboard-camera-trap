import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/infrastructure/repositories/reports_repository.dart';

class DeleteReport {
  final ReportsRepository reportsRepository;

  DeleteReport({required this.reportsRepository});

  Future<Either<Exception, void>> call({required String id}) {
    return reportsRepository.deleteReportById(id);
  }
}
