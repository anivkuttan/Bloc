import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit()
      : super(
          ThemeCubitInitial(initialValue: 0, initialTheme: ThemeData.light()),
        );

  themeChange() {
    if (state.theme == ThemeData.dark()) {
      emit(
        ThemeCubitInitial(
            initialTheme: ThemeData.light(), initialValue: state.counterValue),
      );
    } else {
      emit(
        ThemeCubitInitial(
            initialTheme: ThemeData.dark(), initialValue: state.counterValue),
      );
    }
  }

  incrementCountCubit() {
    var counter = state.counterValue + 1;
    emit(
      CounterIncrementCubit(incrementValue: counter, currentTheme: state.theme),
    );
  }

  decrementCountCubit() {
    var counter = state.counterValue - 1;
    emit(
      CounterDecrementCubit(decrementValue: counter, currentTheme: state.theme),
    );
  }
}
