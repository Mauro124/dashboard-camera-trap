import 'package:dashboard_camera_trap/domain/entities/report.dart';
import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/ui/shared/separator_widget.dart';
import 'package:dashboard_camera_trap/ui/widgets/button_load_image_video.dart';
import 'package:dashboard_camera_trap/ui/widgets/video_image_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class FormWidget extends ConsumerStatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends ConsumerState<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingControllerCameraId = TextEditingController();
  final TextEditingController _textEditingControllerStartDate = TextEditingController();
  final TextEditingController _textEditingControllerStartTime = TextEditingController();
  final TextEditingController _textEditingControllerDetectionDate = TextEditingController();
  final TextEditingController _textEditingControllerDetectionTime = TextEditingController();
  bool isVideo = false;

  @override
  void initState() {
    super.initState();
    _textEditingControllerStartDate.text = getYear();
    _textEditingControllerDetectionDate.text = getYear();
  }

  String getYear() => "/${DateTime.now().year}";

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
                _buildTextField(
                  "ID Cámara",
                  Icons.camera_alt,
                  _textEditingControllerCameraId,
                  canRequestFocus: true,
                ),
                const SeparatorWidget(vertical: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: _buildTextField(
                      "Fecha de inicio (dd/mm/yyyy)",
                      Icons.date_range,
                      _textEditingControllerStartDate,
                      textInputType: TextInputType.datetime,
                    )),
                    const SeparatorWidget(horizontal: 30),
                    Expanded(
                        child: _buildTextField(
                      "Hora de inicio",
                      Icons.timelapse,
                      _textEditingControllerStartTime,
                      textInputType: TextInputType.datetime,
                    )),
                  ],
                ),
                const SeparatorWidget(vertical: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: _buildTextField(
                      "Fecha de detección (dd/mm/yyyy)",
                      Icons.date_range,
                      _textEditingControllerDetectionDate,
                      textInputType: TextInputType.datetime,
                    )),
                    const SeparatorWidget(horizontal: 30),
                    Expanded(
                        child: _buildTextField(
                      "Hora de detección",
                      Icons.timelapse,
                      _textEditingControllerDetectionTime,
                      textInputType: TextInputType.datetime,
                    )),
                  ],
                ),
                const SeparatorWidget(vertical: 30),
                VideoImageRadioButton(
                    isVideo: (value) => setState(() {
                          isVideo = value;
                        })),
                const SeparatorWidget(vertical: 30),
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
      decoration: InputDecoration(icon: Icon(icon), labelText: hint),
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
            onPressed: () => _buttonSubmitAction(context, ref),
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

  void _buttonSubmitAction(BuildContext context, WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Report report = Report(
        id: const Uuid().v1(),
        camera: _textEditingControllerCameraId.text,
        startDate: _textEditingControllerStartDate.text,
        detectionDate: _textEditingControllerDetectionDate.text,
        detectionTime: _textEditingControllerDetectionTime.text,
        isPhoto: !isVideo,
        isVideo: isVideo,
        photo: isVideo ? "" : "photo",
        video: isVideo ? "video" : "",
      );
      ref.read(reportListProvider.notifier).add(report);
      _dismissDialog(context);
      return;
    }
  }

  void _dismissDialog(BuildContext context) => Navigator.of(context).pop();
}
