import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Exception, void>> saveCurrentUser(User user);
  Future<Either<Exception, User>> getCurrentUser();
}
