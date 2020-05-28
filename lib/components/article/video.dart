import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ACVideo extends StatefulWidget {
  ACVideo({
    this.url,
    this.margin,
  });

  final String url;
  final EdgeInsetsGeometry margin;

  @override
  _ACVideoState createState() => _ACVideoState();
}

class _ACVideoState extends State<ACVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: _controller.value.initialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }
}
