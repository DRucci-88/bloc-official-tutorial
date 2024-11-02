import 'package:counter/counter/repository/counter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository _counterRepository;

  CounterBloc(this._counterRepository) : super(const CounterValue(0)) {
    on<CounterEvent>((_, emit) => emit(CounterLoading(state.value)));
    on<CounterStarted>(_onStarted);
    on<CounterIncremented>(_onIncremented);
    on<CounterDecremented>(_onDecremented);
  }

  void _onStarted(
    CounterStarted event,
    Emitter emit,
  ) async {
    debugPrint(state.value.toString());

    await Future.delayed(const Duration(seconds: 1));

    emit(CounterLoading(state.value));

    await Future.delayed(const Duration(seconds: 1));

    emit(CounterValue(event.value));
  }

  void _onIncremented(
    CounterIncremented event,
    Emitter emit,
  ) async {
    debugPrint(state.value.toString());

    final int value = await _counterRepository.increment(event.value);

    emit(CounterValue(value));

    // emit(CounterLoading(state.value));

    // await Future.delayed(const Duration(seconds: 1));

    // emit(CounterLoading(state.value));

    // await Future.delayed(const Duration(seconds: 1));

    // emit(CounterValue(state.value + event.value));

    // await Future.delayed(const Duration(seconds: 1));

    // emit(CounterLoading(state.value));

    // await Future.delayed(const Duration(seconds: 1));

    // emit(CounterValue(state.value + event.value));
  }

  void _onDecremented(
    CounterDecremented event,
    Emitter emit,
  ) async {
    // emit(CounterLoading(state.value));
    await Future.delayed(const Duration(seconds: 1));
    emit(CounterValue(state.value - event.value));
    await Future.delayed(const Duration(seconds: 1));
    emit(CounterLoading(state.value));
    await Future.delayed(const Duration(seconds: 1));
    emit(CounterValue(state.value - event.value));
  }
}
