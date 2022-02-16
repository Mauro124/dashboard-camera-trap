import 'package:dashboard_camera_trap/domain/use_cases/reports/add_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_report.dart';
import 'package:dashboard_camera_trap/domain/use_cases/reports/get_reports.dart';
import 'package:dashboard_camera_trap/injection_container.dart';
import 'package:dashboard_camera_trap/providers/report/report_notifier.dart';
import 'package:dashboard_camera_trap/providers/report/report_states.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_notifier.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportListProvider = StateNotifierProvider<ReportListNotifier, ReportListState>((ref) => ReportListNotifier(
      getReports: serviceLocator<GetReports>(),
      addReport: serviceLocator<AddReport>(),
    ));

final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((ref) => ReportNotifier(
      getReport: serviceLocator<GetReport>(),
    ));
