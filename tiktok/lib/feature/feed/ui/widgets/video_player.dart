import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.videoUrl)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) {
        controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: VideoPlayer(controller),
    );
  }
}
