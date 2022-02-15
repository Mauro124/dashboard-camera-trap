import 'package:flutter/material.dart';

class ButtonLoadImageVideo extends StatelessWidget {
  final bool isVideo;

  const ButtonLoadImageVideo({Key? key, required this.isVideo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[100]),
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Icon(
                  isVideo ? Icons.video_camera_front : Icons.camera_alt,
                  size: 32,
                ),
                const SizedBox(height: 10),
                Text("SUBIR ${isVideo ? 'VIDEO' : 'IMÁGEN'}", style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ),
      );
}
