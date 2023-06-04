part of 'data_transfer_bloc.dart';

abstract class DataTransferBlocEvent {}

class DataIncrement extends DataTransferBlocEvent{}
class DataDecrement extends DataTransferBlocEvent{}
