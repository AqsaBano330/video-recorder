import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:videorecorder/HomePage.dart';

class VideoUpload extends StatefulWidget {
  const VideoUpload({super.key});

  @override
  State<VideoUpload> createState() => _VideoUploadState();
}

class _VideoUploadState extends State<VideoUpload> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: FlutterCamera(
                color: Colors.amber,
                onImageCaptured: (value) {
                  final path = value.path;
                  print("Image path: $path");
                  if (path.contains('.jpg')) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Image.file(File(path)),
                        );
                      },
                    );
                  }
                },
                onVideoRecorded: (value) async {
                  final path = await value.path;
                  print('Video path: $path');
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>   VideoApp(path: path)),
  );
                  /// Show video preview .mp4
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                
                // Handle the action when the additional button is pressed
                
                // Add your custom logic here
              },
              child: Text("Additional Button"),
            ),
          ],
        ),
      ),
    );
  }
}
