import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterBlocView extends StatefulWidget {
  const CounterBlocView({super.key});

  @override
  State<CounterBlocView> createState() => _CounterBlocViewState();
}

class _CounterBlocViewState extends State<CounterBlocView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc Sample App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      state.counter.toString(),
                    ),
                    Text(
                      state.counter.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context
                  .read<CounterBloc>()
                  .add(CounterIncrementEvent("Anikuttan From Button"));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              /// hear when the Decrement Button Clicked our Counter Value Decrease by 1
              /// so whenEver the button Clicked we notifying  (context.read.add)
              /// the Decrement Event in Called.it treger The Bloc to emit the Decrement State
              context.read<CounterBloc>().add(CounterDecrementEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
