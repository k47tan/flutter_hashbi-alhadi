import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ContactEvent {}

class AddContactEvent extends ContactEvent {
  final Map<String, String> contactDetails;

  AddContactEvent(this.contactDetails);
}

class UpdateContactEvent extends ContactEvent {
  final int index;
  final Map<String, String> updatedContactDetails;

  UpdateContactEvent(this.index, this.updatedContactDetails);
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  DeleteContactEvent(this.index);
}

class ContactBloc extends Bloc<ContactEvent, List<Map<String, String>>> {
  ContactBloc() : super([]) {
    on<AddContactEvent>(_handleAddContact);
    on<UpdateContactEvent>(_handleUpdateContact);
    on<DeleteContactEvent>(_handleDeleteContact);
  }

  void _handleAddContact(
      AddContactEvent event, Emitter<List<Map<String, String>>> emit) {
    _addContact(event.contactDetails);
    emit(List.from(_contactsList));
  }

  void _handleUpdateContact(
      UpdateContactEvent event, Emitter<List<Map<String, String>>> emit) {
    _updateContact(event.index, event.updatedContactDetails);
    emit(List.from(_contactsList));
  }

  void _handleDeleteContact(
      DeleteContactEvent event, Emitter<List<Map<String, String>>> emit) {
    _deleteContact(event.index);
    emit(List.from(_contactsList));
  }

  final List<Map<String, String>> _contactsList = [];

  void _addContact(Map<String, String> contactDetails) {
    _contactsList.add(contactDetails);
  }

  void _updateContact(int index, Map<String, String> updatedContactDetails) {
    if (index >= 0 && index < _contactsList.length) {
      _contactsList[index] = updatedContactDetails;
    }
  }

  void _deleteContact(int index) {
    if (index >= 0 && index < _contactsList.length) {
      _contactsList.removeAt(index);
    }
  }
}
