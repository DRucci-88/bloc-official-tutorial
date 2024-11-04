part of 'timer_bloc.dart';

/// Our TimerBloc will need to know how to process the following events:
///
/// ```md
/// TimerStarted: informs the TimerBloc that the timer should be started.
/// TimerPaused: informs the TimerBloc that the timer should be paused.
/// TimerResumed: informs the TimerBloc that the timer should be resumed.
/// TimerReset: informs the TimerBloc that the timer should be reset to the original state.
/// _TimerTicked: informs the TimerBloc that a tick has occurred and that it needs to update its state accordingly.
/// ```

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted({required this.duration});
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

///  TODO nanti di coba pake final class
class TimerReset extends TimerEvent {
  const TimerReset();
}

///  TODO nanti di coba pake final class
class _TimerTicked extends TimerEvent {
  final int duration;

  const _TimerTicked({required this.duration});
}
