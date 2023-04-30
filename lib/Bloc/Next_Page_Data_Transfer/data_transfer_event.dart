part of 'data_transfer_bloc.dart';

@immutable
abstract class DataTransferBlocEvent {}

class DataIncrement extends DataTransferBlocEvent{}
class DataDecrement extends DataTransferBlocEvent{}
