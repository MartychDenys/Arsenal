import '../../../domain/contact/contact.dart';
import 'contact_state_notifier.dart';
import '../../../infrastructure/contact/contact_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final contactFutureProvider = FutureProvider.autoDispose
    .family<Contact, String>((ref, String token) async {
  final contact = await ContactService().getContact(token);
  ref.read(contactStateNotifier).updateContact(contact);
  return contact;
});
