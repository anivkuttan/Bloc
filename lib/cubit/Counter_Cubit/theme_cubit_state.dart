part of 'theme_cubit_cubit.dart';

@immutable
abstract class ThemeCubitState {
  final ThemeData theme;
  final int counterValue;
  const ThemeCubitState({required this.counterValue, required this.theme});
}

class ThemeCubitInitial extends ThemeCubitState {
  final int initialValue;
  final ThemeData initialTheme;
  const ThemeCubitInitial(
      {required this.initialTheme, required this.initialValue})
      : super(counterValue: initialValue, theme: initialTheme);
}

class CounterIncrementCubit extends ThemeCubitState {
  final int incrementValue;
  final ThemeData currentTheme;
  const CounterIncrementCubit(
      {required this.incrementValue, required this.currentTheme})
      : super(counterValue: incrementValue, theme: currentTheme);
}

class CounterDecrementCubit extends ThemeCubitState {
  final int decrementValue;
  final ThemeData currentTheme;
  const CounterDecrementCubit(
      {required this.decrementValue, required this.currentTheme})
      : super(counterValue: decrementValue, theme: currentTheme);
}
