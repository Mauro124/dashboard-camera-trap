import 'dart:convert';

import 'package:dashboard_camera_trap/core/errors/exceptions.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSources {
  /// Save a user in localstorage.
  ///
  /// Throws a [ServerException] for all error code
  Future<void> saveUser(User user);

  // Get the user storage in localstorage.
  ///
  /// Throws a [ServerException] for all error code
  Future<User> getUser();

  // Clear the user storage in localstorage.
  ///
  /// Throws a [ServerException] for all error code
  Future<void> clearUser();
}

class UserLocalStorageDataSourcesImplementation implements UserLocalDataSources {
  Future<SharedPreferences> storage = SharedPreferences.getInstance();

  @override
  Future<void> saveUser(User user) async {
    try {
      SharedPreferences _sharedPreferences = await storage;
      _sharedPreferences.setString('current_user', json.encode(user.toJson()));
    } catch (ex) {
      throw ServerException(500);
    }
  }

  @override
  Future<User> getUser() async {
    try {
      SharedPreferences _sharedPreferences = await storage;
      String? userString = _sharedPreferences.getString('current_user');
      User user = User.fromJson(json.decode(userString!));
      return user;
    } catch (ex) {
      throw LocalStorageException(ex.toString());
    }
  }

  @override
  Future<void> clearUser() async {
    try {
      SharedPreferences _sharedPreferences = await storage;
      _sharedPreferences.clear();
      _sharedPreferences.remove('users');
    } catch (ex) {
      throw LocalStorageException(ex.toString());
    }
  }
}
