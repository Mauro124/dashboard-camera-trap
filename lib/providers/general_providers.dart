import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/delete_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_reports.dart';
import 'package:dashboard_camera_trap/domain/use_cases/users/get_current_user.dart';
import 'package:dashboard_camera_trap/domain/use_cases/users/save_current_user.dart';
import 'package:dashboard_camera_trap/injection_container.dart';
import 'package:dashboard_camera_trap/providers/report/report_notifier.dart';
import 'package:dashboard_camera_trap/providers/report/report_states.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_notifier.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_states.dart';
import 'package:dashboard_camera_trap/providers/user/user_notifier.dart';
import 'package:dashboard_camera_trap/providers/user/user_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportListProvider = StateNotifierProvider<ReportListNotifier, ReportListState>((ref) => ReportListNotifier(
      getReports: serviceLocator<GetReports>(),
      addReport: serviceLocator<AddReport>(),
      deleteReport: serviceLocator<DeleteReport>(),
    ));

final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((ref) => ReportNotifier(
      getReport: serviceLocator<GetReport>(),
    ));

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier(
      saveCurrentUser: serviceLocator<SaveCurrentUser>(),
      getCurrentUser: serviceLocator<GetCurrentUser>(),
    ));
