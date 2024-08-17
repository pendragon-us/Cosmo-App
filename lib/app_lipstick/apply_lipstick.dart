import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'dashed_border.dart';
import 'display_image_screen.dart';

class ApplyLipstick extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ApplyLipstick({
    Key? key,
    required this.cameras,
  }) : super(key: key);

  @override
  State<ApplyLipstick> createState() => _ApplyLipstickState();
}

class _ApplyLipstickState extends State<ApplyLipstick> {
  late CameraController controller;
  bool isCameraInitialized = false;
  bool isSwitchingCamera = false; // Indicates if the camera is being switched
  final ImagePicker _picker = ImagePicker();
  int selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera(selectedCameraIndex);
  }

  Future<void> _initializeCamera(int cameraIndex) async {
    setState(() {
      isCameraInitialized = false;
      isSwitchingCamera = true;
    });

    try {
      controller = CameraController(widget.cameras[cameraIndex], ResolutionPreset.max);
      await controller.initialize();
      if (!mounted) return;

      setState(() {
        isCameraInitialized = true;
        isSwitchingCamera = false;
      });
    } on CameraException catch (e) {
      _handleCameraException(e);
      setState(() {
        isSwitchingCamera = false;
      });
    }
  }

  void _handleCameraException(CameraException e) {
    if (e.code == 'CameraAccessDenied') {
      print('Camera access denied.');
    } else {
      print('Camera error: ${e.description}');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _pickImageFromGallery() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayImageScreen(imagePath: pickedFile.path),
          ),
        );
      }
    } else {
      print("Storage permission denied");
    }
  }

  Future<void> _capturePhoto() async {
    try {
      final XFile file = await controller.takePicture();
      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayImageScreen(imagePath: file.path),
        ),
      );
    } catch (e) {
      print('Error capturing photo: $e');
    }
  }

  Future<void> _switchCamera() async {
    if (widget.cameras.length > 1) {
      setState(() {
        isCameraInitialized = false;
        isSwitchingCamera = true;
      });
      selectedCameraIndex = (selectedCameraIndex + 1) % widget.cameras.length;

      await controller.dispose();
      _initializeCamera(selectedCameraIndex);
    } else {
      print("No secondary camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (isCameraInitialized)
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(controller),
              )
            else if (isSwitchingCamera)
              const Center(child: CircularProgressIndicator())
            else
              const Center(child: CircularProgressIndicator()),

            Center(
              child: DashedBorder(
                borderRadius: BorderRadius.circular(150),
                borderColor: Colors.white,
                borderWidth: 4,
                dashLength: 20,
                dashSpacing: 10,
                width: 300,
                height: 300,
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 30, top: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        Column(
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [Color(0xffDCA47C), Color(0xff765843)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: const Text(
                                'LipLook',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Text(
                              'Discover the ideal shade for you!',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.notifications,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Align your face in the oval above',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: _pickImageFromGallery, // Open gallery
                          icon: const Icon(
                            Icons.image_outlined,
                            color: Colors.white,
                          ),
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: _capturePhoto, // Capture photo
                          icon: const Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                          iconSize: 80,
                        ),
                        IconButton(
                          onPressed: _switchCamera, // Switch camera
                          icon: const Icon(
                            Icons.cameraswitch_outlined,
                            color: Colors.white,
                          ),
                          iconSize: 50,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
