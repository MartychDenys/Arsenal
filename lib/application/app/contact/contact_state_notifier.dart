import '../../../domain/contact/contact.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final contactStateNotifier = StateNotifierProvider<ContactStateNotifier>(
  (ref) => ContactStateNotifier(),
);

class ContactStateNotifier extends StateNotifier<Contact> {
  ContactStateNotifier() : super(null);

  void updateContact(Contact contact) {
    state = Contact(
      status: contact.status,
      data: contact.data,
    );
  }

  void clearContact() {
    state = null;
  }
}
