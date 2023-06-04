import 'package:bloc_sample/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/Counter_Bloc/counter_bloc.dart';
import 'Bloc/Next_Page_Data_Transfer/data_transfer_bloc.dart';
import 'Bloc/Text_Field_Bloc/text_fiels_view.dart';
import 'Bloc/Text_Field_Bloc/textfield_bloc.dart';
import 'cubit/Counter_Cubit/theme_cubit_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (_) => CounterBloc(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<DataTransferBloc>(
          create: (_) => DataTransferBloc(),
        ),
        BlocProvider<TextfieldBloc>(
          create: (_) => TextfieldBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.theme,
            home: PageView(
              children: const [
                // CounterCubitView(),
                // CounterBlocView(),
                // DataTransferView(),
                TextFieldView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
