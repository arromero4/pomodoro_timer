import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/application/bloc/timer_event.dart';
import 'package:pomodoro_timer/application/bloc/timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int _defaultDuration = 25 * 60; // 25 minutes in seconds

  Timer? _timer;

  TimerBloc() : super(TimerState.initial(_defaultDuration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<TimerTicked>(_onTicked);
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    _timer?.cancel();

    emit(state.copyWith(duration: event.duration, status: TimerStats.running));

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

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _timer?.cancel();
    emit(TimerState.initial(_defaultDuration));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    if (event.duration <= 0) {
      _timer?.cancel();
      emit(state.copyWith(duration: 0, status: TimerStats.finished));
    } else {
      emit(state.copyWith(duration: event.duration));
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
