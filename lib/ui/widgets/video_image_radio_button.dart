import 'package:flutter/material.dart';

class VideoImageRadioButton extends StatefulWidget {
  Function isVideo;

  VideoImageRadioButton({Key? key, required this.isVideo}) : super(key: key);

  @override
  State<VideoImageRadioButton> createState() => _VideoImageRadioButtonState();
}

class _VideoImageRadioButtonState extends State<VideoImageRadioButton> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text('Image'),
            leading: Radio(
              value: 0,
              groupValue: _value,
              onChanged: (value) => {
                setState(() {
                  _value = 0;
                  widget.isVideo(false);
                })
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text('Video'),
            leading: Radio(
              value: 1,
              groupValue: _value,
              onChanged: (value) => {
                setState(() {
                  _value = 1;
                  widget.isVideo(true);
                })
              },
            ),
          ),
        ),
      ],
    );
  }
}
