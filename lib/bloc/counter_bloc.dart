import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /// this is Bloc class this class Extends our Event and State classes

  CounterBloc() : super(const CounterInitialState()) {
    /// pass the Initial State class in to super class

    /// in constructor Body On medthod Will call Based On Event
    /// and The funcinality are preformed hear
    on<CounterIncrementEvent>((event, emit) {
      /// emit the State (emit notifys the Buiders)
      emit(CounterIncrementState(state.counter + 1));
    });

    on<CounterDecrementEvent>((event, emit) => decrementFunction(event, emit));
  }

  void decrementFunction(
      CounterDecrementEvent event, Emitter<CounterState> emit) {
    emit(CounterDecrementState(state.counter - 1));
  }
}
