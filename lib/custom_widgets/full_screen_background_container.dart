import 'package:flutter/material.dart';

class FullScreenBackgroundContainer extends StatefulWidget {
  final String? backgroundImage;
  final String? backgroundVideo;
  final Widget child;
  final double? height;
  final double opacity;

  FullScreenBackgroundContainer(
      {Key? key,
      this.backgroundImage,
      this.backgroundVideo,
      required this.child,
      this.height,
      this.opacity = 1})
      : super(key: key) {
    assert(backgroundImage != null || backgroundVideo != null,
        "Either backgroundImage or backgroundVideo must not be null");
  }

  @override
  State<FullScreenBackgroundContainer> createState() => _FullScreenBackgroundContainerState();
}

class _FullScreenBackgroundContainerState extends State<FullScreenBackgroundContainer> {
  // final _sizeConfig = SizeConfig();
  // VideoPlayerController? _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.backgroundVideo != null) {
  //     _controller = VideoPlayerController.asset(widget.backgroundVideo!)
  //       ..initialize().then((_) {
  //         _controller?.play();
  //         _controller?.setLooping(false);
  //         // Ensure the first frame is shown after the video is initialized
  //         setState(() {});
  //       });
  //   }
  // }

  // @override
  // void dispose() {
  //   if (_controller != null && _controller!.value.isInitialized) {
  //     _controller?.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: widget.backgroundImage != null
          ? BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.backgroundImage!),
                  fit: BoxFit.cover,
                  opacity: widget.opacity))
          : null,
      child: Stack(
        children: [
          // if (widget.backgroundVideo != null &&
          //     _controller != null &&
          //     _controller!.value.isInitialized)
          //   SizedBox.expand(
          //     child: FittedBox(
          //       fit: BoxFit.cover,
          //       child: Container(
          //         height: widget.height ?? _sizeConfig.screenHeight,
          //         width: _sizeConfig.screenWidth,
          //         child: VideoPlayer(_controller!),
          //       ),
          //     ),
          //   ),
          widget.child
        ],
      ),
    );
  }
}
