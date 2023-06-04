import 'package:bloc/bloc.dart';

import '../../Models/user.dart';

part 'textfield_event.dart';
part 'textfield_state.dart';

class TextfieldBloc extends Bloc<TextfieldEvent, TextfieldState> {
  TextfieldBloc() : super(TextfieldInitial()) {
    on<NameFieldTypeEvent>((event, emit) {
      // on initial state is TextfieldInitial State so it has no copywith method so chekcing...
      if (state is TextfieldTypeingState) {
        final currentState = state as TextfieldTypeingState;
        emit(currentState.copyWith(argName: event.name));
      } else {
        emit(TextfieldTypeingState(name: event.name));
      }
    });
    on<SummitEvent>((event, emit) {
      emit(TextfieldInitial(user: event.userDetails));
    });
  }
}
