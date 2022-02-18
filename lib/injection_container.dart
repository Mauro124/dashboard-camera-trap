import 'package:dashboard_camera_trap/data/data_sources/report/report_remote_data_sources.dart';
import 'package:dashboard_camera_trap/data/data_sources/user/user_local_data_sources.dart';
import 'package:dashboard_camera_trap/data/repositories/report_repository_implementation.dart';
import 'package:dashboard_camera_trap/data/repositories/user_repository_implementation.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/delete_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_reports.dart';
import 'package:dashboard_camera_trap/domain/use_cases/users/clear_current_user.dart';
import 'package:dashboard_camera_trap/domain/use_cases/users/get_current_user.dart';
import 'package:dashboard_camera_trap/domain/use_cases/users/save_current_user.dart';
import 'package:dashboard_camera_trap/domain/repositories/reports_repository.dart';
import 'package:dashboard_camera_trap/domain/repositories/user_repository.dart';
import 'package:dashboard_camera_trap/providers/report/report_notifier.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_notifier.dart';
import 'package:dashboard_camera_trap/providers/user/user_notifier.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Notifiers
  serviceLocator.registerFactory(
    () => ReportNotifier(
      getReport: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => ReportListNotifier(
      getReports: serviceLocator(),
      addReport: serviceLocator(),
      deleteReport: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserNotifier(
      saveCurrentUser: serviceLocator(),
      getCurrentUser: serviceLocator(),
      clearCurrentUser: serviceLocator(),
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
  serviceLocator.registerLazySingleton(
    () => DeleteReport(reportsRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SaveCurrentUser(userRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetCurrentUser(userRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => ClearCurrentUser(userRepository: serviceLocator()),
  );

  //Repositories
  serviceLocator.registerLazySingleton<ReportsRepository>(
    () => ReportRepositoryImplementation(reportRemoteDataSources: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImplementation(userLocalDataSources: serviceLocator()),
  );

  //Data sources
  serviceLocator.registerLazySingleton<ReportRemoteDataSources>(
    () => ReportFirebaseDataSourcesImplementation(),
  );
  serviceLocator.registerLazySingleton<UserLocalDataSources>(
    () => UserLocalStorageDataSourcesImplementation(),
  );
}
