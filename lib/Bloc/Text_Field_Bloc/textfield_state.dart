part of 'textfield_bloc.dart';

abstract class TextfieldState {}

class TextfieldInitial extends TextfieldState {
  final User? user;
  TextfieldInitial({this.user});
}

class TextfieldTypeingState extends TextfieldState {
  String name;
  TextfieldTypeingState({required this.name});

  TextfieldTypeingState copyWith({required String argName}) {
    return TextfieldTypeingState(name: argName);
  }
}

class TextfieldCompletedState extends TextfieldState {}

class TextfieldClearedState extends TextfieldState {}
