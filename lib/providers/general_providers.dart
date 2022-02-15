import 'package:dashboard_camera_trap/providers/report_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addReportProvider = StateNotifierProvider<ReportListNotifier, ReportListStates>((ref) => ReportListNotifier());
