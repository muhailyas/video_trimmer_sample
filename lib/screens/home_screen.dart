import 'dart:io';
import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../services/file_picker_service.dart';
import '../utils/snackbar_utils.dart';
import 'trimmer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle)),
      body: Center(
        child: ElevatedButton(
          child: const Text(AppStrings.pickVideoButton),
          onPressed: () async {
            final File? videoFile = await FilePickerService.pickVideo();
            if (videoFile != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TrimmerScreen(videoFile: videoFile),
                ),
              );
            } else {
              SnackbarUtils.showSnackBar(context, AppStrings.noVideoSelected);
            }
          },
        ),
      ),
    );
  }
}