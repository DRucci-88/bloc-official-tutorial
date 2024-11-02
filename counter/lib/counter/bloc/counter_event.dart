part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {
  final int value;
  const CounterEvent(this.value);
}

final class CounterStarted extends CounterEvent {
  const CounterStarted(super.value);
}

final class CounterIncremented extends CounterEvent {
  const CounterIncremented(super.value);
}

final class CounterDecremented extends CounterEvent {
  const CounterDecremented(super.value);
}
