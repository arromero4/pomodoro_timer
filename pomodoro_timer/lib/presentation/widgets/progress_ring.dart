import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressRing extends StatelessWidget {
  final double progress; // Progress value between 0.0 and 1.0
  const ProgressRing({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 400,
            height: 400,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
