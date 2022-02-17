import 'package:dartz/dartz.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:dashboard_camera_trap/domain/use_cases/users/save_current_user.dart';
import 'package:dashboard_camera_trap/providers/user/user_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  final SaveCurrentUser saveCurrentUser;

  UserNotifier({required this.saveCurrentUser}) : super(InitialUserState());

  void setInitialState() => state = InitialUserState();

  Future<void> save(User user) async {
    state = LoadingUserState();
    Either<Exception, void> response = await saveCurrentUser.call(user);
    response.fold(
      (failure) => state =
          ErrorUserState("Error al iniciar sesión. Intentelo de nuevo más tarde o contactese con el administrador."),
      (_) => state = InitialUserState(),
    );
  }
}
