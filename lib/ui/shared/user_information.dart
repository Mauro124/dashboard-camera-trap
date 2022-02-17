import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/providers/user/user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';

class UserInformation extends ConsumerWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserState state = ref.watch(userProvider);

    if (state is LoadedUserState) {
      User user = state.user;

      return GestureDetector(
        onTap: () => {}, //TODO: logout
        child: ListTile(
          leading: ClipOval(
              child: Image.network(
            user.photo!,
            fit: BoxFit.cover,
          )),
          title: Text(user.name!),
          subtitle: Text(
            user.email!,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
          ),
        ),
      );
    }

    return const Center(child: CircularProgressIndicator());
  }
}
