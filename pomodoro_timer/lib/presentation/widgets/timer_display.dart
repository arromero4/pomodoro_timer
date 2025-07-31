import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimerDisplay extends StatelessWidget {
  final String time;
  const TimerDisplay({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
