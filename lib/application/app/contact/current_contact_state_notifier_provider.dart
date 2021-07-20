import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/contact/current_contact.dart';

final currentContactStateNotifierProvider =
    StateNotifierProvider<ContactDataStateNotifier>(
  (ref) => ContactDataStateNotifier(),
);

class ContactDataStateNotifier extends StateNotifier<String> {
  ContactDataStateNotifier() : super(null);

  void updateContactData(String currentContact) {
    state = currentContact;
  }
}
