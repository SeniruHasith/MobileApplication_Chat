
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Project Centenary
/// Created by Praneeth on 2023-11-28 12:09
class VideoPlayerWidget extends StatefulWidget {
  final String? VideoFile;

  VideoPlayerWidget({
    this.VideoFile,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    try {
      _controller = VideoPlayerController.asset('assets/video/intro6.mp4')
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          _controller.setLooping(true);
          _controller.setVolume(0);
          _controller.play();
          setState(() {});
        });
    } on Exception catch (_) {
      print('never reached');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: 405,
          height: 720,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
