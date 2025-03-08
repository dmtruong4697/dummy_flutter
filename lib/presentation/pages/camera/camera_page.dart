import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  int _selectedCameraIndex = 0;
  double _currentZoom = 1.0;
  double _maxZoom = 1.0;
  double _minZoom = 1.0;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      _setupCamera(_selectedCameraIndex);
    }
  }

  Future<void> _setupCamera(int cameraIndex) async {
    _controller =
        CameraController(_cameras![cameraIndex], ResolutionPreset.high);
    await _controller!.initialize();
    _minZoom = await _controller!.getMinZoomLevel();
    _maxZoom = await _controller!.getMaxZoomLevel();
    if (mounted) {
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  void _switchCamera() {
    if (_cameras!.length > 1) {
      setState(() {
        _isCameraInitialized = false;
        _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
      });
      _setupCamera(_selectedCameraIndex);
    }
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      final XFile image = await _controller!.takePicture();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ảnh đã lưu tại: ${image.path}')),
      );
    }
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    double zoom = (_currentZoom * details.scale).clamp(_minZoom, _maxZoom);
    _controller!.setZoomLevel(zoom);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Camera")),
      body: _isCameraInitialized
          ? GestureDetector(
              onScaleUpdate: _handleScaleUpdate,
              child: Stack(
                children: [
                  CameraPreview(_controller!),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: FloatingActionButton(
                      onPressed: _switchCamera,
                      child: const Icon(Icons.switch_camera),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: _takePicture,
                      child: const Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
