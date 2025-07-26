import 'dart:io';
import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../widgets/video_player.dart';

class VideoPreviewScreen extends StatelessWidget {
  final String videoPath;
  const VideoPreviewScreen({super.key, required this.videoPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.previewVideoTitle)),
      body: Center(child: VideoPlayerWidget(videoFile: File(videoPath))),
    );
  }
}
