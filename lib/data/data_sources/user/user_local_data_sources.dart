import 'package:dashboard_camera_trap/core/errors/exceptions.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:localstorage/localstorage.dart';

abstract class UserLocalDataSources {
  /// Save a user in localstorage.
  ///
  /// Throws a [ServerException] for all error code
  Future<void> saveUser(User user);
}

class UserLocalStorageDataSourcesImplementation implements UserLocalDataSources {
  late LocalStorage storage;

  @override
  Future<void> saveUser(User user) async {
    try {
      storage.setItem('current_user', user.toJson());
    } catch (ex) {
      throw ServerException(500);
    }
  }
}
