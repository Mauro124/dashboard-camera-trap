import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_camera_trap/core/errors/exceptions.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';

abstract class ReportRemoteDataSources {
  List<Report> getReports();
  Report getReport(String id);

  /// Save a document of type report in firestore and return true if OK.
  ///
  /// Throws a [ServerException] for all error code
  bool addReport(Report report);

  updateReport(Report report);
  deleteReportById(String id);
}

class ReportFirebaseDataSourcesImplementation implements ReportRemoteDataSources {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  bool addReport(Report report) {
    try {
      _firebaseFirestore.collection("reports").doc(report.id).set(report.toJson());
      return true;
    } catch (ex) {
      throw ServerException(500);
    }
  }

  @override
  deleteReportById(String id) {
    // TODO: implement deleteReportById
    throw UnimplementedError();
  }

  @override
  Report getReport(String id) {
    // TODO: implement getReport
    throw UnimplementedError();
  }

  @override
  List<Report> getReports() {
    // TODO: implement getReports
    throw UnimplementedError();
  }

  @override
  updateReport(Report report) {
    // TODO: implement updateReport
    throw UnimplementedError();
  }
}
