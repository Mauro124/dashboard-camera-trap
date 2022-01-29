import 'package:flutter/material.dart';

class PageSizeNotAllow extends StatelessWidget {
  const PageSizeNotAllow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            child: Image.asset("images/page_not_allow.png"),
            height: 300,
          ),
        ),
        const Text(
          "Este tamaño de dispositivo no se encuentra disponible.",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
