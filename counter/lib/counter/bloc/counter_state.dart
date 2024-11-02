part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int value;
  const CounterState(this.value);
}

final class CounterInitial extends CounterState {
  const CounterInitial(super.value);
}

final class CounterValue extends CounterState {
  const CounterValue(super.value);
}

final class CounterLoading extends CounterState {
  const CounterLoading(super.value);
}
