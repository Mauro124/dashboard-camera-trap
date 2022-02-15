import 'package:dashboard_camera_trap/providers/report/report_notifier.dart';
import 'package:dashboard_camera_trap/providers/report/report_states.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_notifier.dart';
import 'package:dashboard_camera_trap/providers/reports_list/report_list_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportListProvider = StateNotifierProvider<ReportListNotifier, ReportListState>((ref) => ReportListNotifier());
final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((ref) => ReportNotifier());
