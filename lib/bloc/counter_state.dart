part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  /// this is CounterState Abstract class this class is responsible of any state 
  /// extend by this class 
  final int counter;
  /// the abstract class contains all variables 
  
  const CounterState(this.counter);
}

class CounterInitialState extends CounterState {
  const CounterInitialState() : super(1);
  /// hear the initial state value is passing through super class 
}

class CounterIncrementState extends CounterState {
  /// in this class IncrementState class need increment Value
  /// so the value getting through constructor and pass through the supper class
  final int incresedCounter;
  const CounterIncrementState(this.incresedCounter) : super(incresedCounter);
}

class CounterDecrementState extends CounterState {
///hear the same as incrementState class
  final int decrementCounter;
  const CounterDecrementState(this.decrementCounter) : super(decrementCounter);
}
