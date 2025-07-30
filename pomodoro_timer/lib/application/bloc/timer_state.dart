import 'package:equatable/equatable.dart';

enum TimerStats { initial, running, paused, finished }

class TimerState extends Equatable {
  final int duration;
  final TimerStats status;

  const TimerState({required this.duration, required this.status});

  factory TimerState.initial(int duration) {
    return TimerState(duration: duration, status: TimerStats.initial);
  }

  TimerState copyWith({int? duration, TimerStats? status}) {
    return TimerState(
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [duration, status];
}
