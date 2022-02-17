import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:dashboard_camera_trap/domain/repositories/user_repository.dart';

class GetCurrentUser {
  final UserRepository userRepository;

  GetCurrentUser({required this.userRepository});

  Future<Either<Exception, User>> call() {
    return userRepository.getCurrentUser();
  }
}
