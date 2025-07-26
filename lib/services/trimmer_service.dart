import 'package:video_trimmer/video_trimmer.dart';
import 'dart:io';

class TrimmerService {
  final Trimmer _trimmer = Trimmer();
  double _startValue = 0.0;
  double _endValue = 0.0;

  Trimmer get trimmer => _trimmer;

  void updateStartValue(double value) => _startValue = value;
  void updateEndValue(double value) => _endValue = value;

  Future<void> loadVideo(File videoFile) async {
    await _trimmer.loadVideo(videoFile: videoFile);
  }

  Future<void> saveTrimmedVideo({required Function(String?) onSave}) async {
    await _trimmer.saveTrimmedVideo(
      startValue: _startValue,
      endValue: _endValue,
      storageDir: StorageDir.temporaryDirectory,
      onSave: onSave,
    );
  }

  Future<bool> videoPlaybackControl() async {
    return await _trimmer.videoPlaybackControl(
      startValue: _startValue,
      endValue: _endValue,
    );
  }

  void dispose() {
    _trimmer.dispose();
  }
}