import 'package:bloc_sample/Bloc/Text_Field_Bloc/textfield_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/user.dart';

class TextFieldView extends StatefulWidget {
  const TextFieldView({Key? key}) : super(key: key);

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // Unfocus the keyboard after the screen is loaded
    //   FocusScope.of(context).unfocus();
    // });
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Bloc'),
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Name';
                  } else if (value.length >= 6) {
                    return 'Typed Name should be under 6';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                onChanged: (v) {
                  if (nameController.text.length >= 5) {
                    _key.currentState!.validate();
                  }
                  if (v.length <= 5) {
                    context
                        .read<TextfieldBloc>()
                        .add(NameFieldTypeEvent(name: v));
                  }
                },
              ),
              TextFormField(
                maxLength: 2,
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'age',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: numberController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                ),
              ),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  hintText: 'Address',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bool? validation = _key.currentState?.validate();
                      if (validation ?? false) {
                        debugPrint('Validation completed');
                        User user = User(
                          name: nameController.text,
                          age: int.parse(ageController.text),
                          address: addressController.text,
                          number: int.parse(numberController.text),
                        );
                        context
                            .read<TextfieldBloc>()
                            .add(SummitEvent(userDetails: user));
                      } else {
                        debugPrint('Validation Error');
                        return;
                      }
                    },
                    child: const Text('Summit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _key.currentState?.reset();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
              Container(
                color: Colors.black26,
                height: 200,
                width: double.infinity,
                child: BlocBuilder<TextfieldBloc, TextfieldState>(
                  builder: (context, state) {
                    if (state is TextfieldInitial) {
                      User? user = state.user;
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(user?.name ?? ''),
                            Text("${user?.age ?? ''}"),
                            Text("${user?.number ?? ''}"),
                            Text(user?.address ?? ''),
                          ]);
                    } else {
                      return Column(
                        children: [
                          BlocBuilder<TextfieldBloc, TextfieldState>(
                            builder: (context, state) {
                              if (state is TextfieldTypeingState) {
                                return Chip(
                                  label: Text(state.name),
                                );
                              }
                              return const Chip(
                                label: Text('Ani'),
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
