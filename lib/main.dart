import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:videorecorder/HomePage.dart';
import 'package:videorecorder/videoupload.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoUpload(),
    );
  }
}

// class CameraApp extends StatefulWidget {
//   final List<CameraDescription> cameras;

//   const CameraApp({Key? key, required this.cameras}) : super(key: key);

//   @override
//   _CameraAppState createState() => _CameraAppState();
// }

// class _CameraAppState extends State<CameraApp> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//   late String _videoPath;
//   late VideoPlayerController _videoPlayerController;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
//     _initializeControllerFuture = _controller.initialize();
//     _videoPlayerController = VideoPlayerController.asset(''); // Empty asset path for now
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   Future<void> _startRecording() async {
//     await _initializeControllerFuture;

//     try {
//       await _controller.startVideoRecording();
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> _stopRecording() async {
//     try {
//       XFile videoFile = await _controller.stopVideoRecording();
//       print('Video recorded at: ${videoFile.path}');

//       // Set the video player controller to the recorded video file
//       _videoPlayerController = VideoPlayerController.file(File(videoFile.path));
//       await _videoPlayerController.initialize();
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _playVideo() {
//     _videoPlayerController.play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Recorder'),
//       ),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: CameraPreview(_controller),
//                 ),
//                 ElevatedButton(
//                   onPressed: _playVideo,
//                   child: Text('Play Video'),
//                 ),
//               ],
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (!_controller.value.isRecordingVideo) {
//             _startRecording();
//           } else {
//             _stopRecording();
//           }
//         },
//         child: Icon(
//           _controller.value.isRecordingVideo ? Icons.stop : Icons.fiber_manual_record,
//         ),
//       ),
//       //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
