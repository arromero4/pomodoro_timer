import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/application/bloc/timer_bloc.dart';
import 'package:pomodoro_timer/application/bloc/timer_state.dart';
import 'package:pomodoro_timer/presentation/widgets/control_buttons.dart';
import 'package:pomodoro_timer/presentation/widgets/progress_ring.dart';
import 'package:pomodoro_timer/presentation/widgets/timer_display.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String _getGifForSession(PomodoroSessionType type) {
      switch (type) {
        case PomodoroSessionType.work:
          return 'https://media.giphy.com/media/Vg0JstydL8HCg/giphy.gif'; // Charizard motivado
        case PomodoroSessionType.shortBreak:
          return 'https://media.giphy.com/media/l3q2K5jinAlChoCLS/giphy.gif'; // Squirtle bailando
        case PomodoroSessionType.longBreak:
          return 'https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif'; // Snorlax relajado
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
        backgroundColor:
            context.watch<TimerBloc>().state.status == TimerStats.running
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            final minutes = (state.duration ~/ 60).toString().padLeft(2, '0');
            final seconds = (state.duration % 60).toString().padLeft(2, '0');
            final double progress =
                1.0 - (state.duration / (25 * 60)); //progress calculation
            final String gifUrl = _getGifForSession(state.sessionType!);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ProgressRing(progress: progress),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimerDisplay(time: '$minutes:$seconds'),
                        const SizedBox(height: 60),
                        CachedNetworkImage(imageUrl: gifUrl, height: 100),
                      ],
                    ),
                    const SizedBox(height: 60),
                    ControlButtons(state: state),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
