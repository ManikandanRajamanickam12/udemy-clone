import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer(
      {Key? key, required this.videoPlayerController, required this.isloop})
      : super(key: key);

  VideoPlayerController videoPlayerController;
  bool isloop;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late ChewieController chewieController;
  @override
  void initState() {
    // TODO: implement initState

    chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        looping: widget.isloop,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400, height: 250, child: Chewie(controller: chewieController));
  }
}

class VideoDisplay extends StatelessWidget {
  VideoDisplay({Key? key, required this.videourl}) : super(key: key);
  final String videourl;

  @override
  Widget build(BuildContext context) {
    print(videourl);
    return VideoPlayer(
      videoPlayerController: VideoPlayerController.network(videourl),
      isloop: true,
    );
  }
}
