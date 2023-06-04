part of 'data_transfer_bloc.dart';

abstract class DataTransferBlocState {
  final dynamic initialData;

  const DataTransferBlocState(this.initialData);
}

class DataTransferBlocInitial extends DataTransferBlocState {
  final int stringData;
  const DataTransferBlocInitial(this.stringData) : super(stringData);
}

class DataTransferBlocIncrement extends DataTransferBlocState {
  int incrementValue;

  DataTransferBlocIncrement({required this.incrementValue})
      : super(incrementValue);
}

class DataTransferBlocDecrement extends DataTransferBlocState {
  int decrementValue;

  DataTransferBlocDecrement({required this.decrementValue})
      : super(decrementValue);
}
