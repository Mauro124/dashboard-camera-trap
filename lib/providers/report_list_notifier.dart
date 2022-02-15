import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/data/repositories/report_repository_implementation.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ReportListStates {
  initial,
  loading,
  loaded,
  error,
}

class ReportListNotifier extends StateNotifier<ReportListStates> {
  ReportListNotifier() : super(ReportListStates.initial);

  Future<void> add(Report report) async {
    state = ReportListStates.loading;
    Either<Exception, bool> response =
        await AddReport(reportsRepository: ReportRepositoryImplementation()).addReport(report: report);
    response.fold((failure) => state = ReportListStates.error, (responseOk) => ReportListStates.loaded);
  }
}
