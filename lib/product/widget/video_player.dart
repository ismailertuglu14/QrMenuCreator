// ignore_for_file: deprecated_member_use

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'eror_widget.dart';

class CommonVideoPlayer extends StatefulWidget {
  const CommonVideoPlayer({super.key, required this.url});
  final String url;
  @override
  State<CommonVideoPlayer> createState() => _CommonVideoPlayerState();
}

class _CommonVideoPlayerState extends State<CommonVideoPlayer> {
  late final VideoPlayerController _videoController;
  late final ChewieController _chewieController;
  ChewieProgressColors get _progressColors => ChewieProgressColors(
        playedColor: Color(0xFF3AB86F),
        handleColor: Color(0xFF3AB86F),
        backgroundColor: Colors.black.withOpacity(0.5),
        bufferedColor: Colors.grey,
      );

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      //isLive: true,
      autoPlay: true,
      aspectRatio: 16 / 9,
      //showControlsOnInitialize: true,
      //autoInitialize: true,
      fullScreenByDefault: true,

      autoInitialize: true,
      allowFullScreen: true,
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],

      videoPlayerController: _videoController,
      cupertinoProgressColors: _progressColors,
      materialProgressColors: _progressColors,
      draggableProgressBar: true,
      zoomAndPan: true,
      errorBuilder: (context, errorMessage) =>
          CommonErrorWidget(error: errorMessage),
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }
}
