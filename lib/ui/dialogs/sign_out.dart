import 'package:dashboard_camera_trap/core/router/routes_name.dart';
import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/providers/user/google_auth.dart';
import 'package:dashboard_camera_trap/ui/shared/separator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignOutDialog extends ConsumerWidget {
  const SignOutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(context),
            const Divider(),
            const SeparatorWidget(vertical: 20),
            const Text("¿Está seguro que desea cerrar sesión?"),
            const SeparatorWidget(vertical: 20),
            _buildButtons(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
        "CERRAR SESIÓN",
        style: Theme.of(context).textTheme.headline5,
      );

  _buildButtons(BuildContext context, WidgetRef ref) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white), elevation: MaterialStateProperty.all(0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "CANCELAR",
                style: Theme.of(context).textTheme.button!.copyWith(fontSize: 18, color: Colors.red),
              ),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              _signOut(ref).then((value) => _goToLogin(context));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "CERRAR",
                style: Theme.of(context).textTheme.button!.copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      );

  Future<void> _signOut(WidgetRef ref) async {
    await ref.read(googleSignIn).disconnect();
    await ref.read(userProvider.notifier).clear();
  }

  void _goToLogin(BuildContext context) => Navigator.pushNamed(context, RoutesName.LOGIN_PAGE);
}
