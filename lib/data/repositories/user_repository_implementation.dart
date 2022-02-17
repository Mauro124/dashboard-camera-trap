import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/core/errors/exceptions.dart';
import 'package:dashboard_camera_trap/data/data_sources/user/user_local_data_sources.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:dashboard_camera_trap/infrastructure/repositories/user_repository.dart';

class UserRepositoryImplementation implements UserRepository {
  final UserLocalDataSources userLocalDataSources;

  UserRepositoryImplementation({required this.userLocalDataSources});

  @override
  Future<Either<Exception, void>> saveCurrentUser(User user) async {
    try {
      var response = await userLocalDataSources.saveUser(user);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerException(e.statusCode));
    }
  }
}
