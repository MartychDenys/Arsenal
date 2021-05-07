import '../../domain/contact/contact.dart';
import 'contact_provider.dart';

class ContactService {
  final _contactApiService = ContactProvider();

  Future<Contact> getContact(String token) async {
    return _contactApiService.getUserContact(token);
  }
}
