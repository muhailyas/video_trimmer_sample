import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerService {
  static Future<File?> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowCompression: false,
    );
    return result != null && result.files.single.path != null
        ? File(result.files.single.path!)
        : null;
  }
}