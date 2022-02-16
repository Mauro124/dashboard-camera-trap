import 'package:dashboard_camera_trap/data/data_sources/report_remote_data_sources.dart';
import 'package:dashboard_camera_trap/data/repositories/report_repository_implementation.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_reports.dart';
import 'package:dashboard_camera_trap/infrastructure/repositories/reports_repository.dart';
import 'package:dashboard_camera_trap/providers/report/report_notifier.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_notifier.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Notifiers
  serviceLocator.registerFactory(
    () => ReportNotifier(
      getReport: serviceLocator(),
      addReport: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => ReportListNotifier(
      getReports: serviceLocator(),
      addReport: serviceLocator(),
    ),
  );

  //Providers
  serviceLocator.registerLazySingleton(
    () => GetReport(reportsRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => AddReport(reportsRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetReports(reportsRepository: serviceLocator()),
  );

  //Repositories
  serviceLocator.registerLazySingleton<ReportsRepository>(
    () => ReportRepositoryImplementation(reportRemoteDataSources: serviceLocator()),
  );

  //Data sources
  serviceLocator.registerLazySingleton<ReportRemoteDataSources>(
    () => ReportFirebaseDataSourcesImplementation(),
  );
}
