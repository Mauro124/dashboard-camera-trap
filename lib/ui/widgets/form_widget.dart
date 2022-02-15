import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/ui/widgets/button_load_image_video.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingControllerIDCamera = TextEditingController();
  final TextEditingController _textEditingControllerDescription = TextEditingController();
  bool isVideo = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              children: [
                _buildTextField("ID Cámara", Icons.camera_alt, _textEditingControllerIDCamera, canRequestFocus: true),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: _buildTextField(
                      "Fecha de inicio",
                      Icons.date_range,
                      _textEditingControllerDescription,
                      textInputType: TextInputType.datetime,
                    )),
                    const SizedBox(width: 30),
                    Expanded(
                        child: _buildTextField(
                      "Hora de inicio",
                      Icons.timelapse,
                      _textEditingControllerDescription,
                      textInputType: TextInputType.datetime,
                    )),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: _buildTextField(
                      "Fecha de detección",
                      Icons.date_range,
                      _textEditingControllerDescription,
                      textInputType: TextInputType.datetime,
                    )),
                    const SizedBox(width: 30),
                    Expanded(
                        child: _buildTextField(
                      "Hora de detección",
                      Icons.timelapse,
                      _textEditingControllerDescription,
                      textInputType: TextInputType.datetime,
                    )),
                  ],
                ),
                const SizedBox(height: 30),
                CheckboxListTile(
                  value: isVideo,
                  onChanged: (value) => {
                    setState(() {
                      isVideo = value!;
                    })
                  },
                  title: const Text("¿Es video?"),
                ),
                const SizedBox(height: 30),
                ButtonLoadImageVideo(isVideo: isVideo),
              ],
            ),
          ),
          const Divider(),
          _buildButtons(context),
        ],
      ),
    );
  }

  _buildTextField(String hint, IconData icon, TextEditingController controller,
      {TextInputType textInputType = TextInputType.name, bool canRequestFocus = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      focusNode: FocusNode(canRequestFocus: canRequestFocus),
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: hint,
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Debes completar $hint';
        }
        return null;
      },
    );
  }

  _buildButtons(BuildContext context) => Row(
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
            onPressed: () => _buttonSubmitAction(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "AGREGAR",
                style: Theme.of(context).textTheme.button!.copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      );

  void _buttonSubmitAction() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Report reportItem = Report();
      // ref.read(formProvider.notifier).add(formItem);
      return;
    }
  }
}
