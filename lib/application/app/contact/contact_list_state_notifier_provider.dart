import 'package:arsenal_app/domain/contact/contact.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final contactListStateNotifierProvider =
    StateNotifierProvider<ContactListStateNotifier>(
  (ref) => ContactListStateNotifier(),
);

class ContactListStateNotifier extends StateNotifier<Contact> {
  ContactListStateNotifier() : super(null);

  void updateContactData(Contact contactData) {
    state = Contact(
      status: contactData.status,
      data: contactData.data,
    );
  }
}
