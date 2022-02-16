import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ButtonLoadImageVideo extends StatefulWidget {
  final bool isVideo;

  const ButtonLoadImageVideo({Key? key, required this.isVideo}) : super(key: key);

  @override
  State<ButtonLoadImageVideo> createState() => _ButtonLoadImageVideoState();
}

class _ButtonLoadImageVideoState extends State<ButtonLoadImageVideo> {
  Image? imagePicked;

  @override
  Widget build(BuildContext context) {
    return imagePicked != null ? _buildImageSelected() : _buildButton(context);
  }

  Widget _buildButton(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async => await _pickImage(),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[200]),
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Icon(
                  widget.isVideo ? Icons.video_camera_front : Icons.camera_alt,
                  size: 32,
                ),
                const SizedBox(height: 10),
                Text("SUBIR ${widget.isVideo ? 'VIDEO' : 'IMÁGEN'}", style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ),
      );

  Widget _buildImageSelected() => SizedBox(height: 150, child: imagePicked!);

  Future<void> _pickImage() async {
    Image? image = await ImagePickerWeb.getImageAsWidget();
    setState(() {
      imagePicked = image;
    });
  }
}
