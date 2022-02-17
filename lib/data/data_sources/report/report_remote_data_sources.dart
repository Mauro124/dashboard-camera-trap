import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_camera_trap/core/errors/exceptions.dart';
import 'package:dashboard_camera_trap/domain/entities/report.dart';

abstract class ReportRemoteDataSources {
  Future<List<Report>> getReports();
  Future<Report> getReport(String id);

  /// Save a document of type report in firestore and return true if OK.
  ///
  /// Throws a [ServerException] for all error code
  Future<void> addReport(Report report);

  updateReport(Report report);
  Future<void> deleteReportById(String id);
}

class ReportFirebaseDataSourcesImplementation implements ReportRemoteDataSources {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addReport(Report report) async {
    try {
      await _firebaseFirestore.collection("reports").doc(report.id).set(report.toJson());
    } catch (ex) {
      throw ServerException(500);
    }
  }

  @override
  Future<void> deleteReportById(String id) async {
    try {
      await _firebaseFirestore.collection("reports").doc(id).delete();
    } catch (ex) {
      throw ServerException(500);
    }
  }

  @override
  Future<Report> getReport(String id) async {
    try {
      return await _firebaseFirestore
          .collection("reports")
          .doc(id)
          .snapshots()
          .map((doc) => Report.fromJson(doc.data()!))
          .first;
    } catch (ex) {
      throw ServerException(500);
    }
  }

  @override
  Future<List<Report>> getReports() async {
    try {
      var collectionReference = _firebaseFirestore.collection("reports");
      var querySnapshot = await collectionReference.get();
      var documents = querySnapshot.docs;
      return documents.map((doc) => Report.fromJson(doc.data())).toList();
    } catch (ex) {
      throw ServerException(500);
    }
  }

  @override
  updateReport(Report report) {
    // TODO: implement updateReport
    throw UnimplementedError();
  }
}
