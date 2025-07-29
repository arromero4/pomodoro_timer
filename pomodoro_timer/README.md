# pomodoro_timer

🕒 Pomodoro Timer - Flutter Project
Este proyecto es una implementación de un temporizador Pomodoro utilizando Flutter. El objetivo es ayudarte a practicar y aprender los fundamentos de Flutter mediante el desarrollo de una app completa, siguiendo buenas prácticas, patrones de arquitectura limpia y explorando temas como manejo de estado, animaciones, diseño responsivo y estructuras de datos.

🚀 Tecnologías Usadas
Flutter 3.x

Dart

State Management: flutter_bloc

UI Responsiva: LayoutBuilder, MediaQuery

Animaciones: AnimatedBuilder, Tween, Lottie

Testing: flutter_test

Arquitectura Limpia: Separación por capas presentation, application, domain, infrastructure

Persistencia (opcional): shared_preferences o hive

🗂️ Estructura del Proyecto
css
Copy
Edit
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   ├── utils/
│   └── theme/
├── domain/
│   └── entities/
│       └── pomodoro_timer.dart
├── infrastructure/
│   └── repositories/
│       └── timer_repository_impl.dart
├── application/
│   └── bloc/
│       ├── timer_bloc.dart
│       ├── timer_event.dart
│       └── timer_state.dart
├── presentation/
│   ├── pages/
│   │   └── home_page.dart
│   ├── widgets/
│   │   ├── timer_display.dart
│   │   ├── progress_ring.dart
│   │   └── control_buttons.dart
│   └── animations/
│       └── session_transition.dart
🎯 Características del Proyecto
✅ Manejo de Estado
Uso de Bloc para manejar el estado del temporizador y las transiciones entre sesiones de trabajo, descanso corto y descanso largo.

Estados como: Running, Paused, Finished, Idle.

✅ Diseño Responsivo
La UI se adapta a diferentes tamaños de pantalla (smartphone, tablet).

Uso de MediaQuery y LayoutBuilder.

✅ Animaciones
Animación de círculo de progreso para representar el tiempo restante.

Animación de transición entre estados (ej. de trabajo a descanso).

Integración opcional de Lottie para animaciones visuales motivacionales.

✅ Código Limpio y Buenas Prácticas
Arquitectura limpia por capas.

Separación clara de responsabilidades.

Reutilización de componentes UI.

✅ Algoritmos y Estructuras de Datos
Implementación de una máquina de estados simple para controlar el flujo Pomodoro.

Uso de Timers de Dart y estructuras como listas para el historial de sesiones.

🧠 Lo Que Aprenderás
Cómo organizar un proyecto Flutter profesional.

Patrón Bloc para separar lógica de negocio y UI.

Crear widgets reutilizables.

Implementar animaciones básicas y avanzadas.

Hacer tu UI adaptativa y accesible.

Escribir código mantenible y escalable.

Aplicar conceptos básicos de algoritmos y estructuras como timers, ciclos de sesión, colas.

