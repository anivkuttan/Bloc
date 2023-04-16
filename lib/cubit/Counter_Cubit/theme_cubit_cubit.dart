import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit()
      : super(
          ThemeCubitInitial(
              initialValue: 0,
              initialTheme: ThemeData.light(),
              currentThemeText: "Light"),
        );

  themeChange() {
    /// checking the current state theme
    /// and emit the initial theme state
    /// with new Theme and same counter value

    if (state.theme == ThemeData.dark()) {
      emit(
        ThemeCubitInitial(
            initialTheme: ThemeData.light(),
            initialValue: state.counterValue,
            currentThemeText: "Light"),
      );
    } else {
      emit(
        ThemeCubitInitial(
            initialTheme: ThemeData.dark(),
            initialValue: state.counterValue,
            currentThemeText: "Dark"),
      );
    }
  }

  incrementCountCubit() {
    /// adding the counter value the emit the incrementalState
    var counter = state.counterValue + 1;
    emit(
      CounterIncrementCubit(
        incrementValue: counter,
        currentTheme: state.theme,
        currentThemeText: state.themeText,
      ),
    );
  }

  decrementCountCubit() {
    var counter = state.counterValue - 1;
    emit(
      CounterDecrementCubit(
        decrementValue: counter,
        currentTheme: state.theme,
        currentThemeText: state.themeText,
      ),
    );
  }
}
