import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/core/errors/exceptions.dart';
import 'package:dashboard_camera_trap/core/logger.dart';
import 'package:dashboard_camera_trap/data/data_sources/user/user_local_data_sources.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:dashboard_camera_trap/domain/repositories/user_repository.dart';

class UserRepositoryImplementation implements UserRepository {
  final UserLocalDataSources userLocalDataSources;

  UserRepositoryImplementation({required this.userLocalDataSources});

  @override
  Future<Either<Exception, void>> saveCurrentUser(User user) async {
    try {
      var response = await userLocalDataSources.saveUser(user);
      return Right(response);
    } on ServerException catch (ex) {
      logger.e('saveCurrentUser: ${ex.statusCode}');
      return Left(ServerException(ex.statusCode));
    }
  }

  @override
  Future<Either<Exception, User>> getCurrentUser() async {
    try {
      User response = await userLocalDataSources.getUser();
      return Right(response);
    } on LocalStorageException catch (ex) {
      logger.e('getCurrentUser: ${ex.message}');
      return Left(LocalStorageException(ex.message));
    }
  }

  @override
  Future<Either<Exception, void>> clearCurrentUser() async {
    try {
      var response = await userLocalDataSources.clearUser();
      return Right(response);
    } on LocalStorageException catch (ex) {
      logger.e('clearCurrentUser: ${ex.message}');
      return Left(LocalStorageException(ex.message));
    }
  }
}
