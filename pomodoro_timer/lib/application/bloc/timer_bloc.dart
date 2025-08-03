import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/application/bloc/timer_event.dart';
import 'package:pomodoro_timer/application/bloc/timer_state.dart';
import 'package:pomodoro_timer/infrastructure/services/pokemon_service.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int _defaultDuration = 25 * 60; // 25 minutes in seconds
  final pokemonService =
      PokemonService(); // Assuming you have a service to fetch Pokémon data

  Timer? _timer;

  TimerBloc() : super(TimerState.initial()) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<TimerTicked>(_onTicked);
  }

  Future<void> _onStarted(TimerStarted event, Emitter<TimerState> emit) async {
    _timer?.cancel();
    final imageUrl = await pokemonService.getRandomPokemonImageUrl();

    emit(
      state.copyWith(
        duration: event.duration,
        status: TimerStats.running,
        backgroundImageUrl: imageUrl,
      ),
    );

    _timer = _startTicker(event.duration);
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    _timer?.cancel();
    emit(state.copyWith(status: TimerStats.paused));
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    _timer = _startTicker(state.duration);
    emit(state.copyWith(status: TimerStats.running));
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) async {
    _timer?.cancel();
    final imageUrl = await pokemonService.getRandomPokemonImageUrl();
    emit(TimerState.initial().copyWith(backgroundImageUrl: imageUrl));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    if (event.duration > 0) {
      emit(state.copyWith(duration: event.duration));
    } else {
      _timer?.cancel();

      //Calculate next session
      final isWork = state.sessionType == PomodoroSessionType.work;
      final completed = isWork
          ? state.completedPomodoros! + 1
          : state.completedPomodoros;

      final nextSessionType = isWork
          ? (completed! % 4 == 0
                ? PomodoroSessionType.longBreak
                : PomodoroSessionType.shortBreak)
          : PomodoroSessionType.work;

      final nextDuration = nextSessionType == PomodoroSessionType.work
          ? _defaultDuration
          : (nextSessionType == PomodoroSessionType.shortBreak
                ? 5 * 60
                : 15 * 60);

      emit(
        state.copyWith(
          status: TimerStats.finished,
          completedPomodoros: completed,
          sessionType: nextSessionType,
          duration: nextDuration,
        ),
      );
    }
  }

  Timer _startTicker(int duration) {
    return Timer.periodic(const Duration(seconds: 1), (timer) {
      add(TimerTicked(duration: duration - timer.tick));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
