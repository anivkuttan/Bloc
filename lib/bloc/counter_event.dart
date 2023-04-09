part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}
///  this is Abstract class all events based on this class
///  No need to declear any variables hear
///  because event class only use to triger the state class 

class CounterIncrementEvent extends CounterEvent {}
/// this counter event oNly Contain 2 events 
/// one is + 
/// another is -
class CounterDecrementEvent extends CounterEvent {}
