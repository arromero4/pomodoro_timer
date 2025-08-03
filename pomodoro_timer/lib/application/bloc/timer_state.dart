import 'package:equatable/equatable.dart';

enum PomodoroSessionType { work, shortBreak, longBreak }

enum TimerStats { initial, running, paused, finished }

class TimerState extends Equatable {
  final int duration;
  final TimerStats status;
  final PomodoroSessionType? sessionType;
  final int? completedPomodoros;
  final String? backgroundImageUrl;

  const TimerState({
    required this.duration,
    required this.status,
    this.sessionType,
    this.completedPomodoros,
    this.backgroundImageUrl,
  });

  factory TimerState.initial() {
    return const TimerState(
      duration: 25 * 60,
      status: TimerStats.initial,
      sessionType: PomodoroSessionType.work,
      completedPomodoros: 0,
    );
  }

  TimerState copyWith({
    int? duration,
    TimerStats? status,
    PomodoroSessionType? sessionType,
    int? completedPomodoros,
    String? backgroundImageUrl,
  }) {
    return TimerState(
      duration: duration ?? this.duration,
      status: status ?? this.status,
      sessionType: sessionType ?? this.sessionType,
      completedPomodoros: completedPomodoros ?? this.completedPomodoros,
      backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
    );
  }

  @override
  List<Object?> get props => [
    duration,
    status,
    sessionType,
    completedPomodoros,
  ];
}
