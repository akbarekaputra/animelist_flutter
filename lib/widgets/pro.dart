import 'package:flutter/material.dart';

class VideoProgress extends StatelessWidget {
  final double progress; // Progress value between 0.0 and 1.0

  const VideoProgress({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.grey[300], // Background color of the progress bar
      valueColor: AlwaysStoppedAnimation<Color>(
          Colors.blue), // Color of the progress bar
    );
  }
}
