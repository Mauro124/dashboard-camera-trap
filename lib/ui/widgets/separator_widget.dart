import 'package:flutter/cupertino.dart';

/// Create separations between widgets.
/// Separation can be vertical or horizontal.
class SeparatorWidget extends StatelessWidget {
  final double? vertical;
  final double? horizontal;

  const SeparatorWidget({Key? key, this.vertical, this.horizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return vertical == null
        ? SizedBox(width: horizontal)
        : horizontal == null
            ? SizedBox(height: vertical)
            : const SizedBox(height: 0, width: 0);
  }
}
