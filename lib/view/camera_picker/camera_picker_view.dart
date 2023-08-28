import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CameraPickerView extends StatefulWidget {
  static const routeName = '/camera-picker-screen';

  const CameraPickerView({
    Key? key,
  }) : super(key: key);

  @override
  _CameraPickerViewState createState() => _CameraPickerViewState();
}

class _CameraPickerViewState extends State<CameraPickerView> {
  final photos = <File>[];

  void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    photos.add(file);
                    Navigator.pop(context);
                    setState(() {});
                  },
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraCamera(
        onFile: (file) => print(file),
        mode: CameraMode.ratioFull,
        resolutionPreset: ResolutionPreset.high,
      ),
    );
  }
}
