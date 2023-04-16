import 'package:bloc_sample/cubit/Counter_Cubit/theme_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitView extends StatefulWidget {
  const CounterCubitView({Key? key}) : super(key: key);

  @override
  State<CounterCubitView> createState() => _CounterCubitViewState();
}

class _CounterCubitViewState extends State<CounterCubitView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterCubit View'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Bloc builder and Bloc Listener
          /*  BlocListener<ThemeCubit, ThemeCubitState>(
            listener: (context, state) {
              SnackBar snack = SnackBar(
                content: Text("Conter Value Changed  ${state.counterValue}"),
              );
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(snack);
            },
            child: BlocBuilder<ThemeCubit, ThemeCubitState>(
              builder: (context, state) {
                return Text(
                  "${state.counterValue}",
                  style: const TextStyle(fontSize: 29),
                );
              },
            ),
          ), */

          /// Bloc builder and Bloc Listener toGether BlocConsumer
          BlocConsumer<ThemeCubit, ThemeCubitState>(
            builder: (context, state) {
              return Text(
                "${state.counterValue}",
                style: const TextStyle(fontSize: 29),
              );
            },
            listener: (context, state) {
              SnackBar snack = SnackBar(
                content: Text("Conter Value Changed  ${state.counterValue}"),
              );
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(snack);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton.icon(
                  label: const Text("Increment"),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    context.read<ThemeCubit>().incrementCountCubit();
                  },
                ),
              ),
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton.icon(
                  label: const Text("Decrement"),
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    context.read<ThemeCubit>().decrementCountCubit();
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton.icon(
              label: const Text("Dark"),
              icon: const Icon(Icons.sunny),
              onPressed: () {
                context.read<ThemeCubit>().themeChange();
              },
            ),
          ),
        ],
      )),
    );
  }
}
