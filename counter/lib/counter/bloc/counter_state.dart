part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  const CounterState();
}

final class CounterInitial extends CounterState {
  const CounterInitial();
}

final class CounterValue extends CounterState {
  final int value;
  const CounterValue(this.value);
}

final class CounterLoading extends CounterState {
  const CounterLoading();
}
