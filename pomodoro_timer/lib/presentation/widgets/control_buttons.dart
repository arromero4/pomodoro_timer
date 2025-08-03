import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/application/bloc/timer_bloc.dart';
import 'package:pomodoro_timer/application/bloc/timer_event.dart';
import 'package:pomodoro_timer/application/bloc/timer_state.dart';

class ControlButtons extends StatelessWidget {
  final TimerState state;
  const ControlButtons({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final timerBloc = context.read<TimerBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.status == TimerStats.initial ||
            state.status == TimerStats.finished)
          ElevatedButton.icon(
            onPressed: () =>
                timerBloc.add(TimerStarted(duration: state.duration)),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start'),

            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
          ),
        if (state.status == TimerStats.running)
          ElevatedButton.icon(
            onPressed: () => timerBloc.add(TimerPaused()),
            icon: const Icon(Icons.pause),
            label: const Text('Pause'),
          ),
        if (state.status == TimerStats.paused)
          ElevatedButton.icon(
            onPressed: () => timerBloc.add(TimerResumed()),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Resume'),
          ),
        const SizedBox(width: 10),
        if (state.status != TimerStats.initial)
          ElevatedButton.icon(
            onPressed: () => timerBloc.add(TimerReset()),
            icon: const Icon(Icons.replay),
            label: const Text('Reset'),
          ),
      ],
    );
  }
}
