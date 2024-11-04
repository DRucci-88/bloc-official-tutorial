import 'package:counter/counter/repository/counter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository _counterRepository;

  CounterBloc(this._counterRepository) : super(const CounterValue(0)) {
    on<CounterEvent>((_, emit) => emit(const CounterLoading()));
    on<CounterStarted>(_onStarted);
    on<CounterIncremented>(_onIncremented);
    on<CounterDecremented>(_onDecremented);
  }

  void _onStarted(
    CounterStarted event,
    Emitter emit,
  ) async {
    int value = _counterRepository.counter;

    debugPrint(value.toString());

    emit(CounterValue(event.value));

    // await Future.delayed(const Duration(seconds: 1));

    // emit(const CounterLoading());

    // await Future.delayed(const Duration(seconds: 1));
  }

  void _onIncremented(
    CounterIncremented event,
    Emitter emit,
  ) async {
    int value = _counterRepository.counter;

    debugPrint('before $value');

    value = await _counterRepository.increment(event.value);

    debugPrint('after$value');

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
    int value = _counterRepository.counter;

    debugPrint('before $value');

    value = await _counterRepository.decrement(event.value);

    debugPrint('after$value');

    emit(CounterValue(value));

    // emit(CounterLoading(state.value));
    // await Future.delayed(const Duration(seconds: 1));
    // emit(CounterValue(state.value - event.value));
    // await Future.delayed(const Duration(seconds: 1));
    // emit(CounterLoading(state.value));
    // await Future.delayed(const Duration(seconds: 1));
    // emit(CounterValue(state.value - event.value));
  }
}
