import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:dashboard_camera_trap/infrastructure/repositories/user_repository.dart';

class SaveCurrentUser {
  final UserRepository userRepository;

  SaveCurrentUser({required this.userRepository});

  Future<Either<Exception, void>> call(User user) {
    return userRepository.saveCurrentUser(user);
  }
}
