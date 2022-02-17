import 'dart:typed_data';

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
  Uint8List? videoPicked;
  bool selectingVideo = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: widget.isVideo ? _buildVideoButton(context) : _buildImageButton(context),
    );
  }

  Widget _buildVideoButton(BuildContext context) => !selectingVideo
      ? GestureDetector(
          onTap: () async => await _pickVideo(),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[200]),
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                const Icon(Icons.video_camera_back, size: 32),
                const SizedBox(height: 10),
                Text("SUBIR VIDEO", style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        )
      : FutureBuilder(
          future: ImagePickerWeb.getVideoAsBytes(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text("Cargando video..."));
            }

            videoPicked = snapshot.data as Uint8List;
            selectingVideo = false;


            return Container(
              height: 150,
              width: 100,
              color: Colors.green,
            );
          }),
        );

  Widget _buildImageButton(BuildContext context) {
    return imagePicked == null
        ? GestureDetector(
            onTap: () async => await _pickImage(),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  const Icon(Icons.camera_alt, size: 32),
                  const SizedBox(height: 10),
                  Text("SUBIR IMÁGEN", style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          )
        : _buildImageSelected();
  }

  Widget _buildImageSelected() => SizedBox(height: 150, child: imagePicked!);

  Future<void> _pickVideo() async {
    setState(() {
      selectingVideo = true;
    });
  }

  Future<void> _pickImage() async {
    Image? image = await ImagePickerWeb.getImageAsWidget();
    setState(() {
      imagePicked = image;
    });
  }
}
