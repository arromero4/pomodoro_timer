import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/application/bloc/timer_bloc.dart';
import 'package:pomodoro_timer/presentation/pages/home_page.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(),
      child: MaterialApp(
        title: 'Pomodoro Timer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            primary: Colors.blueAccent,
            secondary: Colors.blue[300]!,
          ),

          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
