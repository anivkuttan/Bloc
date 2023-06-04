part of 'textfield_bloc.dart';

abstract class TextfieldEvent {}

class NameFieldTypeEvent extends TextfieldEvent {
  final String name;
  NameFieldTypeEvent({required this.name});
}

class AgeFieldTypeEvent extends TextfieldEvent {
  final String age;
  AgeFieldTypeEvent({required this.age});
}

class PhoneNumberFieldTypeEvent extends TextfieldEvent {
  final String number;
  PhoneNumberFieldTypeEvent({required this.number});
}

class AddressFieldTypeEvent extends TextfieldEvent {
  final String address;
  AddressFieldTypeEvent({required this.address});
}

class ClearAllEvent extends TextfieldEvent {}

class SummitEvent extends TextfieldEvent {
  final User userDetails;
  SummitEvent({required this.userDetails});
}
