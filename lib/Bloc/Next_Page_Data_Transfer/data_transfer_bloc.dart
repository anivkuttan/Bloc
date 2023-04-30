import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_transfer_event.dart';
part 'data_transfer_state.dart';

class DataTransferBloc
    extends Bloc<DataTransferBlocEvent, DataTransferBlocState> {
  DataTransferBloc() : super(const DataTransferBlocInitial(0)) {
    on<DataIncrement>((event, emit) {
      emit(
        DataTransferBlocIncrement(incrementValue: state.initialData - 2),
      );
    });
    on<DataDecrement>((event, emit) {
      emit(
        DataTransferBlocDecrement(decrementValue: state.initialData + 2),
      );
    });
  }
}
