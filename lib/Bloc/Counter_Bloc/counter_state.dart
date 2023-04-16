part of 'counter_bloc.dart';


abstract class CounterState {
  /// this is CounterState Abstract class this class is responsible of any state
  /// extend by this class
  final int counter;

  /// the abstract class contains all variables

  const CounterState({required this.counter});
}

class CounterInitialState extends CounterState {
  const CounterInitialState()
      : super(
          counter: 1,
        );

  /// hear the initial state value is passing through super class
}

class CounterIncrementState extends CounterState {
  /// in this class IncrementState class need increment Value
  /// so the value getting through constructor and pass through the supper class
  final int incresedCounter;
  final String? textString;
  const CounterIncrementState({required this.incresedCounter, this.textString})
      : super(counter: incresedCounter);
}

class CounterDecrementState extends CounterState {
  ///hear the same as incrementState class
  final int decrementCounter;
  const CounterDecrementState({required this.decrementCounter})
      : super(counter: decrementCounter);
}
