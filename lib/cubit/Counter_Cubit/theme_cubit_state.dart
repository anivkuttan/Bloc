part of 'theme_cubit_cubit.dart';

@immutable
abstract class ThemeCubitState {
  final ThemeData theme;
  final int counterValue;
  final String themeText;
  const ThemeCubitState(
      {required this.counterValue,
      required this.theme,
      required this.themeText});
}

class ThemeCubitInitial extends ThemeCubitState {
  final int initialValue;
  final ThemeData initialTheme;
  final String currentThemeText;
  const ThemeCubitInitial(
      {required this.currentThemeText,
      required this.initialTheme,
      required this.initialValue})
      : super(
            counterValue: initialValue,
            theme: initialTheme,
            themeText: currentThemeText);
}

class CounterIncrementCubit extends ThemeCubitState {
  /// getting incremental value and current thame
  /// and pass through the super class
  final int incrementValue;
  final ThemeData currentTheme;
  final String currentThemeText;
  const CounterIncrementCubit(
      {required this.incrementValue,
      required this.currentThemeText,
      required this.currentTheme})
      : super(
            counterValue: incrementValue,
            theme: currentTheme,
            themeText: currentThemeText);
}

class CounterDecrementCubit extends ThemeCubitState {
  final int decrementValue;
  final ThemeData currentTheme;
  final String currentThemeText;
  const CounterDecrementCubit(
      {required this.decrementValue,
      required this.currentThemeText,
      required this.currentTheme})
      : super(
            counterValue: decrementValue,
            theme: currentTheme,
            themeText: currentThemeText);
}
