import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/data/repositories/report_repository_implementation.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AddReportStates {
  initial,
  loading,
  loaded,
  error,
}

class AddReportNotifier extends StateNotifier<AddReportStates> {
  AddReportNotifier() : super(AddReportStates.initial);

  Future<void> addReport(Report report) async {
    state = AddReportStates.loading;
    Either<Exception, bool> response =
        await AddReport(reportsRepository: ReportRepositoryImplementation()).addReport(report: report);
    response.fold((failure) => state = AddReportStates.error, (responseOk) => AddReportStates.loaded);
  }
}
