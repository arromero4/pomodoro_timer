import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
    String getGifForSession(PomodoroSessionType type) {
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
            // final String gifUrl = getGifForSession(state.sessionType!);

            final sessionText = switch (state.sessionType) {
              PomodoroSessionType.work => "¡Hora de concentrarse!",
              PomodoroSessionType.shortBreak => "Descanso corto",
              PomodoroSessionType.longBreak => "Descanso largo",
              // TODO: Handle this case.
              null => throw UnimplementedError(),
            };

            return Stack(
              fit: StackFit.expand,
              children: [
                // 🧊 Capa translúcida para visibilidad

                //Contenido UI
                // 📦 Dentro del Stack final del body:
                SingleChildScrollView(
                  child: SafeArea(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 500, // opcional para pantallas grandes
                          maxHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                sessionText,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 20),
                              TimerDisplay(time: '$minutes:$seconds'),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ProgressRing(progress: progress),
                                  if (state.backgroundImageUrl != null)
                                    AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      child: Transform.scale(
                                        scale:
                                            4, // Puedes ajustar esto al gusto
                                        child: Image.network(
                                          state.backgroundImageUrl!,
                                          key: ValueKey(
                                            state.backgroundImageUrl,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  else
                                    Container(color: Colors.white),
                                ],
                              ),

                              const SizedBox(height: 32),

                              ControlButtons(state: state),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
