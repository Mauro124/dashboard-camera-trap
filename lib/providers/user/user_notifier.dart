import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:dashboard_camera_trap/domain/use_cases/users/get_current_user.dart';
import 'package:dashboard_camera_trap/domain/use_cases/users/save_current_user.dart';
import 'package:dashboard_camera_trap/providers/user/user_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  final SaveCurrentUser saveCurrentUser;
  final GetCurrentUser getCurrentUser;

  UserNotifier({required this.saveCurrentUser, required this.getCurrentUser}) : super(InitialUserState());

  void setInitialState() => state = InitialUserState();

  void save(User user) async {
    state = LoadingUserState();
    Either<Exception, void> response = await saveCurrentUser.call(user);
    response.fold(
      (failure) => state =
          ErrorUserState("Error al iniciar sesión. Intentelo de nuevo más tarde o contactese con el administrador."),
      (_) => state = InitialUserState(),
    );
  }

  Future<void> getUser() async {
    state = LoadingUserState();
    Either<Exception, User> response = await getCurrentUser.call();
    response.fold(
      (failure) => state =
          ErrorUserState("Error al iniciar sesión. Intentelo de nuevo más tarde o contactese con el administrador."),
      (user) => state = LoadedUserState(user),
    );
  }
}
