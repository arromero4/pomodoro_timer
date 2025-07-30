# 🕒 Pomodoro Timer - Flutter Project

Este proyecto es una implementación de un temporizador Pomodoro utilizando Flutter. El objetivo es ayudarte a practicar y aprender los fundamentos de Flutter mediante el desarrollo de una app completa, siguiendo buenas prácticas, patrones de arquitectura limpia y explorando temas como manejo de estado, animaciones, diseño responsivo y estructuras de datos.

---

## 🚀 Tecnologías Usadas

- **Flutter** 3.x  
- **Dart**  
- **Manejo de estado:** `flutter_bloc`  
- **UI Responsiva:** `LayoutBuilder`, `MediaQuery`  
- **Animaciones:** `AnimatedBuilder`, `Tween`, `Lottie`  
- **Testing:** `flutter_test`  
- **Arquitectura Limpia:** Separación por capas `presentation`, `application`, `domain`, `infrastructure`  
- **Persistencia (opcional):** `shared_preferences` o `hive`  

---

## 🗂️ Estructura del Proyecto

lib/
├── main.dart
├── app.dart
├── core/
│ ├── constants/
│ ├── utils/
│ └── theme/
├── domain/
│ └── entities/
│ └── pomodoro_timer.dart
├── infrastructure/
│ └── repositories/
│ └── timer_repository_impl.dart
├── application/
│ └── bloc/
│ ├── timer_bloc.dart
│ ├── timer_event.dart
│ └── timer_state.dart
├── presentation/
│ ├── pages/
│ │ └── home_page.dart
│ ├── widgets/
│ │ ├── timer_display.dart
│ │ ├── progress_ring.dart
│ │ └── control_buttons.dart
│ └── animations/
│ └── session_transition.dart



---

## 🎯 Características del Proyecto

### ✅ Manejo de Estado

- Uso de Bloc para manejar el estado del temporizador y las transiciones entre:
  - Sesiones de trabajo
  - Descanso corto
  - Descanso largo
- Estados definidos: `Idle`, `Running`, `Paused`, `Finished`

### ✅ Diseño Responsivo

- UI adaptativa a diferentes tamaños de pantalla (smartphones, tablets)
- Uso de `MediaQuery` y `LayoutBuilder` para disposición dinámica

### ✅ Animaciones

- Círculo de progreso animado para representar el tiempo restante
- Transiciones animadas entre estados (por ejemplo, de trabajo a descanso)
- Integración opcional de animaciones `Lottie` para mejorar la experiencia del usuario

### ✅ Código Limpio y Buenas Prácticas

- Arquitectura limpia dividida por capas
- Separación clara de responsabilidades
- Reutilización de componentes UI

### ✅ Algoritmos y Estructuras de Datos

- Máquina de estados simple para controlar el flujo del temporizador
- Uso de `Timer` de Dart
- Historial de sesiones mediante listas o colas

---

## 🧠 Lo Que Aprenderás

- Cómo organizar un proyecto Flutter de forma profesional
- Aplicación del patrón Bloc para separar la lógica de negocio de la UI
- Crear widgets reutilizables
- Implementar animaciones básicas y avanzadas
- Diseñar interfaces adaptativas y accesibles
- Escribir código mantenible y escalable
- Aplicar conceptos clave de algoritmos y estructuras de datos (timers, ciclos, listas, colas)

---

¡Este proyecto es ideal para llevar tus habilidades Flutter al siguiente nivel mientras construyes algo útil y funcional! 🚀
