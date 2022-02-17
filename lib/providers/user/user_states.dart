import 'package:dashboard_camera_trap/domain/entities/user.dart';

abstract class UserState {}

class InitialUserState implements UserState {}

class LoadingUserState implements UserState {}

class LoadedUserState implements UserState {
  final User user;

  LoadedUserState(this.user);
}

class EmptyUser implements UserState {}

class ErrorUserState implements UserState {
  final String message;

  ErrorUserState(this.message);
}
