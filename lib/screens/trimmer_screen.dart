import 'dart:io';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../services/trimmer_service.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/video_trimmer.dart';
import 'video_preview_screen.dart';

class TrimmerScreen extends StatefulWidget {
  final File videoFile;
  const TrimmerScreen({super.key, required this.videoFile});

  @override
  TrimmerScreenState createState() => TrimmerScreenState();
}

class TrimmerScreenState extends State<TrimmerScreen> {
  final TrimmerService _trimmerService = TrimmerService();
  bool _progressVisibility = false;

  @override
  void initState() {
    super.initState();
    _trimmerService.loadVideo(widget.videoFile).then((_) => setState(() {}));
  }

  Future<void> _saveVideo() async {
    setState(() => _progressVisibility = true);
    await _trimmerService.saveTrimmedVideo(
      onSave: (String? outputPath) {
        setState(() => _progressVisibility = false);
        if (outputPath != null) {
          SnackbarUtils.showSnackBar(
            context,
            '${AppStrings.videoSaved} $outputPath',
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => VideoPreviewScreen(videoPath: outputPath),
            ),
          );
        } else {
          SnackbarUtils.showSnackBar(context, AppStrings.failedToSaveVideo);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.trimVideoTitle)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: AppColors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_progressVisibility)
                const LinearProgressIndicator(backgroundColor: AppColors.red),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _progressVisibility ? null : _saveVideo,
                child: const Text(AppStrings.saveTrimmedVideo),
              ),
              Expanded(
                child: VideoTrimmerWidget(trimmerService: _trimmerService),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _trimmerService.dispose();
    super.dispose();
  }
}
