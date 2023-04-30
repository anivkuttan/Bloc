import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_transfer_bloc.dart';

class DataTransferView extends StatefulWidget {
  const DataTransferView({Key? key}) : super(key: key);

  @override
  State<DataTransferView> createState() => _DataTransferViewState();
}

class _DataTransferViewState extends State<DataTransferView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DataTransferView"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<DataTransferBloc, DataTransferBlocState>(
              builder: (context, state) {
                return Text(
                  '${state.initialData}',
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                    child: const Text("Data Increment"),
                    onPressed: () {
                      context.read<DataTransferBloc>().add(DataIncrement());
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                    child: const Text("Data Decrement"),
                    onPressed: () {
                      context.read<DataTransferBloc>().add(DataDecrement());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 150,
              height: 80,
              child: ElevatedButton(
                child: const Text("Next Page"),
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) {
                    return const DataTransferSecondPage();
                  });
                  Navigator.push(
                    context,
                    route,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataTransferSecondPage extends StatefulWidget {
  const DataTransferSecondPage({Key? key}) : super(key: key);

  @override
  State<DataTransferSecondPage> createState() => _DataTransferSecondPageState();
}

class _DataTransferSecondPageState extends State<DataTransferSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Trasfer Second Page "),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<DataTransferBloc, DataTransferBlocState>(
              builder: (context, state) {
                return Text(
                  '${state.initialData}',
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                    child: const Text("Data Increment"),
                    onPressed: () {
                      context.read<DataTransferBloc>().add(DataIncrement());
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 80,
                  child: ElevatedButton(
                    child: const Text("Data Decrement"),
                    onPressed: () {
                      context.read<DataTransferBloc>().add(DataDecrement());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 150,
              height: 80,
              child: ElevatedButton(
                child: const Text("Back to Home Page"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
