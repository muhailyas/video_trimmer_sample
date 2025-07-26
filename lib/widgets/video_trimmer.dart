import 'package:flutter/material.dart';
import 'package:video_trimmer/video_trimmer.dart';

import '../constants/app_colors.dart';
import '../services/trimmer_service.dart';

class VideoTrimmerWidget extends StatefulWidget {
  final TrimmerService trimmerService;
  const VideoTrimmerWidget({super.key, required this.trimmerService});

  @override
  VideoTrimmerWidgetState createState() => VideoTrimmerWidgetState();
}

class VideoTrimmerWidgetState extends State<VideoTrimmerWidget> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: VideoViewer(trimmer: widget.trimmerService.trimmer)),
        TrimViewer(
          trimmer: widget.trimmerService.trimmer,
          viewerHeight: 50.0,
          viewerWidth: MediaQuery.of(context).size.width,
          maxVideoLength: const Duration(seconds: 30),
          onChangeStart:
              (value) => widget.trimmerService.updateStartValue(value),
          onChangeEnd: (value) => widget.trimmerService.updateEndValue(value),
          onChangePlaybackState: (value) => setState(() => _isPlaying = value),
        ),
        ElevatedButton(
          onPressed: () async {
            bool playbackState =
                await widget.trimmerService.videoPlaybackControl();
            setState(() => _isPlaying = playbackState);
          },
          child: Icon(
            _isPlaying ? Icons.pause : Icons.play_arrow,
            size: 40.0,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
