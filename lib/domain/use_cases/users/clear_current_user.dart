import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/repositories/user_repository.dart';

class ClearCurrentUser {
  final UserRepository userRepository;

  ClearCurrentUser({required this.userRepository});

  Future<Either<Exception, void>> call() {
    return userRepository.clearCurrentUser();
  }
}
