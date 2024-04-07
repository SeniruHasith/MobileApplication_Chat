import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../values/colors.dart';

class CameraWidget extends StatefulWidget {
  CameraWidget({required this.GetCurrentBase64});
  final Function(String) GetCurrentBase64;
  @override
  CameraWIdgetState createState() => CameraWIdgetState(GetCurrentBase64);
}

class CameraWIdgetState extends State<CameraWidget>
    with WidgetsBindingObserver {
  CameraWIdgetState( this.GetCurrentBase64);
  CameraController? _controller;
  bool _isCameraInitialized = false;
  bool isFlashOn = false;
  late List<CameraDescription> _cameras;
  bool enableFlashToggle = true;
  String base64Image = "";
  final Function(String) GetCurrentBase64;
  final picker = ImagePicker();
  int direction = 0;

  @override
  void initState() {
    initCamera(0);
    super.initState();
  }

  void initCamera(int direction) async {
    _cameras = await availableCameras();
    // Initialize the camera with the first camera in the list
    await onNewCameraSelected(_cameras[direction]);
  }

  Future<void> onNewCameraSelected(CameraDescription description) async {
    final previousCameraController = _controller;

    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      description,
      ResolutionPreset.veryHigh,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }

    // Replace with the new controller
    if (mounted) {
      setState(() {
        _controller = cameraController;
      });
    }

    /// Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    /// Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = _controller!.value.isInitialized;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  Future<XFile?> capturePhoto() async {
    final CameraController? cameraController = _controller;
    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      await cameraController.setFlashMode(FlashMode.off); //optional
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  void _onTakePhotoPressed() async {
    final xFile = await capturePhoto();
    if (xFile != null) {
      if (xFile.path.isNotEmpty) {
        final imageFile = File(xFile.path).readAsBytesSync();
        setState(() {
          base64Image = base64Encode(imageFile);
          GetCurrentBase64(base64Encode(imageFile));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isCameraInitialized) {
      return SafeArea(
          child: Scaffold(
              body: Stack(
                children: [
                  Column(children: [
                    base64Image.isEmpty
                        ? Transform.scale(
                      scale: _controller?.value.aspectRatio,
                      child: AspectRatio(
                          aspectRatio: 1, child: CameraPreview(_controller!)),
                    )
                        : SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.8,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.3,
                      child: Image.memory(
                        base64Decode(base64Image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ]),
                  if (base64Image.isEmpty) ...[
                    Positioned(
                      right: 18.0,
                      top: 25.0,
                      child: Visibility(
                        visible: enableFlashToggle,
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 1,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            // pill shape
                            color: AppColors.backgroundColorGrey,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Flash',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  value: isFlashOn,
                                  onChanged: (value) {
                                    setState(() {
                                      isFlashOn = value;
                                      _controller?.setFlashMode(
                                          FlashMode.always);
                                    });
                                  },
                                  activeColor:
                                  Colors
                                      .red, // The switch will be red when it's on
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: MediaQuery
                            .of(context)
                            .size
                            .width * 0.35,
                        top: MediaQuery
                            .of(context)
                            .size
                            .height * 0.43,
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: _captureControlRowWidget())),
                  ],
                ],
              )));
    } else {
      return const Center(
        child: Text(
          'Tap to active',
        ),
      );
    }
  }

  /// Display the control bar with buttons to take pictures and record videos.
  Widget _captureControlRowWidget() {
    final CameraController? cameraController = _controller;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.camera_alt),
          color: Colors.blue,
          onPressed: cameraController != null &&
              cameraController.value.isInitialized &&
              !cameraController.value.isRecordingVideo
              ? _onTakePhotoPressed
              : null,
        ),
        IconButton(
            icon: Icon(Icons.flip_camera_ios_outlined),
            color: Colors.blue,
            onPressed: () {
              setState(() {
                try{
                direction = direction == 0? 1 : 2;
                onNewCameraSelected(_cameras[direction]);
                } catch(e){
                  print("error"+ e.toString());
                }
              });
            }
        ),
      ],
    );
  }
}
