part of 'timer_bloc.dart';

/// Our TimerBloc state can be one of the following:
///
/// ```md
/// TimerInitial: ready to start counting down from the specified duration.
/// TimerRunInProgress: actively counting down from the specified duration.
/// TimerRunPause: paused at some remaining duration.
/// TimerRunComplete: completed with a remaining duration of 0.
/// ```
///
/// Each of these states will have an implication on the user interface and actions that the user can perform. For example:
///
/// ```md
/// if the state is TimerInitial the user will be able to start the timer.
/// if the state is TimerRunInProgress the user will be able to pause and reset the timer as well as see the remaining duration.
/// if the state is TimerRunPause the user will be able to resume the timer and reset the timer.
/// if the state is TimerRunComplete the user will be able to reset the timer.
/// ```

sealed class TimerState extends Equatable {
  const TimerState(this.duration);

  final int duration;

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
