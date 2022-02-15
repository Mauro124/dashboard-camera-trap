import 'package:flutter/material.dart';

extension ShowDialogUtils on Widget {
  show(BuildContext context, [bool barrierDismissible = false]) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierDismissible ? Colors.black.withAlpha(100) : Colors.transparent,
      useRootNavigator: false,
      builder: (BuildContext context) => this,
    );
  }
}
