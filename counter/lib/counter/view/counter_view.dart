import 'package:counter/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter/counter/counter.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatefulWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  void initState() {
    super.initState();
    context.read<CounterBloc>().add(const CounterStarted(9));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('$state', style: textTheme.displayMedium);
              },
            ),
          ),
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterValue) {
                  return Text('${state.value}', style: textTheme.displayMedium);
                }

                return const CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          FloatingActionButton(
            key: const Key('bloc_counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(const CounterIncremented(1));
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('bloc_counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(const CounterDecremented(1));
            },
          ),
        ],
      ),
    );
  }
}
