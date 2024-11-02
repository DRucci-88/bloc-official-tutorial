import 'package:counter/counter/bloc/counter_bloc.dart';
import 'package:counter/counter/repository/counter_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter/counter/counter.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class CounterPage extends StatelessWidget {
  /// {@macro counter_page}
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => CounterRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) {
            return CounterBloc(context.read<CounterRepository>());
          }),
        ],
        child: const CounterView(),
      ),
    );
    // return BlocProvider(
    //   create: (_) => CounterCubit(),
    //   child: const CounterView(),
    // );
  }
}
